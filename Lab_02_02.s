.data
A:      .word   1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
B:      .word   -1,20,5,6,7,12,-8,0,-9,4,5,-18
C:      .word   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  # Initialize C to all zeros
N:      .word   12
nl:    .string "\n"

.text
.globl main
main:
    la   t0, A       # t0 points to current element in A
    la   t1, B       # t1 points to last element in B
    addi t1, t1, 44
    la   t2, C       # t2 points to current position in C
    lw   t3, N       # t3 = N
    li   t4, 0       # t4 is loop counter, initialize to 0
    
    lw   t5, 0(t0)  
    lw   t6, 0(t1)
    add  a1, t5, t6 
    bgtz a1, 8
    sub   a1, x0, a1
    sw   a1, 0(t2)
    
    #move the value of a1 to a0
    mv a0, a1
    
    #print value in a0 reg
    li a7,1
    ecall
    
    #go to next line
    la a0, nl
    li a7,4
    ecall
    
    addi t0, t0, 4       # Move to next element in A
    addi t1, t1, -4      # Move to previous element in B
    addi t2, t2, 4       # Move to next element in C
    addi t4, t4, 1       # Increment loop counter
    bne  t4, t3, -68     #loop

    li   a7, 10   # 10 is the exit system call number in RISC-V for the Spike simulator
    ecall