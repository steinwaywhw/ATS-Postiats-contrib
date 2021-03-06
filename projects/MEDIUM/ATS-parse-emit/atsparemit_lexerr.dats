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
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)

staload "./atsparemit.sats"

(* ****** ****** *)
//
implement
lexerr_make (loc, node) =
  '{ lexerr_loc= loc, lexerr_node= node }
//
(* ****** ****** *)
//
implement
the_lexerrlst_clear () =
  list_vt_free (the_lexerrlst_pop_all ())
//
(* ****** ****** *)

implement
fprint_lexerr
  (out, x) = let
//
val () =
fprint! (out, x.lexerr_loc, ": ")
//
in
//
case+
x.lexerr_node of
| LEXERR_UNSUPPORTED_char (c) =>
  {
    val i = char2int0(c)
    val () = fprintln! (out, "Unrecognized char: ", c, "(", i, ")")
  }
//
end // end of [fprint_lexerr]

(* ****** ****** *)

implement
fprint_lexerrlst
  (out, xs) =
(
//
case+ xs of
| list_nil () => ()
| list_cons (x, xs) =>
  {
    val () = fprint_lexerr (out, x)
    val () = fprint_lexerrlst (out, xs)
  }
//
) (* end of [fprint_lexerrlst] *)

(* ****** ****** *)

implement
the_lexerrlst_print_free
  () = nerr where
{
//
  val xs = the_lexerrlst_pop_all ()
  val () = fprint_lexerrlst (stderr_ref, $UN.list_vt2t(xs))
  val nerr = list_vt_length (xs)
  val ((*freed*)) = list_vt_free (xs)
//
} (* end of [the_lexerrlst_print_free] *)

(* ****** ****** *)

(* end of [atsparemit_lexerr.dats] *)
