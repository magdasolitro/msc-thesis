	.file "victim9.c"
	.text
	.globl victim_function
victim_function:
	.cfi_startproc
        cmpl      $0, (%rsi)                                    
        je        ..B1.3        
        movzbl    array1(%rdi), %eax                            
        shlq      $12, %rax                                     
        movb      array2(%rax), %dl                             
        andb      %dl, temp(%rip)  
..B1.3:                        
        ret              
	.cfi_endproc
