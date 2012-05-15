CXX		=	g++
CXXFLAGS	=	-g -O3 -Wall

all:		predict

predict:	predict.cc trace.cc predictor.h branch.h trace.h nbit_predictor.h gshare_predictor.h btb.h
		$(CXX) $(CXXFLAGS) -o predict predict.cc trace.cc

clean:
		rm -f predict
