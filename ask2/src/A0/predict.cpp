// predict.cc
// This file contains the main function.  The program accepts a single 
// parameter: the name of a trace file.  It drives the branch predictor
// simulation by reading the trace file and feeding the traces one at a time
// to the branch predictor.

#include <stdio.h>
#include <stdlib.h>
#include <string.h> 
#include <assert.h>

#include "branch.h"
#include "trace.h"
#include "predictor.h"
#include "nbit_predictor.h"		//the .h files of the branch predictors' implementations
#include "gshare_predictor.h"
#include "btb.h"

int main (int argc, char *argv[]) {

	// make sure there is one parameter

	if (argc != 2) {
		fprintf (stderr, "Usage: %s <filename>.gz\n", argv[0]);
		exit (1);
	}

	// open the trace file for reading

	init_trace (argv[1]);

	// initialize competitor's branch prediction code

	// you can use more than one predictor in an array of predictors!!!

	branch_predictor **p = new branch_predictor*[2];

	p[0] = new gshare_predictor();
	p[1] = new btb_predictor(512, 1);

	// some statistics to keep, currently just for conditional branches

	long long int 
		tmiss[2],	// number of target mispredictions
		dmiss[2]; 	// number of direction mispredictions

	for(int i = 0; i < 2; i++)
		dmiss[i] = tmiss[i] = 0;
	// keep looping until end of file

	for (;;) {

		// get a trace

		trace *t = read_trace ();

		// NULL means end of file

		if (!t) break;

		// send this trace to the competitor's code for prediction

		branch_update *u;

		u = p[0]->predict(t->bi);
		dmiss[0] += u->direction_prediction() != t->taken;
		p[0]->update(u, t->taken, t->target);
		
		u = p[1]->predict(t->bi);
		if (!(t->bi.br_flags & BR_RETURN)) {
			dmiss[1] += u->direction_prediction() != t->taken;
			if((t->taken == u->direction_prediction()) && (u->direction_prediction() ==true)) {
				tmiss[1] += u->target_prediction() != t->target;
			}
		}
		p[1]->update(u, t->taken, t->target);
	}

	// done reading traces

	end_trace ();

	// give final mispredictions per kilo-instruction and exit.
	// each trace represents exactly 100 million instructions.

	printf("gshare_pred: %0.3f MPKI\n",1000.0 * (dmiss[0]/1e8));
	printf("btb : direction_misses  %lld target_misses  %lld\n",dmiss[1], tmiss[1]);

	for(int i = 0; i < 2; i++)
		delete p[i];

	delete [] p;

	exit (0);
}
