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

// 2. Mathematical Glyph Shorthands & Delimiters
#let prod = sym.product
#let langle = sym.chevron.l
#let rangle = sym.chevron.r

/// Inner product shorthand: $\langle u, v \rangle$
#let ip(u, v) = math.lr($chevron.l #u, #v chevron.r$)

// 3. Named Algebraic Operators (math.op)
#let ker = math.op("ker")
#let Ker = math.op("Ker")
#let Hom = math.op("Hom")
#let Ext = math.op("Ext")
#let Tor = math.op("Tor")
#let Ann = math.op("Ann")
#let Im = math.op("Im")
#let im = math.op("im")
#let Coker = math.op("Coker")
#let coker = math.op("coker")
#let Coim = math.op("Coim")
#let coim = math.op("coim")
#let End = math.op("End")
#let Aut = math.op("Aut")
#let Gal = math.op("Gal")
#let Inn = math.op("Inn")
#let Spec = math.op("Spec")
#let Supp = math.op("Supp")
#let Ass = math.op("Ass")
#let Jac = math.op("Jac")
#let Nil = math.op("Nil")
#let Frac = math.op("Frac")
#let Cl = math.op("Cl")
#let deg = math.op("deg")
#let Tr = math.op("Tr")
#let Nr = math.op("N")
#let gcd = math.op("gcd")
#let lcm = math.op("lcm")
#let ev = math.op("ev")
#let rad = math.op("rad")

// 4. Linear Algebra & Matrix Operators
#let tr = math.op("tr")
#let det = math.op("det")
#let rank = math.op("rank")
#let diag = math.op("diag")
#let sgn = math.op("sgn")
#let adj = math.op("adj")
#let cof = math.op("cof")
#let span = math.op("span")
#let Span = math.op("span")
#let Row = math.op("Row")
#let Col = math.op("Col")
#let Null = math.op("Null")
#let nullity = math.op("nullity")
#let pf = math.op("pf")
#let proj = math.op("proj")
#let dist = math.op("dist")
#let Char = math.op("char")
#let GL = math.op("GL")
#let SL = math.op("SL")
#let SO = math.op("SO")
#let SU = math.op("SU")
#let Sp = math.op("Sp")
#let U = math.op("U")
#let O = math.op("O")
#let PSL = math.op("PSL")
#let PGL = math.op("PGL")
#let Stab = math.op("Stab")
#let Orb = math.op("Orb")
#let Syl = math.op("Syl")
#let Lie = math.op("Lie")

// 5. Dots Shorthands
#let vdots = sym.dots.v
#let ddots = sym.dots.down

// 6. Overline / Residue Class Shorthand
#let ol(body) = overline(body)
