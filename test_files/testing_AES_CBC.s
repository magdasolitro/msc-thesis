	.text
	.intel_syntax noprefix
	.file	"testing_AES_CBC.c"
	.file	1 "/usr/include/openssl/aes.h"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin0:
	.file	2 "testing_AES_CBC.c"
	.loc	2 12 0                  # testing_AES_CBC.c:12:0
	.cfi_startproc
# %bb.0:                                # %entry
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 336
	movabs	rdx, offset .L.str
	lea	rdi, [rbp - 64]
.Ltmp0:
	.loc	2 13 25 prologue_end    # testing_AES_CBC.c:13:25
	mov	rax, qword ptr [.Lmain.in]
	mov	qword ptr [rbp - 48], rax
	mov	rax, qword ptr [.Lmain.in+8]
	mov	qword ptr [rbp - 40], rax
	.loc	2 15 12                 # testing_AES_CBC.c:15:12
	mov	qword ptr [rbp - 8], 16
	.loc	2 16 25                 # testing_AES_CBC.c:16:25
	mov	rax, qword ptr [.Lmain.key]
	mov	qword ptr [rbp - 32], rax
	mov	rax, qword ptr [.Lmain.key+8]
	mov	qword ptr [rbp - 24], rax
.Ltmp1:
	#DEBUG_VALUE: main:ivec <- [%rdi+0]
	.loc	2 21 5                  # testing_AES_CBC.c:21:5
	mov	esi, 16
	call	klee_make_symbolic
.Ltmp2:
	.loc	2 0 5 is_stmt 0         # testing_AES_CBC.c:0:5
	lea	rdx, [rbp - 328]
	lea	rdi, [rbp - 32]
	.loc	2 23 5 is_stmt 1        # testing_AES_CBC.c:23:5
	mov	esi, 128
	call	AES_set_encrypt_key
	lea	rcx, [rbp - 328]
	lea	r8, [rbp - 64]
	lea	rsi, [rbp - 80]
	lea	rdi, [rbp - 48]
	.loc	2 25 54                 # testing_AES_CBC.c:25:54
	mov	rdx, qword ptr [rbp - 8]
	.loc	2 25 5 is_stmt 0        # testing_AES_CBC.c:25:5
	mov	r9d, 1
	call	AES_cbc_encrypt
	.loc	2 27 1 is_stmt 1        # testing_AES_CBC.c:27:1
	xor	eax, eax
	add	rsp, 336
	pop	rbp
	ret
.Ltmp3:
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.Lmain.in,@object       # @main.in
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.Lmain.in:
	.asciz	"Hello, world!\000\000"
	.size	.Lmain.in, 16

	.type	.Lmain.key,@object      # @main.key
	.p2align	4
.Lmain.key:
	.ascii	"\000\021\"3DUfw\210\231\252\273\314\335\356\377"
	.size	.Lmain.key, 16

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"ivec"
	.size	.L.str, 5

	.file	3 "/tmp/llvm-60-install_O_D_A/lib/clang/6.0.1/include/stddef.h"
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 6.0.1 (branches/release_60 355598)" # string offset=0
.Linfo_string1:
	.asciz	"testing_AES_CBC.c"     # string offset=49
.Linfo_string2:
	.asciz	"/home/klee/shareddir/msc-thesis" # string offset=67
.Linfo_string3:
	.asciz	"unsigned char"         # string offset=99
.Linfo_string4:
	.asciz	"rd_key"                # string offset=113
.Linfo_string5:
	.asciz	"unsigned int"          # string offset=120
.Linfo_string6:
	.asciz	"sizetype"              # string offset=133
.Linfo_string7:
	.asciz	"rounds"                # string offset=142
.Linfo_string8:
	.asciz	"int"                   # string offset=149
.Linfo_string9:
	.asciz	"aes_key_st"            # string offset=153
.Linfo_string10:
	.asciz	"AES_KEY"               # string offset=164
.Linfo_string11:
	.asciz	"main"                  # string offset=172
.Linfo_string12:
	.asciz	"in"                    # string offset=177
.Linfo_string13:
	.asciz	"out"                   # string offset=180
.Linfo_string14:
	.asciz	"len"                   # string offset=184
.Linfo_string15:
	.asciz	"long unsigned int"     # string offset=188
.Linfo_string16:
	.asciz	"size_t"                # string offset=206
.Linfo_string17:
	.asciz	"key"                   # string offset=213
.Linfo_string18:
	.asciz	"aes_key"               # string offset=217
