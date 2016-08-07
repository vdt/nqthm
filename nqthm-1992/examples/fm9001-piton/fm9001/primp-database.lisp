;;;  Copyright (C) 1990-1994 Computational Logic, Inc.  All Rights
;;;  Reserved.  See the file LICENSE in this directory for the
;;;  complete license agreement.

;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;
;;;    PRIMP-DATABASE.LISP
;;;
;;;  We define the primitive database as a Common Lisp object so that it is
;;;  available to our netlist-to-NDL translator (see "translate.lisp"), and the
;;;  automatic primitive lemma generators (see "primitives.lisp").
;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(in-package "USER")

;;;  Abbreviations

(defconstant dp-ram-16x32-inputs
  '(read-a0 read-a1 read-a2 read-a3
            write-b0 write-b1 write-b2 write-b3
            wen
            d0  d1  d2  d3  d4  d5  d6  d7
            d8  d9  d10 d11 d12 d13 d14 d15
            d16 d17 d18 d19 d20 d21 d22 d23
            d24 d25 d26 d27 d28 d29 d30 d31))

(defconstant mem-32x32-inputs
  '(rw- strobe-

        a0  a1  a2  a3  a4  a5  a6  a7
        a8  a9  a10 a11 a12 a13 a14 a15
        a16 a17 a18 a19 a20 a21 a22 a23
        a24 a25 a26 a27 a28 a29 a30 a31

        d0  d1  d2  d3  d4  d5  d6  d7
        d8  d9  d10 d11 d12 d13 d14 d15
        d16 d17 d18 d19 d20 d21 d22 d23
        d24 d25 d26 d27 d28 d29 d30 d31
        ))

;;;  CONS-UP builds a quoted expression suitable for EVAL$.

