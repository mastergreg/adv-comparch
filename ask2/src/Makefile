CXX		=	g++
CXXFLAGS	=	-g -O3 -Wall

SRCFILES	=	$(wildcard *.cpp)
OBJFILES	=	$(patsubst %.cpp, %.o, $(SRCFILES))


all:		predict

#predict:	predict.cpp trace.cpp predictor.h branch.h trace.h nbit_predictor.h gshare_predictor.h btb.h
#		$(CXX) $(CXXFLAGS) -o predict predict.cpp trace.cpp

predict:	$(OBJFILES)
		$(CXX) $(CXXFLAGS) $^ -o $@

%.o:		%.cpp
		$(CXX) $(CXXFLAGS) $^ -c -o $@
clean:
		rm -f predict

patch:
		patch -p1 trace.cpp < trace_master.patch
