(* ****** ****** *)
//
// ATS-parse-emit
//
(* ****** ****** *)
//
// HX-2014-07-02: start
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./atsparemit.sats"
staload "./atsparemit_syntax.sats"
staload "./atsparemit_parsing.sats"

(* ****** ****** *)

extern fun parse_ATSthen : parser (instr)
extern fun parse_ATSelseopt : parser (instropt)

(* ****** ****** *)

implement
parse_instr
  (buf, bt, err) = let
//
(*
val () = println! ("parse_instr")
*)
//
val err0 = err
val n0 = tokbuf_get_ntok (buf)
val tok = tokbuf_get_token (buf)
val loc = tok.token_loc
//
macdef incby1 () = tokbuf_incby1 (buf)
//
in
//
case+
tok.token_node of
//
| _ when
    ptest_SRPif0 (buf) => let
    val () = incby1 ()
    val () = pskip_SRPif0 (buf, 1(*level*))
  in
    parse_instr (buf, bt, err)
  end // end of [#if(0)]
//
| T_KWORD(ATSif()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_d0exp, err0)
    val ent3 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent4 = pif_fun (buf, bt, err, parse_ATSthen, err0)
    val ent5 = pif_fun (buf, bt, err, parse_ATSelseopt, err0)
  in
    if err = err0
      then (
        ATSif_make (tok, ent2, ent4, ent5)
      ) else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSif]
//
| T_KWORD(ATSifthen()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_d0exp, err0)
    val ent3 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent4 = pif_fun (buf, bt, err, p_LBRACE, err0)
    val ent5 = pif_fun (buf, bt, err, parse_instrseq, err0)
    val ent6 = pif_fun (buf, bt, err, p_RBRACE, err0)
    val ent7 = pif_fun (buf, bt, err, p_SEMICOLON, err0)
  in
    if err = err0
      then (
        ATSifthen_make (tok, ent2, ent5, ent6)
      ) else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSifthen]
| T_KWORD(ATSifnthen()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_d0exp, err0)
    val ent3 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent4 = pif_fun (buf, bt, err, p_LBRACE, err0)
    val ent5 = pif_fun (buf, bt, err, parse_instrseq, err0)
    val ent6 = pif_fun (buf, bt, err, p_RBRACE, err0)
    val ent7 = pif_fun (buf, bt, err, p_SEMICOLON, err0)
  in
    if err = err0
      then (
        ATSifnthen_make (tok, ent2, ent5, ent6)
      ) else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSifthen]
//
| T_KWORD(ATScaseofbeg()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent3 = pif_fun (buf, bt, err, parse_instrseq, err0)
    val ent4 = pif_fun (buf, bt, err, p_ATScaseofend, err0)
    val ent5 = pif_fun (buf, bt, err, p_LPAREN, err0)
    val ent6 = pif_fun (buf, bt, err, p_RPAREN, err0)
  in
    if err = err0
      then (
        ATScaseofseq_make (tok, ent3, ent6)
      ) else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSINScaseofbeg]
//
| T_KWORD(ATSbranchbeg()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent3 = pif_fun (buf, bt, err, parse_instrseq, err0)
    val ent4 = pif_fun (buf, bt, err, p_ATSbranchend, err0)
    val ent5 = pif_fun (buf, bt, err, p_LPAREN, err0)
    val ent6 = pif_fun (buf, bt, err, p_RPAREN, err0)
  in
    if err = err0
      then (
        ATSbranchseq_make (tok, ent3, ent6)
      ) else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSINSbranchbeg]
//
| T_KWORD(ATStailcalbeg()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent3 = pif_fun (buf, bt, err, parse_instrseq, err0)
    val ent4 = pif_fun (buf, bt, err, p_ATStailcalend, err0)
    val ent5 = pif_fun (buf, bt, err, p_LPAREN, err0)
    val ent6 = pif_fun (buf, bt, err, p_RPAREN, err0)
  in
    if err = err0
      then (
        ATStailcalseq_make (tok, ent3, ent6)
      ) else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSINStailcalbeg]
//
| T_KWORD(ATSreturn()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_i0de, err0)
    val ent3 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent4 = pif_fun (buf, bt, err, p_SEMICOLON, err0)
  in
    if err = err0
      then (
        ATSreturn_make (tok, ent2, ent4)
      ) else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSreturn]
