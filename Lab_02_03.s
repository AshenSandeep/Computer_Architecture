.data
V:      .word   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  # Initialize V to all zeros
N:      .word   12
nl:    .string "\n"

.text
.globl main
main:
    la   t0, V         #add address of V to t0
    li   t1, 0         
    li   t2, 1         #counter
    sw   t1, 0(t0)     #store t1 value to V
    addi t0, t0, 4     #move the next element of the array
    sw   t2, 0(t0)     
    addi t0, t0, 4     #move the next element of the array    
    li   t3, 2         
    lw   t4, N
             
    add  t5, t1, t2    
    sw   t5, 0(t0)     
    mv   t1, t2        
    mv   t2, t5
    addi t0, t0, 4    #move the next element of the array  
    addi t3, t3, 1    #increament counter
    bne  t3, t4, -24    #loop

    la t0, V
    lw t1, N
    li t2, 0
    
    #print the fibonacci value
    lw a0, 0(t0)
    li a7,1
    ecall
    #go to next line
    la a0, nl
    li a7,4
    ecall
    
    addi t0, t0, 4
    addi t2, t2, 1  #increment counter
    bne t2, t1, -36    #loop
    
    li   a7, 10
    ecall