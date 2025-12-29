  METHOD complete.
  data lt_kna1 type standard table of kna1.
   Select * from kna1 into table lt_kna1.
  ENDMETHOD.