| T_KWORD(ATSreturn_void()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_i0de, err0)
    val ent3 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent4 = pif_fun (buf, bt, err, p_SEMICOLON, err0)
  in
    if err = err0
      then (
        ATSreturn_void_make (tok, ent2, ent4)
      ) else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSreturn_void]
//
| T_KWORD(ATSINSlab()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_i0de, err0)
    val ent3 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent4 = pif_fun (buf, bt, err, p_COLON, err0)
  in
    if err = err0
      then (
        ATSINSlab_make (tok, ent2, ent4)
      ) else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSINSlab]
//
| T_KWORD(ATSINSgoto()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_i0de, err0)
    val ent3 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent4 = pif_fun (buf, bt, err, p_SEMICOLON, err0)
  in
    if err = err0
      then (
        ATSINSgoto_make (tok, ent2, ent4)
      ) else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSINSgoto]
//
| T_KWORD(ATSINSflab()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_i0de, err0)
    val ent3 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent4 = pif_fun (buf, bt, err, p_COLON, err0)
  in
    if err = err0
      then (
        ATSINSflab_make (tok, ent2, ent4)
      ) else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSINSflab]
//
| T_KWORD(ATSINSfgoto()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_i0de, err0)
    val ent3 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent4 = pif_fun (buf, bt, err, p_SEMICOLON, err0)
  in
    if err = err0
      then (
        ATSINSfgoto_make (tok, ent2, ent4)
      ) else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSINSfgoto]
//
| T_KWORD(ATSINSmove()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_i0de, err0)
    val ent3 = pif_fun (buf, bt, err, p_COMMA, err0)
    val ent4 = pif_fun (buf, bt, err, parse_d0exp, err0)
    val ent5 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent6 = pif_fun (buf, bt, err, p_SEMICOLON, err0)
  in
    if err = err0
      then (
        ATSINSmove_make (tok, ent2, ent4, ent5)
      ) else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSINSmove]
//
| T_KWORD(ATSINSmove_void()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_i0de, err0)
    val ent3 = pif_fun (buf, bt, err, p_COMMA, err0)
    val ent4 = pif_fun (buf, bt, err, parse_d0exp, err0)
    val ent5 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent6 = pif_fun (buf, bt, err, p_SEMICOLON, err0)
  in
    if err = err0
      then (
        ATSINSmove_void_make (tok, ent2, ent4, ent5)
      ) else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSINSmove_void]
//
| T_KWORD(ATSINSmove_boxrec()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_i0de, err0)
    val ent3 = pif_fun (buf, bt, err, p_COMMA, err0)
    val ent4 = pif_fun (buf, bt, err, parse_s0exp, err0)
    val ent5 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent6 = pif_fun (buf, bt, err, p_SEMICOLON, err0)
  in
    if err = err0
      then (
        ATSINSmove_boxrec_make (tok, ent2, ent4, ent5)
      ) else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSINSmove_boxrec]
//
| T_KWORD
  (
    ATSINSstore_boxrec_ofs()
  ) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_d0exp, err0)
    val ent3 = pif_fun (buf, bt, err, p_COMMA, err0)
    val ent4 = pif_fun (buf, bt, err, parse_s0exp, err0)
    val ent5 = pif_fun (buf, bt, err, p_COMMA, err0)
    val ent6 = pif_fun (buf, bt, err, parse_label, err0)
    val ent7 = pif_fun (buf, bt, err, p_COMMA, err0)
    val ent8 = pif_fun (buf, bt, err, parse_d0exp, err0)
    val ent9 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent10 = pif_fun (buf, bt, err, p_SEMICOLON, err0)
  in
    if err = err0
      then (
        ATSINSstore_boxrec_ofs_make (tok, ent2, ent4, ent6, ent8, ent9)
      ) else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSINSstore_boxrec_ofs]
