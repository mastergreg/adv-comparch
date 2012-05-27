/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
* File Name : hybrid_predictor.cpp
* Creation Date : 27-05-2012
* Last Modified : Sun 27 May 2012 04:52:03 AM EEST
* Created By : Greg Liras <gregliras@gmail.com>
_._._._._._._._._._._._._._._._._._._._._.*/

#include "hybrid_predictor.h"

hybrid_predictor::hybrid_predictor(int entries) : pht_entries(entries) 
{
	tab = new unsigned char[pht_entries];
	pht_bits_length = 2;
	counter_limit = 2;

	preds = new branch_predictor*[2];
	preds[0] = new globalhistory_predictor(8192, 2, 2);
	preds[1] = new globalhistory_predictor(8192, 2, 4);
}


branch_update *hybrid_predictor::predict (branch_info & b)
{
    bi = b;
    if (b.br_flags & BR_CONDITIONAL) {
        u.index =  (b.address & (pht_entries-1));
        u.pred = tab[u.index] >> (pht_bits_length - 1);
    } 
	u.ups[0] = (globalhistory_update *) preds[0]->predict(b);
	u.ups[1] = (globalhistory_update *) preds[1]->predict(b);
	u.direction_prediction(u.ups[u.pred]->direction_prediction());
	return &u; 
}
void hybrid_predictor::update (branch_update *u, bool taken, unsigned int target)
{
    if (bi.br_flags & BR_CONDITIONAL) {
        unsigned char *c = &tab[((hybrid_update*)u)->index];
		bool pred0_result = ((hybrid_update *)u)->ups[0]->direction_prediction() == taken; 
		bool pred1_result = ((hybrid_update *)u)->ups[1]->direction_prediction() == taken; 
		int meta_update = pred1_result - pred0_result;

		if (meta_update > 0 && *c < 3) 
				(*c)++;
		else if (meta_update < 0 && *c > 0)
				(*c)--;
		preds[0]->update(((hybrid_update *)u)->ups[0], taken, target);
		preds[1]->update(((hybrid_update *)u)->ups[1], taken, target);



    }
}
