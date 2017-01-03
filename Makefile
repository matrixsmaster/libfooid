OBJS = common.o \
	fooid.o \
	harmonics.o \
	regress.o \
	s_fft.o \
	spectrum.o
	
libfooid_test: libfooid main.o
#libfooid_test: $(OBJS) main.o
	gcc main.o -L. -lfooid -lsndfile -lresample -lm -o test
#	gcc -m32 main.o $(OBJS) -lsndfile -lresample -lm -o test

libfooid: $(OBJS)
	ar -r libfooid.a $(OBJS)

%.o : %.c
	gcc -g -c $< -o $@ -Wall -std=c99

clean:
	rm *.o libfooid.a test
