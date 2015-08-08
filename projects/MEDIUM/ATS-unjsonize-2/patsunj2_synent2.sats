(*
######
#
# HX-2015-06-28:
#
# UN-jsonize level-2 syntax
# (that is, level-2 internalization)
#
######
*)

(* ****** ****** *)
//
abst0ype
stamp_t0ype = int
typedef stamp = stamp_t0ype
//
(* ****** ****** *)
//
fun print_stamp: stamp -> void
and prerr_stamp: stamp -> void
fun fprint_stamp: fprint_type(stamp)
//
overload print with print_stamp
overload prerr with prerr_stamp
overload fprint with fprint_stamp
//
(* ****** ****** *)

fun stamp_make(int): stamp

(* ****** ****** *)

fun stamp_get_int(stamp): int

(* ****** ****** *)

fun hash_stamp(stamp):<> ulint

(* ****** ****** *)
//
fun
eq_stamp_stamp : (stamp, stamp) -<fun0> bool
fun
neq_stamp_stamp : (stamp, stamp) -<fun0> bool
fun
compare_stamp_stamp : (stamp, stamp) -<fun0> int
//
overload = with eq_stamp_stamp
overload != with neq_stamp_stamp
overload compare with compare_stamp_stamp
//
(* ****** ****** *)
//
fun the_stamp_getinc(): stamp
//
fun the_stamp_update(n: stamp): void
//
(* ****** ****** *)

abstype symbol_type
typedef symbol = symbol_type

(* ****** ****** *)
//
fun print_symbol: symbol -> void
and prerr_symbol: symbol -> void
fun fprint_symbol: fprint_type(symbol)
//
overload print with print_symbol
overload prerr with prerr_symbol
overload fprint with fprint_symbol
//
(* ****** ****** *)

fun
symbol_make_name (string): symbol

(* ****** ****** *)
//
fun
symbol_get_name (symbol): string
//
overload .name with symbol_get_name
//
(* ****** ****** *)
//
fun
eq_symbol_symbol : (symbol, symbol) -<fun0> bool
fun
neq_symbol_symbol : (symbol, symbol) -<fun0> bool
fun
compare_symbol_symbol : (symbol, symbol) -<fun0> int
//
overload = with eq_symbol_symbol
overload != with neq_symbol_symbol
overload compare with compare_symbol_symbol
//
(* ****** ****** *)
//
abstype location_type
//
typedef loc_t = location_type
typedef location = location_type
//
(* ****** ****** *)
//
fun
fprint_location: fprint_type(loc_t)
//
overload fprint with fprint_location
//
(* ****** ****** *)
//
fun location_make (rep: string): loc_t
//
(* ****** ****** *)
//
datatype label =
  | LABint of int | LABsym of symbol
//
(* ****** ****** *)

datatype s2rt =
//
  | S2RTint of ()
  | S2RTaddr of ()
  | S2RTbool of ()
//
  | S2RTreal of ()
  | S2RTstring of ()
//
  | S2RTcls of ()
  | S2RTeff of ()
//
  | S2RTtup of ((*void*))
//
  | S2RTtype of ((*void*))
  | S2RTvtype of ((*void*))
//
  | S2RTt0ype of ((*void*))
  | S2RTvt0ype of ((*void*))
//
  | S2RTprop of ((*void*))
  | S2RTview of ((*void*))
//
  | S2RTtkind of ((*void*))
//
  | S2RTfun of (s2rtlst(*args*), s2rt (*res*))
//
  | S2RTnamed of (symbol)
//
  | S2RTerror of ((*void*))
//
// end of [datatype]

where s2rtlst = List0(s2rt)

(* ****** ****** *)

abstype s2cst_type
typedef s2cst = s2cst_type
typedef s2cstlst = List0(s2cst)

(* ****** ****** *)

fun fprint_s2cst: fprint_type(s2cst)

(* ****** ****** *)

abstype s2var_type
typedef s2var = s2var_type
typedef s2varlst = List0(s2var)

(* ****** ****** *)

fun fprint_s2var: fprint_type(s2var)

(* ****** ****** *)

abstype d2con_type
typedef d2con = d2con_type
typedef d2conlst = List0(d2con)

(* ****** ****** *)

abstype d2cst_type
typedef d2cst = d2cst_type
typedef d2cstlst = List0(d2cst)

(* ****** ****** *)

abstype d2var_type
typedef d2var = d2var_type
typedef d2varlst = List0(d2var)

(* ****** ****** *)

datatype
s2exp_node =
  | S2Ecst of s2cst
  | S2Evar of s2var
// end of [s2exp_node]

where
s2exp = $rec{
//
s2exp_loc= loc_t
,
s2exp_node= s2exp_node
//
} (* end of [s2exp] *)

and s2explst = List0(s2exp)

(* ****** ****** *)

datatype
d2exp_node =
  | D2Ecst of d2cst
  | D2Evar of d2var
// end of [d2exp_node]

where
d2exp = $rec{
//
d2exp_loc= loc_t
,
d2exp_node= d2exp_node
//
} (* end of [d2exp] *)

and d2explst = List0(d2exp)

(* ****** ****** *)

datatype
d2ecl_node =
  | D2Cnone of () // for something already erased
  | D2Clist of d2eclist // for list of declarations
  | D2Cignored of ((*void*)) // for ignored declarations
// end of [d2ecl_node]

where
d2ecl = $rec{
//
d2exp_loc= loc_t
,
d2ecl_node= d2ecl_node
//
} (* end of [d2ecl] *)

and d2eclist = List0(d2ecl)

(* ****** ****** *)

(* end of [pats_synent2.sats] *)