######
#
# for SHOOTOUT/mandelbrot
#
######

GCC=gcc

######

PATSCC=$(PATSHOME)/bin/patscc

######

all:: mandelbrot
all:: mandelbrot_v2df
all:: mandelbrot_v2df_smp
all:: mandelbrot_gcc4

######

mandelbrot: \
mandelbrot.dats ; \
$(PATSCC) -D_GNU_SOURCE -pipe -O3 -fomit-frame-pointer -march=native -std=c99 -mfpmath=sse -msse2 $< -o $@

######

mandelbrot_v2df: \
mandelbrot_v2df.dats ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -I$(PATSHOMERELOC)/contrib/libats-/hwxi -pipe -O3 -fomit-frame-pointer -march=native -std=c99 -mfpmath=sse -msse2 $< -o $@

######

mandelbrot_v2df_smp: \
mandelbrot_v2df_smp.dats ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -I$(PATSHOMERELOC)/contrib/libats-/hwxi -pipe -O3 -fomit-frame-pointer -march=native -std=c99 -mfpmath=sse -msse2 $< -o $@ -lpthread

######

mandelbrot_gcc4: mandelbrot_gcc4.c ; \
$(GCC) -pipe -Wall -O3 -fomit-frame-pointer -march=native -std=c99 -D_GNU_SOURCE -mfpmath=sse -msse2 -fopenmp $< -o $@

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) mandelbrot
cleanall:: ; $(RMF) mandelbrot_v2df
cleanall:: ; $(RMF) mandelbrot_v2df_smp
cleanall:: ; $(RMF) mandelbrot_gcc4

###### end of [Makefile] ######
