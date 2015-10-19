

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)

%{^
%%
-module(test_dats).
%%
-export([main0_erl/0]).
%%
-compile(nowarn_unused_vars).
-compile(nowarn_unused_function).
%%
-include("./../../libatscc2erl_all.hrl").
-include("./../CATS/CML.hrl").
%%
%} // end of [%{]

(* ****** ****** *)

#include "./../../staloadall.hats"
staload "./../../basics_erl.sats"
staload "../SATS/CML.sats"

implement main0_erl () = () where {
	val chan = channel()
}