//
| T_KWORD
  (
    ATSINSstore_fltrec_ofs()
  ) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_d0exp, err0)
    val ent3 = pif_fun (buf, bt, err, p_COMMA, err0)
    val ent4 = pif_fun (buf, bt, err, parse_s0exp, err0)
    val ent5 = pif_fun (buf, bt, err, p_COMMA, err0)
    val ent6 = pif_fun (buf, bt, err, parse_label, err0)
    val ent7 = pif_fun (buf, bt, err, p_COMMA, err0)
    val ent8 = pif_fun (buf, bt, err, parse_d0exp, err0)
    val ent9 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent10 = pif_fun (buf, bt, err, p_SEMICOLON, err0)
  in
    if err = err0
      then (
        ATSINSstore_fltrec_ofs_make (tok, ent2, ent4, ent6, ent8, ent9)
      ) else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSINSstore_fltrec_ofs]
//
| T_KWORD(ATSINSmove_tlcal()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_i0de, err0)
    val ent3 = pif_fun (buf, bt, err, p_COMMA, err0)
    val ent4 = pif_fun (buf, bt, err, parse_d0exp, err0)
    val ent5 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent6 = pif_fun (buf, bt, err, p_SEMICOLON, err0)
  in
    if err = err0
      then (
        ATSINSmove_tlcal_make (tok, ent2, ent4, ent5)
      ) else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSINSmove_tlcal]
//
| T_KWORD(ATSINSargmove_tlcal()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_i0de, err0)
    val ent3 = pif_fun (buf, bt, err, p_COMMA, err0)
    val ent4 = pif_fun (buf, bt, err, parse_i0de, err0)
    val ent5 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent6 = pif_fun (buf, bt, err, p_SEMICOLON, err0)
  in
    if err = err0
      then ATSINSargmove_tlcal_make (tok, ent2, ent4, ent5)
      else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSINSargmove_tlcal]
//
| T_KWORD(ATSINSdeadcode_fail()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent3 = pif_fun (buf, bt, err, p_SEMICOLON, err0)
  in
    if (err = err0)
      then ATSINSdeadcode_fail_make (tok, ent2) else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSINSdeadcode_fail]  
//
| _ (*error*) => let
    val () = err := err + 1
    val () = the_parerrlst_add_ifnbt (bt, loc, PARERR_instr)
  in
    synent_null ((*void*))
  end (* end of [_] *)
//
end // end of [parse_instr]

(* ****** ****** *)
//
implement
parse_instrseq
  (buf, bt, err) =
  list_vt2t (pstar_fun (buf, bt, parse_instr))
//
(* ****** ****** *)

implement
parse_ATSthen
  (buf, bt, err) = let
//
val err0 = err
val n0 = tokbuf_get_ntok (buf)
val tok = tokbuf_get_token (buf)
val loc = tok.token_loc
//
macdef incby1 () = tokbuf_incby1 (buf)
//
in
//
case+
tok.token_node of
| T_KWORD(ATSthen()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent3 = pif_fun (buf, bt, err, p_LBRACE, err0)
    val ent4 = pif_fun (buf, bt, err, parse_instrseq, err0)
    val ent5 = pif_fun (buf, bt, err, p_RBRACE, err0)
  in
    if err = err0
      then ATSthen_make (tok, ent4, ent5)
      else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [T_KWORD(ATSthen)]
//
| _ (*error*) => let
    val () = err := err + 1 in synent_null ()
  end (* end of [_] *)
//
end // end of [parse_ATSthen]

(* ****** ****** *)

implement
parse_ATSelseopt
  (buf, bt, err) = let
//
val err0 = err
val n0 = tokbuf_get_ntok (buf)
val tok = tokbuf_get_token (buf)
val loc = tok.token_loc
//
macdef incby1 () = tokbuf_incby1 (buf)
//
in
//
case+
tok.token_node of
| T_KWORD(ATSelse()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent3 = pif_fun (buf, bt, err, p_LBRACE, err0)
    val ent4 = pif_fun (buf, bt, err, parse_instrseq, err0)
    val ent5 = pif_fun (buf, bt, err, p_RBRACE, err0)
  in
    if err = err0
      then Some(ATSelse_make (tok, ent4, ent5)) else None()
    // end of [if]
  end // end of [T_KWORD(ATSelse)]
//
| _ (*non-ATSelse*) => None ()
//
end // end of [parse_ATSelseopt]

(* ****** ****** *)

(* end of [atsparemit_parsing_instr.dats] *)
