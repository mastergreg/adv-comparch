/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
 * File Name : partA.c
 * Creation Date : 16-07-2012
 * Last Modified : Fri 20 Jul 2012 05:37:36 PM EEST
 * Created By : Greg Liras <gregliras@gmail.com>
 _._._._._._._._._._._._._._._._._._._._._.*/

#include <stdio.h>
#include <stdlib.h>
#define __MAGIC_CASSERT(p) do {                         \
    typedef int __check_magic_argument[(p) ? 1 : -1];   \
} while (0)

#define MAGIC(n) do {                       \
    __MAGIC_CASSERT(!(n));                  \
    __asm__ __volatile__ ("xchg %bx,%bx");  \
} while (0)

#define MAGIC_BREAKPOINT MAGIC(0)



inline int min(int a, int b)
{
    if(a<=b)return a;
    else return b;
}
void init_matrix(float **mat, int n) 
{    
    unsigned int i,j;
    for(i=0; i<n; i++)
        for(j=0; j<n; j++)
            mat[i][j] = (float)(i+j);
}
int main(int argc, char **argv)
{
    float **A,**B,**C;
    int i,j,k,N;
    int starti,stopi;
    int startj,stopj;
    int startk,stopk;
    int BS = atoi(argv[2]);
    N=atoi(argv[1]);
    A=(float**)malloc(N*sizeof(float*));

    for(i=0; i<N; i++)
        A[i]=(float*)malloc(N*sizeof(float));

    B=(float**)malloc(N*sizeof(float*));

    for(i=0; i<N; i++)
        B[i]=(float*)malloc(N*sizeof(float));

    C=(float**)malloc(N*sizeof(float*));

    for(i=0; i<N; i++)
        C[i]=(float*)malloc(N*sizeof(float));

    fprintf(stderr, "Initializing matrices...\n");
    init_matrix(A, N);
    init_matrix(B, N);
    init_matrix(C, N);
    MAGIC_BREAKPOINT;
    for(startj=0; startj<N; startj+=BS) {
        stopj = startj + BS;
        stopj = stopj <= N ? stopj : N;
        for(starti=0; starti<N; starti+=BS) {
            stopi = starti + BS;
            stopi = stopi <= N ? stopi : N;
            for(startk=0; startk<N; startk+=BS) {
                stopk = startk + BS;
                stopk = stopk <= N ? stopk : N;
                for(j=start; j<stop; j++)
                    for(i=start; i<stop; i++)
                        for(k=start; k<stop; k++)
                            C[i][j] += A[i][k]*B[k][j];
            }
        }
    }
    MAGIC_BREAKPOINT;
    return 0;
} 