.Linfo_string19:
	.asciz	"ivec"                  # string offset=225
	.section	.debug_abbrev,"",@progbits
	.byte	1                       # Abbreviation Code
	.byte	17                      # DW_TAG_compile_unit
	.byte	1                       # DW_CHILDREN_yes
	.byte	37                      # DW_AT_producer
	.byte	14                      # DW_FORM_strp
	.byte	19                      # DW_AT_language
	.byte	5                       # DW_FORM_data2
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	16                      # DW_AT_stmt_list
	.byte	23                      # DW_FORM_sec_offset
	.byte	27                      # DW_AT_comp_dir
	.byte	14                      # DW_FORM_strp
	.ascii	"\264B"                 # DW_AT_GNU_pubnames
	.byte	25                      # DW_FORM_flag_present
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	2                       # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
	.byte	38                      # DW_TAG_const_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
	.byte	22                      # DW_TAG_typedef
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	19                      # DW_TAG_structure_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
	.byte	13                      # DW_TAG_member
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	56                      # DW_AT_data_member_location
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	297                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.debug_abbrev           # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x122 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_GNU_pubnames
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x5 DW_TAG_pointer_type
	.long	47                      # DW_AT_type
	.byte	3                       # Abbrev [3] 0x2f:0x5 DW_TAG_const_type
	.long	52                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x34:0x7 DW_TAG_base_type
	.long	.Linfo_string3          # DW_AT_name
	.byte	8                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	2                       # Abbrev [2] 0x3b:0x5 DW_TAG_pointer_type
	.long	64                      # DW_AT_type
	.byte	3                       # Abbrev [3] 0x40:0x5 DW_TAG_const_type
	.long	69                      # DW_AT_type
	.byte	5                       # Abbrev [5] 0x45:0xb DW_TAG_typedef
	.long	80                      # DW_AT_type
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	86                      # DW_AT_decl_line
	.byte	6                       # Abbrev [6] 0x50:0x21 DW_TAG_structure_type
	.long	.Linfo_string9          # DW_AT_name
	.byte	244                     # DW_AT_byte_size
	.byte	1                       # DW_AT_decl_file
	.byte	78                      # DW_AT_decl_line
	.byte	7                       # Abbrev [7] 0x58:0xc DW_TAG_member
	.long	.Linfo_string4          # DW_AT_name
	.long	113                     # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	82                      # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	7                       # Abbrev [7] 0x64:0xc DW_TAG_member
	.long	.Linfo_string7          # DW_AT_name
	.long	139                     # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	84                      # DW_AT_decl_line
	.byte	240                     # DW_AT_data_member_location
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0x71:0xc DW_TAG_array_type
	.long	125                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x76:0x6 DW_TAG_subrange_type
	.long	132                     # DW_AT_type
	.byte	60                      # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	4                       # Abbrev [4] 0x7d:0x7 DW_TAG_base_type
	.long	.Linfo_string5          # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	10                      # Abbrev [10] 0x84:0x7 DW_TAG_base_type
	.long	.Linfo_string6          # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	4                       # Abbrev [4] 0x8b:0x7 DW_TAG_base_type
	.long	.Linfo_string8          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	11                      # Abbrev [11] 0x92:0x70 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string11         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	139                     # DW_AT_type
                                        # DW_AT_external
	.byte	12                      # Abbrev [12] 0xab:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	80
	.long	.Linfo_string12         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	258                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0xb9:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.long	.Linfo_string13         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	270                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0xc8:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string14         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	282                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0xd6:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	96
	.long	.Linfo_string17         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	16                      # DW_AT_decl_line
	.long	258                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0xe4:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\270}"
	.long	.Linfo_string18         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.long	69                      # DW_AT_type
	.byte	12                      # Abbrev [12] 0xf3:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	64
	.long	.Linfo_string19         # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
	.long	270                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0x102:0xc DW_TAG_array_type
	.long	47                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x107:0x6 DW_TAG_subrange_type
	.long	132                     # DW_AT_type
	.byte	16                      # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0x10e:0xc DW_TAG_array_type
	.long	52                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x113:0x6 DW_TAG_subrange_type
	.long	132                     # DW_AT_type
	.byte	16                      # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x11a:0xb DW_TAG_typedef
	.long	293                     # DW_AT_type
	.long	.Linfo_string16         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	62                      # DW_AT_decl_line
	.byte	4                       # Abbrev [4] 0x125:0x7 DW_TAG_base_type
	.long	.Linfo_string15         # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
	.section	.debug_macinfo,"",@progbits
.Lcu_macro_begin0:
	.byte	0                       # End Of Macro List Mark
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end0-.LpubNames_begin0 # Length of Public Names Info
.LpubNames_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	301                     # Compilation Unit Length
	.long	146                     # DIE offset
	.asciz	"main"                  # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	301                     # Compilation Unit Length
	.long	69                      # DIE offset
	.asciz	"AES_KEY"               # External Name
	.long	80                      # DIE offset
	.asciz	"aes_key_st"            # External Name
	.long	125                     # DIE offset
	.asciz	"unsigned int"          # External Name
	.long	293                     # DIE offset
	.asciz	"long unsigned int"     # External Name
	.long	52                      # DIE offset
	.asciz	"unsigned char"         # External Name
	.long	139                     # DIE offset
	.asciz	"int"                   # External Name
	.long	282                     # DIE offset
	.asciz	"size_t"                # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 6.0.1 (branches/release_60 355598)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
