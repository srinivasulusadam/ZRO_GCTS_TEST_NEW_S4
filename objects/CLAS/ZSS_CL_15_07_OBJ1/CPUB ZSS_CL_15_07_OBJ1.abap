class zss_cl_15_07_obj1 definition
  public
  final
  create public .

PUBLIC SECTION.
  METHODS:
    constructor
      IMPORTING
        iv_api_key TYPE string,
    complete
      IMPORTING
        iv_model TYPE string
        iv_prompt TYPE string
      RETURNING
        VALUE(rv_response) TYPE string.
