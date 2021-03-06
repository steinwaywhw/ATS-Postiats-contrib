(*
** A simple implementation
** of tokenization based on jsonats
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload "{$LIBATSHWXI}/cstream/SATS/cstream.sats"
staload "{$LIBATSHWXI}/cstream/SATS/cstream_tokener.sats"
//
staload _ = "libats/DATS/stringbuf.dats"
staload _ = "{$LIBATSHWXI}/cstream/DATS/cstream.dats"
staload _ = "{$LIBATSHWXI}/cstream/DATS/cstream_tokener.dats"
//
(* ****** ****** *)

staload "./../SATS/jsonats.sats"
staload "./../DATS/jsonats.dats"

(* ****** ****** *)

implement
main0 (argc, argv) =
{
//
val fname =
(
if argc >= 2
  then argv[1] else "test01.dats"
// end of [if]
) : string
//
val-~Some_vt(inp) =
fileref_open_opt (fname, file_mode_r)
val cs0 = cstream_make_fileref (inp)
//
val tknr =
  tokener_make_cstream (cs0)
//
var tok: token =
  tokener_get_token<token> (tknr)
//
val () =
while (true)
{
val () =
  fprintln! (stdout_ref, "tok = ", tok)
val () =
(
  case+ tok of
  | TOKeof () => $break
  | _ => (tok := tokener_get_token<token> (tknr))
) : void // end of [val]
} (* end of [where] *) // end of [val]
//
val ((*void*)) = tokener_free (tknr)
//
val ((*void*)) = fileref_close (inp)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test01.dats] *)
