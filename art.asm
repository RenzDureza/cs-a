section .data
	art db "                                ,   __, ,", 0xa
	db     "               _.._         )\/(,-' (-' `.__", 0xa
	db     "              /_   `-.      )'_      ` _  (_    _.---._", 0xa
	db 	   "             // \     `-. ,'   `-.    _\`.  `.,'   ,--.\", 0xa
	db     "            // -.\       `        `.  \`.   `/   ,'   ||", 0xa
	db     "            || _ `\_         ___    )  )     \  /,-'  ||", 0xa
	db     "            ||  `---\      ,'__ \   `,' ,--.  \/---. //", 0xa
	db     "             \\  .---`.   / /  | |      |,-.\ |`-._ //", 0xa
	db     "              `..___.'|   \ |,-| |      |_  )||\___//", 0xa
	db     "                `.____/    \\\O| |      \o)// |____/", 0xa
	db     "                     /      `---/        \-'  \", 0xa
	db     "             	     |        ,'|,--._.--')    \", 0xa
	db     "                     \       /   `n     n'\    /", 0xa
	db     "                      `.   `<   .::`-,-'::.) ,'", 0xa    
	db     "                        `.   \-.____,^.   /,'", 0xa
	db     "                          `. ;`.,-V-.-.`v'", 0xa
	db     "                            \| \     ` \|\", 0xa
	db     "                             ;  `-^---^-'/", 0xa
	db     "                              `-.______,'", 0xa
	len equ $ - art	
section .text 
	global _start
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, art
	mov edx, len
	int 0x80

	mov eax, 1
	int 0x80
	
	
