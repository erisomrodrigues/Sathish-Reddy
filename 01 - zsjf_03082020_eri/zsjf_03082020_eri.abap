*&---------------------------------------------------------------------*
*& Report ZSJF_03082020_ERI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsjf_03082020_eri.

TYPES: BEGIN OF ty_t001,
         bukrs TYPE t001-bukrs,
         butxt TYPE t001-butxt,
         ort01 TYPE t001-ort01,
         land1 TYPE t001-land1,
       END OF ty_t001.

DATA: wa_t001 TYPE ty_t001,
      it_t001 TYPE TABLE OF ty_t001.

SELECT-OPTIONS s_bukrs FOR wa_t001-bukrs.

SELECT bukrs,
       butxt,
       ort01,
       land1
  FROM t001
  INTO TABLE @it_t001
  WHERE bukrs IN @s_bukrs.

  WRITE:/ SY-uline(71).
  WRITE:/ SY-VLINE,2 'Code' ,7 SY-vline, 9 'Company Name', 34 SY-vline,38 'City', 52 SY-vline, 60 'Country', 71 SY-vline.
  WRITE:/ SY-uline(71).
  LOOP AT it_t001 INTO wa_t001.
    WRITE:/ sy-vline,
            2 wa_t001-bukrs,
            7 sy-vline,
            8 wa_t001-butxt,'     ',
            34 sy-vline,
            35 wa_t001-ort01,
            52 sy-vline,
            60 wa_t001-land1,
            71 sy-vline.
  ENDLOOP.
