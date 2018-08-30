##
## @file Makefile
## ESS Progress Visualization Makefile
##
## @author Dominic Schebeck <ic17b049@technikum-wien.at>

## @date 2018/08/29
##
## @version 1.0
##
## 
##
## ------------------------------------------------------------- variables --
##

CC=gcc
CFLAGS= -Wall -Wextra -Wstrict-prototypes -Wformat=2 -pedantic -fno-common -ftrapv -O3 -g -std=gnu11
CP=cp
CD=cd
MV=mv
GREP=grep
DOXYGEN=doxygen

OBJECTS= progress.o myprogress.o

EXCLUDE_PATTERN=footrulewidth


##
## ----------------------------------------------------------------- rules --
##

%.o: %.c
	$(CC) $(CFLAGS) -c $<

##
## --------------------------------------------------------------- targets --
##

.PHONY: all
all: myprogress 

debug : CFLAGS += -DDEBUG
debug : all

myprogress: $(OBJECTS)
	$(CC) $(CFLAGS) myprogress.o progress.o -o myprogress 
	
	
.PHONY: clean
clean:
	$(RM) -f *.o *~ myprogress

##
## ---------------------------------------------------------- dependencies --
##

##
## =================================================================== eof ==
##