(defun cons-up (list)
  (cond
   ((null list) ''NIL)
   (t `(CONS ,(car list) ,(cons-up (cdr list))))))

;;;  The database.

(defconstant
  common-lisp-primp-database
  `((ao2
     (delays        ((263 737) (83 392)))
     (drives        10)
     (input-types   boolp boolp boolp boolp)
     (inputs        a b c d)
     (loadings      1 1 1 1)
     (lsi-name      . ao2)
     (out-depends   (a b c d))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-nor (f-and a b) (f-and c d)))))

     (gates         . 2)
     (primitives    . 1)
     (transistors   . 8))


    (ao4
     (delays        ((260 895) (82 311)))
     (drives        10)
     (input-types   boolp boolp boolp boolp)
     (inputs        a b c d)
     (loadings      1 1 1 1)
     (lsi-name      . ao4)
     (out-depends   (a b c d))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-nand (f-or a b) (f-or c d)))))

     (gates         . 2)
     (primitives    . 1)
     (transistors   . 8))


    (ao6
     (delays        ((260 745) (82 202)))
     (drives        10)
     (input-types   boolp boolp boolp)
     (inputs        a b c)
     (loadings      1 1 1)
     (lsi-name      . ao6)
     (out-depends   (a b c))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-nor (f-and a b) c))))

     (gates         . 2)
     (primitives    . 1)
     (transistors   . 6))


    (ao7
     (delays        ((261 486) (83 293)))
     (drives        10)
     (input-types   boolp boolp boolp)
     (inputs        a b c)
     (loadings      1 1 1)
     (lsi-name      . ao7)
     (out-depends   (a b c))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-nand (f-or a b) c))))

     (gates         . 2)
     (primitives    . 1)
     (transistors   . 6))

    (b-and
     (delays        ((144 422) (54 707)))
     (drives        10)
     (input-types   boolp boolp)
     (inputs        a b)
     (loadings      1 1)
     (lsi-name      . an2)
     (out-depends   (a b))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-and a b))))

     (gates         . 2)
     (primitives    . 1)
     (transistors   . 6))


    (b-and3
     (delays        ((146 663) (58 809)))
     (drives        10)
     (input-types   boolp boolp boolp)
     (inputs        a b c)
     (loadings      1 1 1)
     (lsi-name      . an3)
     (out-depends   (a b c))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-and3 a b c))))

     (gates         . 2)
     (primitives    . 1)
     (transistors   . 8))


    (b-and4
     (delays        ((149 934) (60 870)))
     (drives        10)
     (input-types   boolp boolp boolp boolp)
     (inputs        a b c d)
     (loadings      1 1 1 1)
     (lsi-name      . an4)
     (out-depends   (a b c d))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-and4 a b c d))))

     (gates         . 3)
     (primitives    . 1)
     (transistors   . 10))


    (b-equv
     (delays        ((145 742) (67 973)))
     (drives        10)
     (input-types   boolp boolp)
     (inputs        a b)
     (loadings      1 2)
     (lsi-name      . en)
     (out-depends   (a b))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-equv a b))))

     (gates         . 3)
     (primitives    . 1)
     (transistors   . 12))


    (b-equv3
     (delays        ((151 1806) (79 1580)))
     (drives        10)
     (input-types   boolp boolp boolp)
     (inputs        a b c)
     (loadings      1 3 2)
     (lsi-name      . en3)
     (out-depends   (a b c))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-equv3 a b c))))

     (gates         . 7)
     (primitives    . 1)
     (transistors   . 22))


    (b-if
     (delays        ((70 775) (60 1040)))
     (drives        10)
     (input-types   boolp boolp boolp)
     (inputs        s a b)
     (loadings      2 1 1)
     (lsi-name      . (mux21h b a s))   ; Note input reordering
     (out-depends   (a b s))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-if s a b))))

     (gates         . 4)
     (primitives    . 1)
     (transistors   . 12))


    (b-nand
     (delays        ((141 420) (82 161)))
     (drives        10)
     (input-types   boolp boolp)
     (inputs        a b)
     (loadings      1 1)
     (lsi-name      . nd2)
     (out-depends   (a b))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-nand a b))))

     (gates         . 1)
     (primitives    . 1)
     (transistors   . 4))


    (b-nand3
     (delays        ((142 537) (109 322)))
     (drives        10)
     (input-types   boolp boolp boolp)
     (inputs        a b c)
     (loadings      1 1 1)
     (lsi-name      . nd3)
     (out-depends   (a b c))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-nand3 a b c))))

     (gates         . 2)
     (primitives    . 1)
     (transistors   . 6))


    (b-nand4
     (delays        ((144 588) (144 418)))
     (drives        10)
     (input-types   boolp boolp boolp boolp)
     (inputs        a b c d)
     (loadings      1 1 1 1)
     (lsi-name      . nd4)
     (out-depends   (a b c d))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-nand4 a b c d))))

     (gates         . 2)
     (primitives    . 1)
     (transistors   . 8))


    (b-nand5
     (delays        ((144 1002) (59 1120)))
     (drives        10)
     (input-types   boolp boolp boolp boolp boolp)
     (inputs        a b c d e)
     (loadings      1 1 1 1 1)
     (lsi-name      . nd5)
     (out-depends   (a b c d e))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-nand5 a b c d e))))

     (gates         . 4)
     (primitives    . 1)
     (transistors   . 16))


    (b-nand6
     (delays        ((144 982) (59 1090)))
     (drives        10)
     (input-types   boolp boolp boolp boolp boolp boolp)
     (inputs        a b c d e g)
     (loadings      1 1 1 1 1 1)
     (lsi-name      . nd6)
     (out-depends   (a b c d e g))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-nand6 a b c d e g))))

     (gates         . 5)
     (primitives    . 1)
     (transistors   . 18))


    (b-nand8
     (delays        ((144 1042) (60 1360)))
     (drives        10)
     (input-types   boolp boolp boolp boolp boolp boolp boolp boolp)
     (inputs        a b c d e g h i)
     (loadings      1 1 1 1 1 1 1 1)
     (lsi-name      . nd8)
     (out-depends   (a b c d e g h i))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-nand8 a b c d e g h i))))

     (gates         . 6)
     (primitives    . 1)
     (transistors   . 22))


    (b-nbuf
     (delays        ((142 447) (57 213))
                    ((143 302) (52 366)))
     (drives        9 10)
     (input-types   boolp)
     (inputs        a)
     (loadings      1)
     (lsi-name      . ivda)
     (out-depends   (a) (a))
     (output-types  boolp boolp)
     (outputs       y z)
     (results       . ,(cons-up '((f-not a) (f-buf a))))

     (gates         . 1)
     (primitives    . 1)
     (transistors   . 4))


    (b-nor
     (delays        ((260 460) (59 170)))
     (drives        10)
     (input-types   boolp boolp)
     (inputs        a b)
     (loadings      1 1)
     (lsi-name      . nr2)
     (out-depends   (a b))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-nor a b))))

     (gates         . 1)
     (primitives    . 1)
     (transistors   . 4))


    (b-nor3
     (delays        ((384 798) (59 224)))
     (drives        10)
     (input-types   boolp boolp boolp)
     (inputs        a b c)
     (loadings      1 1 1)
     (lsi-name      . nr3)
     (out-depends   (a b c))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-nor3 a b c))))

     (gates         . 2)
     (primitives    . 1)
     (transistors   . 6))


    (b-nor4
     (delays        ((510 1072) (59 225)))
     (drives        10)
     (input-types   boolp boolp boolp boolp)
     (inputs        a b c d)
     (loadings      1 1 1 1)
     (lsi-name      . nr4)
     (out-depends   (a b c d))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-nor4 a b c d))))

     (gates         . 2)
     (primitives    . 1)
     (transistors   . 8))


    (b-nor5
     (delays        ((145 1493) (55 767)))
     (drives        10)
     (input-types   boolp boolp boolp boolp boolp)
     (inputs        a b c d e)
     (loadings      1 1 1 1 1)
     (lsi-name      . nr5)
     (out-depends   (a b c d e))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-nor5 a b c d e))))

     (gates         . 4)
     (primitives    . 1)
     (transistors   . 16))


    (b-nor6
     (delays        ((146 1593) (55 807)))
     (drives        10)
     (input-types   boolp boolp boolp boolp boolp boolp)
     (inputs        a b c d e g)
     (loadings      1 1 1 1 1 1)
     (lsi-name      . nr6)
     (out-depends   (a b c d e g))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-nor6 a b c d e g))))

     (gates         . 5)
     (primitives    . 1)
     (transistors   . 18))


    (b-nor8
     (delays        ((146 1853) (54 767)))
     (drives        10)
     (input-types   boolp boolp boolp boolp boolp boolp boolp boolp)
     (inputs        a b c d e g h i)
     (loadings      1 1 1 1 1 1 1 1)
     (lsi-name      . nr8)
     (out-depends   (a b c d e g h i))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-nor8 a b c d e g h i))))

     (gates         . 6)
     (primitives    . 1)
     (transistors   . 22))


    (b-not
     (delays        ((70 235) (57 198)))
     (drives        10)       
     (input-types   boolp)
     (inputs        a)
     (loadings      2)
     (lsi-name      . iva)
     (out-depends   (a))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-not a))))

     (gates         . 1)
     (primitives    . 1)
     (transistors   . 3))


    (b-not-b4ip
     (delays        ((17 333) (12 124)))
     (drives        128)       
     (input-types   boolp)
     (inputs        a)
     (loadings      8)
     (lsi-name      . b4ip)
     (out-depends   (a))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-not a))))

     (gates         . 4)
     (primitives    . 1)
     (transistors   . 12))


    (b-not-ivap
     (delays        ((38 208) (35 126)))
     (drives        20)       
     (input-types   boolp)
     (inputs        a)
     (loadings      3)
     (lsi-name      . ivap)
     (out-depends   (a))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-not a))))

     (gates         . 2)
     (primitives    . 1)
     (transistors   . 6))


    (b-or
     (delays        ((143 332) (58 819)))
     (drives        10)
     (input-types   boolp boolp)
     (inputs        a b)
     (loadings      1 1)
     (lsi-name      . or2)
     (out-depends   (a b))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-or a b))))

     (gates         . 2)
     (primitives    . 1)
     (transistors   . 6))


    (b-or3
     (delays        ((144 422) (70 1185)))
     (drives        10)
     (input-types   boolp boolp boolp)
     (inputs        a b c)
     (loadings      1 1 1)
     (lsi-name      . or3)
     (out-depends   (a b c))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-or3 a b c))))

     (gates         . 2)
     (primitives    . 1)
     (transistors   . 8))


    (b-or4
     (delays        ((143 352) (78 1329)))
     (drives        10)
     (input-types   boolp boolp boolp boolp)
     (inputs        a b c d)
     (loadings      1 1 1 1)
     (lsi-name      . or4)
     (out-depends   (a b c d))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-or4 a b c d))))

     (gates         . 3)
     (primitives    . 1)
     (transistors   . 10))


    (b-xor
     (delays        ((145 742) (67 973)))
     (drives        10)
     (input-types   boolp boolp)
     (inputs        a b)
     (loadings      1 2)
     (lsi-name      . eo)
     (out-depends   (a b))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-xor a b))))

     (gates         . 3)
     (primitives    . 1)
     (transistors   . 12))


    (b-xor3
     (delays        ((151 1806) (79 1580)))
     (drives        10)
     (input-types   boolp boolp boolp)
     (inputs        a b c)
     (loadings      1 3 2)
     (lsi-name      . eo3)
     (out-depends   (a b c))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-xor3 a b c))))

     (gates         . 7)
     (primitives    . 1)
     (transistors   . 22))


    (del2
     (delays        ((70 2035) (38 2199)))
     (drives        10)       
     (input-types   boolp)
     (inputs        a)
     (loadings      1)
     (lsi-name      . del2)
     (out-depends   (a))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-buf a))))

     (gates         . 4)
     (primitives    . 1)
     (transistors   . 16))


    (del4
     (delays        ((73 4017) (38 4179)))
     (drives        10)       
     (input-types   boolp)
     (inputs        a)
     (loadings      1)
     (lsi-name      . del4)
     (out-depends   (a))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-buf a))))

     (gates         . 7)
     (primitives    . 1)
     (transistors   . 28))


    (del10
     (delays        ((60 10530) (49 10424)))
     (drives        10)       
     (input-types   boolp)
     (inputs        a)
     (loadings      1)
     (lsi-name      . del10)
     (out-depends   (a))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-buf a))))

     (gates         . 19)
     (primitives    . 1)
     (transistors   . 76))



    (procmon                            
     ;; Delay slopes are from MUX21H.  LSI flyer says delay through OR's is
     ;; at least twice the delay through the inverters, so intercepts are
     ;; approximately:    2*(30-IV's + ND2 + EN + MUX21H) ~= 25000.
     ;; (30*IV + NR2 + 90*(NR3+IVAP) + EN + MUX21H gives a much larger number.)
     (delays        ((70 25000) (60 25000)))
     (drives        10)
     (input-types   parametric parametric parametric parametric)
     (inputs        a e s n)
     (loadings      2 2 2 1)
     (lsi-name      . procmon)
     (out-depends   (a e s n))
     (output-types  parametric)
     (outputs       z)
     (results       . (cons (f-if s
                                  (f-if e
                                        (f-if a '*1*false '*1*false)
                                        a)
                                  n)
                            'nil))

     (gates         . 100)
     (primitives    . 1)
     (transistors   . 400))

    (dp-ram-16x32
     ;; delays: Slopes are one fourth of ND2 (b-nand) slopes.
     ;;         Intercepts came from LSI flyer.
     (delays        . ,(make-list 32
                                  :initial-element
                                  '((35 7500) (21 7500))))
     (drives        . ,(make-list 32 :initial-element 2))
     (input-types   boolp boolp boolp boolp
                    boolp boolp boolp boolp
                    level
                    boolp boolp boolp boolp boolp boolp boolp boolp
                    boolp boolp boolp boolp boolp boolp boolp boolp
                    boolp boolp boolp boolp boolp boolp boolp boolp
                    boolp boolp boolp boolp boolp boolp boolp boolp)
     (inputs        ,@dp-ram-16x32-inputs)
     (loadings      2 2 2 2
                    2 2 2 2
                    4
                    1 1 1 1 1 1 1 1  
                    1 1 1 1 1 1 1 1  
                    1 1 1 1 1 1 1 1  
                    1 1 1 1 1 1 1 1)
     (lsi-name      . cmrb100a)
     (new-states    . (dual-port-ram-state
                       '32 '4
                       ,(cons-up dp-ram-16x32-inputs)
                       state))
     (output-types  boolp boolp boolp boolp boolp boolp boolp boolp
                    boolp boolp boolp boolp boolp boolp boolp boolp
                    boolp boolp boolp boolp boolp boolp boolp boolp
                    boolp boolp boolp boolp boolp boolp boolp boolp)
     (out-depends   . ,(make-list
                        32
                        :initial-element
                        '(read-a0 read-a1 read-a2 read-a3)))
     (outputs       o0  o1  o2  o3  o4  o5  o6  o7
                    o8  o9  o10 o11 o12 o13 o14 o15
                    o16 o17 o18 o19 o20 o21 o22 o23
                    o24 o25 o26 o27 o28 o29 o30 o31)
     (results       . (dual-port-ram-value
                       '32 '4
                       ,(cons-up dp-ram-16x32-inputs)
                       state))
     (state-types   . (addressed-state 4 (ram ',(make-list 32 :initial-element
                                                           'boolp))))
     (states        . state)

     (gates         . 2368)
     (primitives    . 1)
     (transistors   . 9472))  ; Estimate: 4 * 2368


    (fd1
     (delays        ((147 1024) (55 1288))
                    ((145 1432) (53 1447)))
     (drives        10 10)
     (input-types   boolp clk)
     (inputs        d cp)
     (loadings      1 1)
     (lsi-name      . fd1)
     (new-states    . (f-buf d))
     (out-depends   () ())
     (output-types  boolp boolp)
     (outputs       q qn)
     (results       . ,(cons-up '((f-buf state) (f-not state))))
     (state-types   . boolp)
     (states        . state)
                  
     (gates         . 7)
     (primitives    . 1)
     (transistors   . 26))


    (fd1s
     (delays        ((147 1024) (55 1288))
                    ((145 1432) (53 1447)))
     (drives        10 10)
     (input-types   boolp clk boolp boolp)
     (inputs        d cp ti te)
     (loadings      1 1 1 2)
     (lsi-name      . fd1s)
     (new-states    . (f-if te ti d))
     (out-depends   () ())
     (output-types  boolp boolp)
     (outputs       q qn)
     (results       . ,(cons-up '((f-buf state) (f-not state))))
     (state-types   . boolp)
     (states        . state)
                  
     (gates         . 9)
     (primitives    . 1)
     (transistors   . 34))


    (fd1sp
     (delays        ((68 1084) (34 1327))
                    ((65 1712) (32 1596)))
     (drives        16 16)
     (input-types   boolp clk boolp boolp)
     (inputs        d cp ti te)
     (loadings      1 1 1 2)
     (lsi-name      . fd1sp)
     (new-states    . (f-if te ti d))
     (out-depends   () ())
     (output-types  boolp boolp)
     (outputs       q qn)
     (results       . ,(cons-up '((f-buf state) (f-not state))))
     (state-types   . boolp)
     (states        . state)
                  
     (gates         . 10)
     (primitives    . 1)
     (transistors   . 38))


    (fd1slp
     (delays        ((70 1085) (45  982))
                    ((67 1493) (35 1568)))
     (drives        12 12)
     (input-types   boolp clk boolp boolp boolp)
     (inputs        d cp ld ti te)
     (loadings      1 1 2 1 2)
     (lsi-name      . fd1slp)
     (new-states    . (f-if te ti (f-if ld d state)))
     (out-depends   () ())
     (output-types  boolp boolp)
     (outputs       q qn)
     (results       . ,(cons-up '((f-buf state) (f-not state))))
     (state-types   . boolp)
     (states        . state)

     (gates         . 12)
     (primitives    . 1)
     (transistors   . 40))


    (id
     (delays        a)
     (drives        a)
     (input-types   free)
     (inputs        a)
     (loadings      0)
     (lsi-name      . id)
     (out-depends   (a))
     (output-types  (a))
     (outputs       z)
     (results       . (cons a 'nil))

     (gates         . 0)
     (primitives    . 0)
     (transistors   . 0))


    (mem-32x32
     ;; Delays are arbitrary.  Slopes are 10 times NAND slopes.
     (delays        . ,(make-list 33
                                  :initial-element
                                  '((1410 20000) (820 20000))))
     (drives        . ,(make-list 33 :initial-element 10))

     (input-types   boolp boolp

                    boolp boolp boolp boolp boolp boolp boolp boolp
                    boolp boolp boolp boolp boolp boolp boolp boolp
                    boolp boolp boolp boolp boolp boolp boolp boolp
                    boolp boolp boolp boolp boolp boolp boolp boolp
                    
                    boolp boolp boolp boolp boolp boolp boolp boolp
                    boolp boolp boolp boolp boolp boolp boolp boolp
                    boolp boolp boolp boolp boolp boolp boolp boolp
                    boolp boolp boolp boolp boolp boolp boolp boolp)

     (inputs        ,@mem-32x32-inputs)

     (loadings      1 1

                    1 1 1 1 1 1 1 1  
                    1 1 1 1 1 1 1 1  
                    1 1 1 1 1 1 1 1  
                    1 1 1 1 1 1 1 1

                    1 1 1 1 1 1 1 1  
                    1 1 1 1 1 1 1 1  
                    1 1 1 1 1 1 1 1  
                    1 1 1 1 1 1 1 1)

     ;; The LSI-name is arbitrary.  This is a model of a memory system, NOT an
     ;; actual LSI macrocell.  The LSI-NAME is specified here because the
     ;; primitive-database predicate requires it.
     (lsi-name      . mem-32x32)

     (new-states    . (mem-state
                       ,(cons-up mem-32x32-inputs)
                       state))

     (out-depends   . ,(make-list
                        33
                        :initial-element
                        '(rw- strobe-
                          a0  a1  a2  a3  a4  a5  a6  a7
                          a8  a9  a10 a11 a12 a13 a14 a15
                          a16 a17 a18 a19 a20 a21 a22 a23
                          a24 a25 a26 a27 a28 a29 a30 a31)))

     (output-types  boolp
                    tri-state tri-state tri-state tri-state
                    tri-state tri-state tri-state tri-state
                    tri-state tri-state tri-state tri-state
                    tri-state tri-state tri-state tri-state
                    tri-state tri-state tri-state tri-state
                    tri-state tri-state tri-state tri-state
                    tri-state tri-state tri-state tri-state
                    tri-state tri-state tri-state tri-state)

     (outputs       dtack-
                    o0  o1  o2  o3  o4  o5  o6  o7
                    o8  o9  o10 o11 o12 o13 o14 o15
                    o16 o17 o18 o19 o20 o21 o22 o23
                    o24 o25 o26 o27 o28 o29 o30 o31)

     (results       . (mem-value
                       ,(cons-up mem-32x32-inputs)
                       state))

     (state-types   . ((addressed-state 32 (ram ',(make-list 32
                                                             :initial-element
                                                             'boolp)))
                       numberp number-listp numberp boolp boolp
                       ,(make-list 32 :initial-element 'boolp)
                       ,(make-list 32 :initial-element 'boolp)))

     (states        . state)

     (gates         . 0)
     (primitives    . 1)
     (transistors   . 0))



    ;; (ram-enable-circuit
    ;;  (clk test-regfile- disable-regfile- we)
    ;;  (z)
    ;;  ((g0 (clk-10)       del10    (clk))
    ;;   (g1 (test-regfile) b-not    (test-regfile-))
    ;;   (g2 (gate-clk)     b-or     (clk-10 test-regfile))
    ;;   (g3 (z)            b-nand3p (we disable-regfile- gate-clk)))
    ;;  nil)
    ;;
    ;; NOTE: B-NAND3P is not in the primp-database.

    ;; MODULE RAM-ENABLE-CIRCUIT;
    ;; INPUTS CLK,TEST-REGFILE-,DISABLE-REGFILE-,WE;
    ;; OUTPUTS Z;
    ;; LEVEL FUNCTION;
    ;; DEFINE
    ;; G0 (CLK-10)       = DEL10 (CLK);
    ;; G1 (TEST-REGFILE) = IVA   (TEST-REGFILE-);
    ;; G2 (GATE-CLK)     = OR2   (CLK-10,TEST-REGFILE);
    ;; G3 (Z)            = ND3P  (WE,DISABLE-REGFILE-,GATE-CLK);
    ;; END MODULE;

    ;; loadings:  CLK              1
    ;;            TEST-REGFILE-    2
    ;;            CLK-10           1
    ;;            TEST-REGFILE     1
    ;;            WE               2
    ;;            DISABLE-REGFILE- 2
    ;;            GATE-CLK         2
    ;;
    ;; delays:  (slope*load) + intercept + input-delay
    ;;  CLK-10
    ;;    primp delay: ((60 10530) (49 10424))
    ;;    low-to-high: (60 * 1) + 10530 + CLK = 10590 + CLK
    ;;    high-to-low: (49 * 1) + 10424 + CLK = 10473 + CLK
    ;;  TEST-REGFILE
    ;;    primp delay: ((70 235) (57 198))
    ;;    low-to-high: (70 * 1) + 235 + TEST-REGFILE- = 305 + TEST-REGFILE-
    ;;    high-to-low: (57 * 1) + 198 + TEST-REGFILE- = 255 + TEST-REGFILE-
    ;;  GATE-CLK
    ;;    primp delay: ((143 332) (58 819))
    ;;    low-to-high:   (143 * 2) + 332 + max(CLK-10,TEST-REGFILE)
    ;;                 = 618             + max(CLK-10,TEST-REGFILE)
    ;;    high-to-low:   ( 58 * 2) + 819 + max(CLK-10,TEST-REGFILE)
    ;;                 = 935             + max(CLK-10,TEST-REGFILE)
    ;;    range:         [618 .. 935] + max(CLK-10,TEST-REGFILE)
    ;;                 =       [  618 .. 935]
    ;;                   + max([10473..10590]+CLK, [255..305]+TEST-REGFILE-)
    ;;                le [11091 .. 11525] + max(CLK, TEST-REGFILE-)
    ;;  Z
    ;;    primp delay: ((68 552) (54 311))
    ;;    low-to-high:   (slope*load) + intercept + input-delay
    ;;                 = (68   * 0)   + 552       + max(WE, DISABLE-REGFILE-,
    ;;                                                  GATE-CLK)
    ;;                 le 552 + max(WE, DISABLE-REGFILE-,
    ;;                             [11091..11525]+max(CLK,TEST-REGFILE-))
    ;;                 le 552 + [11091..11525] + max(CLK, TEST-REGFILE-,
    ;;                                               DISABLE-REGFILE-, WE)
    ;;                 = [11643..12077] + max(...)
    ;;                 average 11860
    ;;    high-to-low:   (slope*load) + intercept + input-delay
    ;;                 = (54   * 0)   + 311       + max(WE, DISABLE-REGFILE-,
    ;;                                                  GATE-CLK)
    ;;                 le 311 + max(WE, DISABLE-REGFILE-,
    ;;                              [11091..11525]+max(CLK,TEST-REGFILE-))
    ;;                 le 311  + [11091..11525] + max(CLK, TEST-REGFILE-,
    ;;                                                DISABLE-REGFILE-, WE)
    ;;                 = [11402..11836] + max(...)
    ;;                 average 11619

    (ram-enable-circuit
     (delays        ((68 12000) (54 12000)))
     (drives        10)
     (input-types   clk boolp boolp boolp)
     (inputs        clk test-regfile- disable-regfile- we)
     (loadings      1 2 2 2)
     (lsi-name      . ram-enable-circuit)
     (out-depends   (clk test-regfile- disable-regfile- we))
     (output-types  level)
     (outputs       z)
     (results       . ,(cons-up '((f-nand disable-regfile- we))))

     (gates         . 24)
     (primitives    . 1)
     (transistors   . 97))


    (t-buf
     (delays        ((146 313) (57 728)))
     (drives        10)
     (input-types   boolp boolp)
     (inputs        e a)
     (loadings      2 2)
     (lsi-name      . (bts4 a e))       ; Note input reordering
     (out-depends   (a e))
     (output-types  tri-state)
     (outputs       z)
     (results       . ,(cons-up '((ft-buf e a))))

     (gates         . 3)
     (primitives    . 1)
     (transistors   . 12))


    (t-wire
     (delays        (or  a b))
     (drives        (min a b))
     (input-types   tri-state tri-state)
     (inputs        a b)
     (loadings      1 1)
     (lsi-name      . t-wire)
     (out-depends   (a b))
     (output-types  tri-state)
     (outputs       z)
     (results       . ,(cons-up '((ft-wire a b))))

     (gates         . 0)
     (primitives    . 0)
     (transistors   . 0))


    (pullup
     (delays        a)
     (drives        a)
     (input-types   tri-state)
     (inputs        a)
     (loadings      1)
     (lsi-name      . pullup)
     (out-depends   (a))
     (output-types  boolp)
     (outputs       z)
     (results       . ,(cons-up '((f-pullup a))))

     (gates         . 0)
     (primitives    . 0)
     (transistors   . 0))


    ;;  Delay information may not be correct for the pads.


    ;; Note: (1) zi delay (second one) is from LSI ttl input buffer TLCHT.
    ;;           (See pages 4-39 and 4-27 of LSI book.)
    ;;       (2) po delay (third one) has ND2 (b-nand) slopes, and 
    ;;           intercepts are ND2 intercepts plus output ZI intercepts.
    ;;           (See drawings on pages 4-40 and 4-27 of LSI book.)

    (ttl-bidirect
     (delays        (((61 ps-pf) 1633) ((41 ps-pf) 2253))
                    (( 43         633) (20          638))
                    ((141        1053) (82          799)))
     (drives        (8 mA) 10 10)
     (input-types   ttl-tri-state boolp boolp parametric)
     (inputs        io a en pi)
     (loadings      (3 pf) 1 1 1)
     (lsi-name      . bd8trp)
     (out-depends   (en a) (en a io) (en a io pi))
     (output-types  ttl-tri-state boolp parametric)
     (outputs       io zi po)
     (results       . ,(cons-up
                        '((ft-buf (f-not en) a) 
                          (f-buf (ft-wire io (ft-buf (f-not en) a)))
                          (f-nand (ft-wire io (ft-buf (f-not en) a))
                                  pi))))

     (gates         . 0)
     (pads          . 1)
     (primitives    . 1)
     (transistors   . 0))


    (ttl-clk-input
     (delays        ((  4 1225) (  4 1152))
                    ((202 1050) (117  741)))
     (drives        400 10)
     (input-types   ttl parametric)
     (inputs        a pi)
     (loadings      (3 pf) 1)
     (lsi-name      . drvt8)
     (out-depends   (a) (a pi))
     (output-types  clk parametric)
     (outputs       z po)
     (results       . ,(cons-up '((f-buf a) (f-nand a pi))))

     (gates         . 0)
     (pads          . 2)
     (primitives    . 1)
     (transistors   . 0))


    ;; Note: po delay (second one) has ND2 (b-nand) slopes, and 
    ;;       intercepts are ND2 intercepts plus output Z intercepts.
    ;;       (See drawings on page 4-27 of LSI book.)

    (ttl-input
     (delays        (( 43  633) (20 638))
                    ((141 1053) (82 799)))
     (drives        10 10)
     (input-types   ttl parametric)
     (inputs        a pi)
     (loadings      (3 pf) 1)
     (lsi-name      . tlcht)
     (out-depends   (a) (a pi))
     (output-types  boolp parametric)
     (outputs       z po)
     (results       . ,(cons-up '((f-buf a) (f-nand a pi))))

     (gates         . 0)
     (pads          . 1)
     (primitives    . 1)
     (transistors   . 0))


    (ttl-output
     (delays        (((61 ps-pf) 812) ((42 ps-pf) 1155)))
     (drives        (8 mA))
     (input-types   boolp)
     (inputs        a)
     (loadings      5)
     (lsi-name      . b8rp)
     (out-depends   (a))
     (output-types  ttl)
     (outputs       z)
     (results       . (cons (f-buf a) 'nil))

     (gates         . 0)
     (pads          . 1)
     (primitives    . 1)
     (transistors   . 0))


    (ttl-output-parametric
     (delays        (((64 ps-pf) 737) ((42 ps-pf) 1125)))
     (drives        (4 mA))
     (input-types   parametric)
     (inputs        a)
     (loadings      3)
     (lsi-name      . b4)       
     (out-depends   (a))
     (output-types  ttl)
     (outputs       z)
     (results       . (cons (f-buf a) 'nil))

     (gates         . 0)
     (pads          . 1)
     (primitives    . 1)
     (transistors   . 0))


    (ttl-output-fast
     (delays        (((36 ps-pf) 991) ((24 ps-pf) 1488)))
     (drives        (8 mA))
     (input-types   boolp)
     (inputs        a)
     (loadings      3)
     (lsi-name      . b8)
     (out-depends   (a))
     (output-types  ttl)
     (outputs       z)
     (results       . (cons (f-buf a) 'nil))

     (gates         . 0)
     (pads          . 1)
     (primitives    . 1)
     (transistors   . 0))


    (ttl-tri-output
     (delays        (((61 ps-pf) 1602) ((41 ps-pf) 2233)))
     (drives        (8 mA))
     (input-types   boolp boolp)
     (inputs        a en)
     (loadings      1 1)
     (lsi-name      . bt8rp)
     (out-depends   (a en))
     (output-types  ttl-tri-state)
     (outputs       z)
     (results       . (cons (ft-buf (f-not en) a) 'nil))

     (gates         . 0)
     (pads          . 1)
     (primitives    . 1)
     (transistors   . 0))


    (ttl-tri-output-fast
     (delays        (((36 ps-pf) 1581) ((24 ps-pf) 2198)))
     (drives        (8 mA))
     (input-types   boolp boolp)
     (inputs        a en)
     (loadings      1 1)
     (lsi-name      . bt8)
     (out-depends   (a en))
     (output-types  ttl-tri-state)
     (outputs       z)
     (results       . (cons (ft-buf (f-not en) a) 'nil))

     (gates         . 0)
     (pads          . 1)
     (primitives    . 1)
     (transistors   . 0))


    (vdd
     (delays        ((0 0) (0 0)))
     (drives        50)
     (input-types   )
     (inputs        )
     (loadings      )
     (lsi-name      . vdd)
     (out-depends   ())
     (output-types  boolp)
     (outputs       z)
     (results       . (cons '*1*true 'nil))

     (gates         . 0)
     (primitives    . 1)
     (transistors   . 0))


    (vdd-parametric
     (delays        ((0 0) (0 0)))
     (drives        50)
     (input-types   )
     (inputs        )
     (loadings      )
     (lsi-name      . vdd)
     (out-depends   ())
     (output-types  parametric)
     (outputs       z)
     (results       . (cons '*1*true 'nil))

     (gates         . 0)
     (primitives    . 1)
     (transistors   . 0))
                     

    (vss
     (delays        ((0 0) (0 0)))
     (drives        50)
     (input-types   )
     (inputs        )
     (loadings      )
     (lsi-name      . vss)
     (out-depends   ())
     (output-types  boolp)
     (outputs       z)
     (results       . (cons '*1*false 'nil))

     (gates         . 0)
     (primitives    . 1)
     (transistors   . 0))

    ))
