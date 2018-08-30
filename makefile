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

.PHONY: distclean
distclean: clean
	$(RM) -r doc

 doc: html pdf

.PHONY: html
html:
	$(DOXYGEN) Doxyfile.dcf

pdf: html
	$(CD) doc/pdf && \
	$(MV) refman.tex refman_save.tex && \
	$(GREP) -v $(EXCLUDE_PATTERN) refman_save.tex > refman.tex && \
	$(RM) refman_save.tex && \
	make && \
	$(MV) refman.pdf refman.save && \
	$(RM) *.pdf *.html *.tex *.aux *.sty *.log *.eps *.out *.ind *.idx \
	      *.ilg *.toc *.tps Makefile && \
	$(MV) refman.save refman.pdf

##
## ---------------------------------------------------------- dependencies --
##

##
## =================================================================== eof ==
##
