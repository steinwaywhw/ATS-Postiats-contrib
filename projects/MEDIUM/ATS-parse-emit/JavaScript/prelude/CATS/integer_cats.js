/*
******
*
* HX-2014-08:
* for JavaScript code
* translated from ATS
*
******
*/

/*
******
* beg of [integer_cats.js]
******
*/

/* ****** ****** */

function
ats2jspre_abs_int0(x) { return Math.abs(x) ; }

/* ****** ****** */

function
ats2jspre_add_int0_int0(x, y) { return (x + y) ; }
function
ats2jspre_sub_int0_int0(x, y) { return (x - y) ; }
function
ats2jspre_mul_int0_int0(x, y) { return (x * y) ; }

/* ****** ****** */

function
ats2jspre_add_int1_int1(x, y) { return (x + y) ; }
function
ats2jspre_sub_int1_int1(x, y) { return (x - y) ; }
function
ats2jspre_mul_int1_int1(x, y) { return (x * y) ; }

/* ****** ****** */

function
ats2jspre_lt_int0_int0(x, y) { return (x < y) ; }
function
ats2jspre_lte_int0_int0(x, y) { return (x <= y) ; }
function
ats2jspre_gt_int0_int0(x, y) { return (x > y) ; }
function
ats2jspre_gte_int0_int0(x, y) { return (x >= y) ; }
function
ats2jspre_eq_int0_int0(x, y) { return (x === y) ; }
function
ats2jspre_neq_int0_int0(x, y) { return (x !== y) ; }

/* ****** ****** */

function
ats2jspre_lt_int1_int1(x, y) { return (x < y) ; }
function
ats2jspre_lte_int1_int1(x, y) { return (x <= y) ; }
function
ats2jspre_gt_int1_int1(x, y) { return (x > y) ; }
function
ats2jspre_gte_int1_int1(x, y) { return (x >= y) ; }
function
ats2jspre_eq_int1_int1(x, y) { return (x === y) ; }
function
ats2jspre_neq_int1_int1(x, y) { return (x !== y) ; }

/* ****** ****** */
//
function
ats2jspre_print_int(x)
{
  process.stdout.write(x.toString()) ; return ;
}
function
ats2jspre_prerr_int(x)
{
  process.stderr.write(x.toString()) ; return ;
}
//
/* ****** ****** */

/* end of [integer_cats.js] */