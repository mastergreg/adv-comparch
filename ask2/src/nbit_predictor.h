// nbit_predictor.h
// 
//

#include <math.h>

class nbit_update : public branch_update {
public:
	unsigned int index;
};

class nbit_predictor : public branch_predictor {
public:
#define NBP_TABLE_BITS	15  //number of entries = 2^15
	nbit_update u;
	branch_info bi;
	int counter_limit;
	int N_COUNTER_LENGTH;

	unsigned char tab[1<<NBP_TABLE_BITS];

	nbit_predictor (int length) :N_COUNTER_LENGTH(length) { 
		memset (tab, 0, sizeof (tab));
		counter_limit = ((int) pow(2.0, N_COUNTER_LENGTH)) - 1;
	}

	branch_update *predict (branch_info & b) {
		bi = b;
		if (b.br_flags & BR_CONDITIONAL) {
			u.index =  (b.address & ((1<<NBP_TABLE_BITS)-1));
			u.direction_prediction (tab[u.index] >> (N_COUNTER_LENGTH-1));
		} else {
			u.direction_prediction (true);
		}
		u.target_prediction (0);
		return &u;
	}

	void update (branch_update *u, bool taken, unsigned int target) {
		if (bi.br_flags & BR_CONDITIONAL) {
			unsigned char *c = &tab[((nbit_update*)u)->index];
			if (taken) {
				if (*c < counter_limit) (*c)++;
			} else {
				if (*c > 0) (*c)--;
			}
		}
	}
};
