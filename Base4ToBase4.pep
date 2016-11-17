br      main
         msg1:   .ascii"Input a number in base 4: \x00"
         msg2:   .ascii"The decimal equivalent is \x00"
         msg3:   .ascii"Do you want to input another number (answer y or n)? \x00"
         msg4:   .ascii"Thank you. Good-bye \x00" 
         in:     .block 2 
         j:      .word 0
         n:      .word 0
         k:      .word 0
         m:      .word 0
         p:      .word 0
         digit:   .word 0
         div:    .word 0
         sub:    .word 0
         rem:    .word 0
         negj:    .block 2 
         sunrem: .block 2
         total:  .block 2
         pow:    .block 2
         finres: .word 0
         ans:    .block 2
         


main:    stro   msg1 ,d
         deci    in ,d
         deco    in ,d
         charo   '\n' ,i

         lda     0 ,i
         sta     total ,d
         lda     0 ,i
         sta     digit ,d 
         lda     in ,d
         sta     div ,d
         
for1:    lda     in ,d
         cpa     0 ,i
         brle    endFor1
         lda     0, i;j =0 
         sta     j,d
         lda     in ,d
         sta     div ,d;div =in

for2:    lda     div,d
         cpa     0 ,i ;div<0
         brle    endFor2
         lda     div ,d
         suba    10 ,i
         sta     div ,d
         lda     j ,d 
              
         adda    1,i
                  
         sta     j,d 

         br      for2       
endFor2: lda     0 ,i
         sta     n,d
         lda     j,d
         suba    1,i
         sta     j,d
         lda     0 ,i
         sta     sub ,d
for3:    lda     n,d
         cpa     j ,d
         brge    endFor3
         lda     sub ,d
         adda    10 ,i
         sta     sub ,d

         lda     n,d
         adda    1,i
         sta     n ,d

         br      for3
endFor3: lda j ,d

         sta j ,d
         lda     digit ,d 
         adda    1 ,i
         sta     digit ,d 
         lda     digit ,d
         suba    1 ,i
         sta     negj,d
         lda     sub ,d
         suba    in ,d
         nega    
         sta     rem ,d

         lda     rem ,d

         sta     negj,s

         lda     negj ,d 
         cpa     0 ,i
         breq    zerocase;if(negj == 0) power equals 1

         lda     negj ,d
         cpa     1 ,i
         breq    onecase

         lda     negj ,d
         cpa     2 ,i
         breq    twocase

       

zerocase:lda     1 ,i
         sta     pow ,d    
          
         br      endFor6 
onecase: lda     4 ,i
         sta     pow ,d
         br      finadd
twocase: lda     16 ,i
         sta     pow ,d 
         br      finadd
finadd:  lda     rem ,d
         cpa     1 ,i 
         breq    remone
         lda     2, i
         sta     p ,d;p=0
for6:    lda     p ,d
         cpa     pow ,d         
         brge    endFor6


         lda     rem ,d
         adda    rem ,d
         sta     rem ,d 

         lda     p ,d 
         adda    1 ,i
         sta     p ,d
         br      for6
remone:  lda     pow ,d
         sta     rem ,d
         br      endFor6
endFor6: lda     total ,d
         adda    rem ,d
         sta     total ,d
         lda     j ,d
         sta     in ,d
         lda     0 ,i
         sta     pow ,d


         br      for1
endFor1: stro    msg2 ,d
         deco    total ,d  
         charo   '\n' ,i  
         stro    msg3,d
         chari   ans ,d
         charo   ans ,d
         charo   '\n' ,i
         ldbytea ans ,d
         cpa     121 ,i 
         breq    main
      
         ldbytea 110 ,i
         breq    bye
bye:     stro    msg4 ,d
         
stop

         stop
         .end
