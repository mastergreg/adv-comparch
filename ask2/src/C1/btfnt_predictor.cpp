/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
 * File Name : btfnt_predictor.cpp
 * Creation Date : 19-05-2012
 * Last Modified : Sat 19 May 2012 10:15:55 PM EEST
 * Created By : Greg Liras <gregliras@gmail.com>
 _._._._._._._._._._._._._._._._._._._._._.*/
#include "btfnt_predictor.h"

void btfnt_predictor::target(bool t)
{
    jump = t;
}
branch_update *btfnt_predictor::predict (branch_info & b)
{
    bi = b;
    if (b.br_flags & BR_CONDITIONAL) {
        if (jump) u.direction_prediction
            (true);
        else u.direction_prediction (false);
    } else {
        u.direction_prediction (true);
    }
    u.target_prediction (0);
    return &u;
}
void btfnt_predictor::update (branch_update *u, bool taken, unsigned int target)
{

}
