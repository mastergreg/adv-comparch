/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
* File Name : hybrid_2bit_GH2_predictor.h
* Creation Date : 27-05-2012
* Last Modified : Sun 27 May 2012 10:45:58 PM EEST
* Created By : Greg Liras <gregliras@gmail.com>
_._._._._._._._._._._._._._._._._._._._._.*/




#ifndef HYBRID_2BIT_GH2_PREDICTOR_H
#define HYBRID_2BIT_GH2_PREDICTOR_H

#include "predictor.h"
#include "gshare_predictor.h"
#include "nbit_predictor.h"
#include "hybrid_predictor.h"

class hybrid_2bit_GH2_predictor : public hybrid_predictor
{
public:

	hybrid_2bit_GH2_predictor(int entries);


};


#endif
