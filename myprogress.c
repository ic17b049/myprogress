#include <stdio.h>

#ifdef _WIN32
	#include <windows.h>
	#define sleepms(X) (Sleep(X))
#else
	#include <unistd.h>
	#define sleepms(X) usleep(X*1000)

#endif

#include <stdlib.h>
#include "progress.h"

#define PROCNR 4


int main(void) {
	unsigned int values = 0;
	unsigned int prog[PROCNR];
	unsigned int percent = 0;
	unsigned int tempSignNr= 0;
	char tempSign[4]={'-','\\','|','/'};
	
	init_io();
	
	while(values != 0xFFFFFFFF){
		unsigned int valsum =0 ;

		#ifdef DEBUG
			wait_key();
		#else
			sleepms(50);
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