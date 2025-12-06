*&---------------------------------------------------------------------*
*& Report ZSS_PROG_6_12_OBJ1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSS_PROG_6_12_OBJ1.
*REPORT zsalesorder_drilldown.

*-----------------------------------------------------------------------
* Data Definitions
*-----------------------------------------------------------------------
TABLES: vbak, vbap.

TYPE-POOLS: slis.

DATA: gt_vbak     TYPE TABLE OF vbak,
      gs_vbak     TYPE vbak,
      gt_vbap     TYPE TABLE OF vbap,
      gs_vbap     TYPE vbap.

DATA: g_repid     TYPE sy-repid,
      g_container TYPE REF TO cl_gui_custom_container,
      g_grid      TYPE REF TO cl_gui_alv_grid,
      g_grid2     TYPE REF TO cl_gui_alv_grid.

*-----------------------------------------------------------------------
* Selection Screen
*-----------------------------------------------------------------------
SELECT-OPTIONS: s_vbeln FOR vbak-vbeln.

*-----------------------------------------------------------------------
* START-OF-SELECTION - Fetch Header Data
*-----------------------------------------------------------------------
START-OF-SELECTION.

  SELECT * FROM vbak
    INTO TABLE gt_vbak
    WHERE vbeln IN s_vbeln.

*-----------------------------------------------------------------------
* END-OF-SELECTION - Display ALV
*-----------------------------------------------------------------------
END-OF-SELECTION.

  PERFORM display_header_alv.

*-----------------------------------------------------------------------
* FORM: Display Header ALV (Sales Orders)
*-----------------------------------------------------------------------
FORM display_header_alv.

  g_repid = sy-repid.

  CREATE OBJECT g_container
    EXPORTING container_name = 'CONTAINER'.

  CREATE OBJECT g_grid
    EXPORTING i_parent = g_container.

  DATA: lt_fieldcat TYPE lvc_t_fcat,
        ls_fieldcat TYPE lvc_s_fcat.

  CLEAR lt_fieldcat.

  ls_fieldcat-fieldname = 'VBELN'.
  ls_fieldcat-scrtext_l = 'Sales Order'.
  APPEND ls_fieldcat TO lt_fieldcat. CLEAR ls_fieldcat.

  ls_fieldcat-fieldname = 'VKORG'.
  ls_fieldcat-scrtext_l = 'Sales Org'.
  APPEND ls_fieldcat TO lt_fieldcat. CLEAR ls_fieldcat.

  ls_fieldcat-fieldname = 'KUNNR'.
  ls_fieldcat-scrtext_l = 'Sold-To'.
  APPEND ls_fieldcat TO lt_fieldcat. CLEAR ls_fieldcat.

  ls_fieldcat-fieldname = 'ERDAT'.
  ls_fieldcat-scrtext_l = 'Created On'.
  APPEND ls_fieldcat TO lt_fieldcat. CLEAR ls_fieldcat.

  CALL METHOD g_grid->set_table_for_first_display
    EXPORTING
      i_structure_name = 'VBAK'
    CHANGING
      it_fieldcatalog = lt_fieldcat
      it_outtab       = gt_vbak.

  " Register for double-click event
*  SET HANDLER alv_double_click g_grid.

ENDFORM.

*-----------------------------------------------------------------------
* Event Handler for Drilldown
*-----------------------------------------------------------------------
CLASS lcl_event_handler DEFINITION.
  PUBLIC SECTION.
    METHODS: handle_double_click
      FOR EVENT double_click OF cl_gui_alv_grid
      IMPORTING e_row e_column.
ENDCLASS.

CLASS lcl_event_handler IMPLEMENTATION.
  METHOD handle_double_click.

    READ TABLE gt_vbak INTO gs_vbak INDEX e_row-index.
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    " Fetch Items
    SELECT * FROM vbap
      INTO TABLE gt_vbap
      WHERE vbeln = gs_vbak-vbeln.

    PERFORM display_item_alv.

  ENDMETHOD.
ENDCLASS.

DATA g_handler TYPE REF TO lcl_event_handler.

*-----------------------------------------------------------------------
* FORM: Display Items ALV
*-----------------------------------------------------------------------
FORM display_item_alv.

  IF g_grid2 IS INITIAL.

    DATA: l_container2 TYPE REF TO cl_gui_custom_container.
    CREATE OBJECT l_container2 EXPORTING container_name = 'CONTAINER2'.
    CREATE OBJECT g_grid2 EXPORTING i_parent = l_container2.

  ENDIF.

  DATA: lt_fieldcat TYPE lvc_t_fcat,
        ls_fieldcat TYPE lvc_s_fcat.

  CLEAR lt_fieldcat.

  ls_fieldcat-fieldname = 'VBELN'.
  ls_fieldcat-scrtext_l = 'Sales Order'.
  APPEND ls_fieldcat TO lt_fieldcat. CLEAR ls_fieldcat.

  ls_fieldcat-fieldname = 'POSNR'.
  ls_fieldcat-scrtext_l = 'Item'.
  APPEND ls_fieldcat TO lt_fieldcat. CLEAR ls_fieldcat.

  ls_fieldcat-fieldname = 'MATNR'.
  ls_fieldcat-scrtext_l = 'Material'.
  APPEND ls_fieldcat TO lt_fieldcat. CLEAR ls_fieldcat.

  ls_fieldcat-fieldname = 'KWMENG'.
  ls_fieldcat-scrtext_l = 'Order Qty'.
  APPEND ls_fieldcat TO lt_fieldcat. CLEAR ls_fieldcat.

  CALL METHOD g_grid2->set_table_for_first_display
    EXPORTING
      i_structure_name = 'VBAP'
    CHANGING
      it_fieldcatalog = lt_fieldcat
      it_outtab       = gt_vbap.

ENDFORM.

*-----------------------------------------------------------------------
* Create event handler
*-----------------------------------------------------------------------
INITIALIZATION.
  CREATE OBJECT g_handler.

*-----------------------------------------------------------------------
* ALV Double-click Handler Registration
*-----------------------------------------------------------------------
FORM alv_double_click.
  " This FORMs job is just to ensure the SET HANDLER is known
ENDFORM.