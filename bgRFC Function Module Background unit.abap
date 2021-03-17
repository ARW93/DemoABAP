data(DEST_NAME) = conv BGRFC_DEST_NAME_INBOUND( |Your Inbound bgRFC Destination Name| ).

try.
    data(O_UNIT) = CL_BGRFC_DESTINATION_INBOUND=>CREATE( DEST_NAME )->CREATE_TRFC_UNIT( ).
  catch CX_BGRFC_INVALID_DESTINATION.
endtry.
if O_UNIT is bound.
  call function 'Z_FM_VQ_RESTRICT_QC_NOTIF' in background unit O_UNIT
    exporting
      I_MSEG_TAB = MSEG_TAB.
endif.
