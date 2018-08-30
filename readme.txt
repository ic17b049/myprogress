LINUX:
	make all
		kompilieren von myprogress
	make debug
		kompilieren von myprogress mit DEBUG Switch

	getestet mit:
		Linux Ubuntu 18.04.1 LTS (GCC 7.3.0)
		
Windows(Developer Command Prompt for VS 2017):
	cl myprogress.c progress.c
		kompilieren von myprogress
	cl /DDEBUG myprogress.c progress.c
		kompilieren von myprogress mit DEBUG Switch
		
	getestet mit;
		Windows 10(1803) (CL Version 19.15.26726 für x86)