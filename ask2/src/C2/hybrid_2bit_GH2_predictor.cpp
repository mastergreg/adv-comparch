/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
* File Name : hybrid_2bit_GH2_predictor.cpp
* Creation Date : 27-05-2012
* Last Modified : Sun 27 May 2012 10:36:41 PM EEST
* Created By : Greg Liras <gregliras@gmail.com>
_._._._._._._._._._._._._._._._._._._._._.*/




#include "hybrid_2bit_GH2_predictor.h"


hybrid_2bit_GH2_predictor::hybrid_2bit_GH2_predictor(int entries): hybrid_predictor(entries)
{
	preds[0] = new nbit_predictor(2);
	preds[1] = new globalhistory_predictor();
}
