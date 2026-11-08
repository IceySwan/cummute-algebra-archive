// ============================================================
// Mathematical Operators & Symbols Library
// Fully decoupled from document layout and visual theme
// ============================================================

#import "@preview/xarrow:0.3.1": xarrow

// 1. Circled Operations (Native Symbols)
#let oplus = sym.plus.o
#let otimes = sym.times.o
#let bigoplus = sym.plus.o.big
#let bigotimes = sym.times.o.big

// 2. Relations & Set Logic (Native Symbols)
#let neq = sym.eq.not
#let iff = sym.arrow.l.r.double
#let cap = sym.inter
#let cup = sym.union

// 3. Named Algebraic Operators (math.op)
#let ker = math.op("ker")
#let Hom = math.op("Hom")
#let Ann = math.op("Ann")
#let Im = math.op("Im")
#let Coker = math.op("Coker")
#let End = math.op("End")
#let Spec = math.op("Spec")
#let Jac = math.op("Jac")
#let Nil = math.op("Nil")

// 4. Overline / Residue Class Shorthand
#let ol(body) = overline(body)
