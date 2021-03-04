*&---------------------------------------------------------------------*
*& Report ZDEMO_MACRO
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report ZDEMO_MACRO.

class CL_MAIN definition create private final.
  public section.
    class-methods:
      CREATE_OBJECT returning value(R_OBJ) type ref to CL_MAIN.
    methods:
      MACRO_EXAMPLE.
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

  method MACRO_EXAMPLE.
    define MACRO_SUM.
      &1 = &2 + &3.
    end-of-definition.
    data: A type I,
          B type I,
          C type I.

    MACRO_SUM: A 1 2,
               B 42 23,
               C 10 5000.

    define MACRO_WRITE.
      CL_DEMO_OUTPUT=>WRITE( &1 ).
    end-of-definition.

    MACRO_WRITE: A,
                          B,
                          C.
*/IF MACRO WAS NOT USED
* cl_demo_output=>write( a ).
* cl_demo_output=>write( b ).
* cl_demo_output=>write( c ).

    CL_DEMO_OUTPUT=>DISPLAY( ).
  endmethod.
endclass.

start-of-selection.
  CL_MAIN=>CREATE_OBJECT( )->MACRO_EXAMPLE( ).