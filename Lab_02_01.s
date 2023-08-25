.data
    A:      .word   0, 1, 2, 7, -8, 4, 5, 12, 11, -2, 6, 3
    B:      .word   0,0,0,0,0,0,0,0,0,0,0,0     # Reserve space for 12 words, the maximum possible size of B
    N:      .word   12     # size of vector A
    B_index: .word  0
    nl:    .string    "\n"
.bss
.text
.globl main
main:
    la   t0, A      # t0 points to current element in A
    la   a1, B      # t1 points to current position in B
    lw   a2, N      # Load N into t2
    li   a3, 0      # Initialize loop counter
    
    lw   t1, 0(t0)
    bltz t1, 44
    andi a5, t1, 1     
    bnez a5, 36   
    sw   t1, 0(a1)
    mv a0, t1
    
    li a7,1
    ecall
    
    la a0, nl
    
    li a7,4
    ecall
    
    addi a1, a1, 4  #increase memory address by a word
    addi t0, t0, 4
    addi a3, a3, 1  #increase counter by one
    bne  a3, a2, -60  #check whether the all of the elemnts are checked in the array
    
    li a7,10
    ecall