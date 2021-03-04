*&---------------------------------------------------------------------*
*& Report ZDEMO_FIZZBUZZ
*&---------------------------------------------------------------------*
*& FIZZBUZZ Demo Program
*&---------------------------------------------------------------------*
report ZDEMO_FIZZBUZZ.

class CL_MAIN definition create private final.
  public section.
    class-methods:
      CREATE_OBJECT returning value(R_OBJ) type ref to CL_MAIN.
    methods:
      RUN_FIZZBUZZ.
  private section.
    class-data: O_SINGLETON type ref to CL_MAIN.
endclass.

class CL_MAIN implementation.
  method CREATE_OBJECT.
    if O_SINGLETON is not bound.
      O_SINGLETON = new #( ).
    endif.
    R_OBJ = O_SINGLETON.
  endmethod.

  method RUN_FIZZBUZZ.
    data(OUTTAB) = value STRINGTAB( for I = 1 until I = 100
                                    let REM3 = I mod 3
                                        REM5 = I mod 5 in
                                  ( cond #( when REM3 = 0 and REM5 = 0 then |FIZZBUZZ|
                                            when REM3 = 0 then |FIZZ|
                                            when REM5 = 0 then |BUZZ|
                                            else I ) )
                                  ).
    CL_DEMO_OUTPUT=>DISPLAY( OUTTAB ).
  endmethod.
endclass.

start-of-selection.
  CL_MAIN=>CREATE_OBJECT( )->RUN_FIZZBUZZ( ).