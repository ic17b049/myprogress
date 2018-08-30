#include <stdio.h>
#include <unistd.h>
#include "progress.h"
#include <stdlib.h>

#define PROCNR 4


int main(void) {
	unsigned int values;
	unsigned int prog[PROCNR];
	unsigned int percent = 0;
	unsigned int tempSignNr= 0;
	char tempSign[4]={'-','\\','|','/'};
	
	
	init_io();
	
	while(percent!=100){
		unsigned int valsum =0 ;

		#ifdef DEBUG
			wait_key();
		#else
			usleep(50000);
		#endif
		
		values =  get_progress();
		

		for(int i = 0;i<PROCNR;i++){
			prog[i] = (values>>(i*8)) & 0xFF;
			valsum += prog[i];
		}

		percent= (valsum/(255.0*PROCNR))*100;
		
		progressbar('=', tempSign[tempSignNr%4], ' ', percent);
		tempSignNr++;

		
	}
	printf("\n");
	
	shutdown_io();
	return 0;
}