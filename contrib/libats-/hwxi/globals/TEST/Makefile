#
# A simple Makefile
# for testing libats-hwxi/globals
#

######

CC=gcc

######

PATSHOMEQ="$(PATSHOME)"

######

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSOPT=$(PATSHOMEQ)/bin/patsopt

######

PATSLIB=$(PATSHOME)/ccomp/atslib/lib

######

PATSCCOMP=$(CC) -D_XOPEN_SOURCE -I${PATSHOME} -I${PATSHOME}/ccomp/runtime

######

export PATSCCOMP

######

all::

######

all:: test01
all:: test02
all:: test03
all:: test04
all:: test05-1
all:: test05-2

######

test01: \
  test01.dats ; $(PATSCC) -o $@ $<
cleanall:: ; $(RMF) test01

######

test02: \
  test02.dats ; $(PATSCC) -o $@ $<
cleanall:: ; $(RMF) test02

######

test03: \
  test03.dats ; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
cleanall:: ; $(RMF) test03

######

test04: \
  test04.dats ; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
cleanall:: ; $(RMF) test04

######

test05-1: \
  test05-1.dats ; \
  $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $< -L$(PATSLIB) -latslib
cleanall:: ; $(RMF) test05-1

######

test05-2: \
  test05-2.dats ; \
  $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $< -L$(PATSLIB) -latslib
cleanall:: ; $(RMF) test05-2

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o *_?ats.c
clean:: ; $(RMF) *_atxt.txt
clean:: ; $(RMF) *_atxt.dats

cleanall:: clean

######

###### end of [Makefile] ######
