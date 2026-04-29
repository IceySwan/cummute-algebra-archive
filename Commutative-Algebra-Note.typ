#import "@preview/bubble:0.2.2": *
//#import "@preview/cetz:0.3.2"
//#import "@preview/fletcher:0.5.5" as fletcher: node, edge
#import "@preview/numbly:0.1.0": numbly
#import "@preview/theorion:0.3.2": *
#import "@preview/xarrow:0.3.1": xarrow
//#import cosmos.fancy: *
#import cosmos.rainbow: *
// #import cosmos.clouds: *
#show: show-theorion

#show: bubble.with(
  title: "Commutative Algebra",
  subtitle: "Beta Ver0.26.1",
  author: "XNC",
  //affiliation: "School of Mathematics and Statistics",
  date: datetime.today().display(),
  //year: "2025",
  //class: "Pure Mathematics",
  main-color: "4DA6FF", //set the main color
)
#heading(numbering: none, level: 1)[Preface]
Created in 2025 Spring, Updated in 2025.06.
- Professor #link("https://www5.zzu.edu.cn/math/info/1174/3688.htm")[丁岩峭]
- Textbook M.F. Atiyah and I.G. Macdonald, Introduction to commutative algebra, Addison-Wesley.
- Supplement https://byeongsuyu.github.io/_pdf/Atiyah_Macdonald_Supplement.pdf
考试范围, 前四章作业编号的前十道题

#align(right)[XNC 于 ZZU 2025.06.25]

//#heading(level: 1, numbered: false)

#show heading.where(level: 1): it => {
  counter(math.equation).update(0)
  it
}

#set math.equation(numbering: n => {
  numbering("(1.1)", counter(heading).get().first(), n)
  // if you want change the number of number of displayed
  // section numbers, modify it this way:
  /*
  let count = counter(heading).get()
  let h1 = count.first()
  let h2 = count.at(1, default: 0)
  numbering("(1.1.1)", h1, h2, n)
  */
})

#let neq = $eq.not$
#let ker = math.op("ker")

#let ol(body) = $ overline(#body) $
#let iff = $arrow.l.r.double$
#let cap = $ inter $
#let cup = $ union $
= Ring
== Rings & Ring Homomorphisms
#definition(title: "Ring")[
  $A$ is a non-empty set with binary operators '$+$ ' and ' $dot.op$ ', then $A$ is a ring if

  + $(A , +)$ is an abelian group
  + $(A , dot.op)$ is a semi-group
    + $exists 1_A in A$, $1_A dot.op a = a dot.op 1_A = a$, $forall a in A$

    + $forall a , b in A$, $a dot.op b = b dot.op a$

  + $forall a , b , c in A$, $a dot.op (b + c) = a dot.op b + a dot.op c$ and $(a + b) dot.op c = a dot.op c + b dot.op c$

  If these two additional items are satisfied, then $A$ is a commutative ring with units.

]
#remark[
  Throughtout this book, we will use ring shall mean commutative ring with units.
]
#example[
  + $M_n (bb(R)) = { (a_(i j))_(n times n) : a_(i j) in bb(R) }$, and the operations are defined as usual matrix addition and multiplication. Then $(M_n (bb(R)) , +)$ is an abelian group and $(M_n (bb(R)) , dot.op)$ is a semigroup, but not commutative.

  + $k [x] = { f (x) = sum_(i = 0)^n a_i x^i : a_i in bb(R) , n in bb(Z_(+)) }$, then $(k [x])$ is an abelian group and $(k [x] , dot.op)$ is a semigroup, with commutative and unit.

  + $k [x] = { f (x_1 , x_2 , dots.h , x_n) = sum_(i_1 , dots.h , i_n in Lambda) a_(i_1 , dots.h , i_n) x_(i_1) dots x_n^(i_n) : lr(|Lambda|) < oo }$ is a ring
]
#definition(title: "Homomorphism")[
  Let $A , B$ be two rings, $phi : A arrow.r B$ is a map be called homomorphism if

  + $phi (a + b) = phi (a) + phi (b)$

  + $phi (a b) = phi (a) dot phi (b)$

  + $phi (1_A) = 1_B$

]
#remark()[If $f: A -> B, g: B -> C$ are ring homomorphism, then $g compose f: A -> C$ is homomorphism.
]
#example[
  Let $phi$ be a homomorphism bewtwen two rings $A , B$, we define
  $ ker phi = { a in A: phi(a) = 0 } $
  Obviously, $ker phi$ is an ideal of $A$, and
  $ forall b in A, a in ker phi, => phi(b dot a) = phi(b) dot phi(a) = phi(b) dot 0 = 0 $
]
== Ideals and Quotient Rings
#definition(title: "Ideal")[
  Let $0 neq frak(a) subset A$, if $frak(a)$ is a subgroup of $(A , +)$ and $forall a in A , b in frak(a)$, $a dot.op b in frak(a)$, then $frak(a)$ is an ideal of $A$.
]
#definition(title: "Quotient")[
  Let $frak(a)$ is an ideal of ring $A$, then $A \/ frak(a)$ is a ring defined as follows: $ A \/ frak(a) = { a + frak(a) : a in A } $
  where the $a + frak(a)$ is the equivalence class of $a$, or residue class of $a$.

]
#remark()[
  Let $frak(a)$ be an ideal of $A$, there is a surjective homomorphism $ phi : A arrow.r A \/ frak(a) , quad phi (a) = a + frak(a) $
]
#proposition()[
  Let $frak(b) subset A$ is an ideal of $A$ and $frak(a) subset frak(b), b in frak(b)$, then $exists b = a+a'(a in A, a' in frak(a)), "s.t." phi(b)=a+frak(a)$. there $phi$ is bijection, s.t. $phi: frak(b)->A\/frak(a)$

]

== Zero-divisors, Nilpotents and units
#definition(title: "Zero-divisor")[
  $x$ is a zero-divosor of $A$ if $exists y neq 0 in A, "s.t." x dot y = 0$

  A ring R with $"zero -divosor" neq 0("and which" 1 neq 0)$ is called an integral domain.
]
#definition(title: "Nilpotent")[
  $x$ is a nilpotent of $A$ if $exists n in bb(Z_(+))$, s.t. $x^n = 0(n>0)$
]
#remark()[
  An nilpotent element is zeri-divisor (unless $A=0$) but not conversely(in geneal).
]
#definition(title: "Unit")[
  $x$ is a unit of $A$ if $exists 1 y in A$, s.t. $x dot y = 1_A$
]
#remark[
  The element $y$ is then uniquely determined by $x$ and is written $x^(-1)$. The units is A form a (multiplicative) abelian group.
]
#definition(title: "Principal")[
  $frak(a) in A$ is a principal ideal if $frak(a) in A, s.t. frak(a)=(a)={a b in A: b in A}$
]
#definition(title: "Field")[
  $A$ is a field if $forall a neq 0 in A$ is unit.
]
In other words, $A$ is a field $<=> 0$ is the only non-unit.
#proposition()[
  Let $A neq 0$ is a ring, then the follow are equivalent:
  1. $A$ is a field
  2. The only Ideals in $A$ is $0$ and $(1)$
  3. Let $B neq 0$ is a ring, $forall "homo-" phi : A -> B$ is injective.
]
#proof[
  $1 => 2$: Let $frak(a) neq 0$ is an ideal of $A$, $forall 0 neq x in frak(a)$, $x$ is a unit. Hence $frak(a) supset (x) = (1) => frak(a)=(1)$.

  $2=>3$: Let $phi: A->B$ is a homomorphism, then $ker(phi) neq (1)$ is an ideal of $A$. Hence $ ker(phi)=0 => phi "is injective." $

  $3=>1$: Let $x in A$ isn't an unit, so $(x) neq (1)$. Let $B = A\/(x)$ is an ideal $ phi: A-> B, quad a |->a+(x) $
  so $phi$ is injective. We get $phi(0)=0+(x)=0 => (x)=0 => A "is a field."$
]
== Prime ideals and maximal ideals
#definition(title: "Prime ideal")[
  An ideal $frak(p) subset A$ is prime ideal if
  $ frak(p) neq (1) and (x y in frak(p) => x in frak(p) or y in frak(p)) $
]
#definition(title: "Maximal ideal")[
  An ideal $frak(m) subset A$ is maximal ideal if
  $ frak(m) neq (1) and (exists! frak(a) subset A, "s.t." frak(m) subset frak(a) subset (1)) $
]
#remark[
  1. $frak(p) "is prime" => A\/frak(p) "is an integral domain"$
  2. $frak(m) "is maximal" => A\/frak(m) "is a field"$
  Hence a maximal ideal is prime ideal, but not conversely. The $0$ is prime $<=>$ $A$ is an integral domain.
]
Prime ideals are funcdamental to the whole of commutative algebra. The following theorem and corollaries ensure that there is always a sufficient supply of them.
#theorem()[
  $forall A neq 0$ is a ring has at least one maximal ideal.
]

#corollary()[
  If $frak(a) neq (1)$ is an ideal of $A$, then $exists frak(m)$ is a maximal ideal of $A$ s.t. $frak(a) subset frak(m)$.
]
#corollary()[
  $forall a in A$ is non-unit, then $a in frak(m)$
]<non-unit>
#proof[
  Suppose $a in.not frak(m)$ is non-unit of $A$, then $frak(m) + (a) = (1) = A$. Hene
  $ exists m in frak(m), b in A, "s.t." b a + m = 1 => a b = 1 - m => a b "is unit" => a "is unit" $
  It is a contradiction, so $a in frak(m)$.
]
#proposition()[
  1. Let $A$ be a ring, $frak(m) neq (1)$ is an ideal of $A$, s.t. $forall x in A\\frak(m)$ is a unit of $A$. Then $A$ is a local ring and $frak(m)$ is maximal ideal.
  2. Let $A$ be a ring, $frak(m)$ is maximal ideal of $A$, s.t. $forall 1+x("where" x in frak(m))$ is a unit of $A$. Then $A$ is a local ring.
]
#definition(title: "Local ring")[
  A ring $A$ is a local ring if A has exist unique maximal ideal.
]
== Nilradical and Jacobson radical
#proposition()[
  The set $frak(N)$ of all nilpotent elements in ring $A$ is an ideal and $forall x in A\/frak(N), x neq 0$.
]
#proof[
  Let $frak(N)= {x: x "is nilpotent element in" A}$, then



  $
    forall a in A, a x in frak(N),(x^n=0 => (a x)^n = a^n x^n = 0 in frak(N)) \
    forall x,y in frak(N), x^m=0, y^n=0 => (x+y)^(m+n+1) = 0 in frak(N) => x+y in frak(N)
  $
  Hence $frak(N)$ is an ideal of $A$. Let $overline(x)=x+frak(N) in A\/frak(N) => overline(x)^n = x^n$, then $forall overline(x)$ is nilpotent element, so $ ol(x^n)=0=x^n => x=0 $
]
#definition(title: "Nilradical")[
  The ideal $frak(N)$ is called the nilradical of $A$.
]
#proof[
  Let $frak(N)' = cap frak(p)$, $f in A$ is nilpotent, Hence
  $ exists n >0, "s.t." f^n =0 in frak(p) => f in frak(p) => f in frak(N)' => frak(N) subset frak(N)', $
  Conversely, suppose $Sigma = {g: g "is not nilpotent"}$, so $Sigma$ has a maximal element $frak(p)$ by Zorn's Lemma, let $x, y in.not frak(p)$, s.t.
  $ g^m = frak(p)+(x), g^n = frak(p)+(y) => frak(g)^(m+n) =frak(p)+(x y) in.not frak(p) $
  we get $frak(p)$ is prime ideal, so $g in.not frak(N)'$.
]
#proposition()[
  Let $frak(N)$ is the nilradical of $A$, $frak(p)$ is prime ideal of $A$, then $frak(N)= cap frak(p)$
]<prop:radical-form>
#definition(title: "Jacobson radical")[
  The Jacobson radical $frak(R)$ of $A$ is defined to be $frak(R)=cap frak(m)$, where $frak(m)$ is the maximal ideal of $A$.
]
#proposition()[
  $x in frak(R) <=> 1- x y$ is a unit in $A, forall y in A$
]
#proof[[$=>$] Suppose $1-x y$ is not unit in $A$, then $exists frak(m)$, s.t. $1-x y in frak(m)$ by @non-unit , but $frak(R)=cap frak(m)$. Hence $x y in frak(m) => 1 in frak(m)$, which is a contradiction.

  [$arrow.l.double$] Suppose $exists frak(m)$ is maximal ideal, s.t. $x in frak(m)$. so
  $ frak(m) subset (x)+ frak(m)=(1) => exists y in A, z in frak(m), "s.t." x y+z=1 =>z=1-x y => frak(m) =(1), $
  contradiction.
]
== Operations on Ideals
1. Sum: $frak(a+b)={x+y: x in frak(a), y=frak(b)}$ is ideal.
2. Intersection: $frak(a cap b) = {z : z in frak(a cap b)}$ is an ideal.
3. Production: $frak(a) dot frak(b) = {x y : x in frak(a), y in frak(b)}={sum x_(i)y_(i): x_(i) in frak(a), y_{i} in frak(b)}$ is an ideal.
The three operations so far defined all commutative and associative. Also there is a distributive law
$ frak(a) dot (frak(b) + frak(c)) = frak(a) dot frak(b) + frak(a) dot frak(c) $
#proof()[
  ($subset$) Let $z in frak(a(b+c)) => z=sum a_(i)(b_(i)+c_(i)) = sum a_(i)b_(i) + sum a_(i)c_(i) in frak(a)frak(b) + frak(a) frak(c)$

  ($supset$) obviously.
]
#definition(title: "Coprime")[$frak(a), frak(b)$ are said to be coprime if $frak(a+b)=(1)(x+y=1)$.
]
#remark[Thus for coprime ideals we have $frak(a cap b) = frak(a dot b)$.

  #proof()[
    ($subset$) Let $z in frak(a(b+c)) => z=sum a_(i)(b_(i)+c_(i)) = sum a_(i)b_(i) + sum a_(i)c_(i) in frak(a)frak(b) + frak(a) frak(c)$

    ($supset$) obviously.
  ]]
4. Direction Product: Let $A_(1),...A_(n)$ be rings, put $A=product_(i=1)^(n) A_(i)$ is a ring and
$
    +: & A times A -> A, quad (x_(1), ... , x_(n)), (y_(1), ... , y_(n)) mapsto (x_(1) + y_(1), ..., x_(n) + y_(n)) \
  dot: & A times A -> A, quad (x_(1), ... , x_(n)), (y_(1), ... , y_(n)) mapsto (x_(1) y_(1), ..., x_(n) y_(n))
$
we call $A$ is a the direct product of $A_(i)$ and
$P_(i): A -> A_(i), (x_(1), ... , x_(n)) mapsto x_(i)$ is a surjective homomorphism
#proposition()[
  Let A be a ring and $frak(a)_(i)$ are ideals of $A$
  $ phi : A -> product A\/frak(a)_(i), quad x mapsto (x+frak(a)_(1),...,x+frak(a)_(n)) $
  then
  1. If $frak(a)_(i)+frak(a)_(j)=(1)(i neq j) => product frak(a)_(i) = cap frak(a)_(i)$
  2. $phi$ is surjective $iff frak(a)_(i)+frak(a)_(j)=(1)$
  3. $phi$ is injective $iff cap frak(a)_(i) = 0$
]
#proof[
  (3). ${0} = ker(phi)=phi^(-1)(0,...,0)={x in A: x in frak(a)_(k), k=1,dots,n} = cap frak(a)_(i)$
]
5. Union: If $frak(a)_(1), frak(a)_(2)$ are ideals of $A$, then $frak(a)_(1) cup frak(a)_(2)$ isn't ideal in general.
#proposition()[
  1. Let $frak(p)_(1), dots, frak(p)_(n)$ be prime ideals, $frak(a)$ be an ideal and $frak(a) subset cup_(i=1)^(n) frak(p)_(i)$, then $frak(a) subset frak(p)_(i)$ for some $i$
  2. Let $frak(a)_(1), dots, frak(a)_(n)$ be ideals, $frak(p)$ be prime ideal and $frak(p) supset cap_(i=1)^(n) frak(a)_(i)$, then $frak(p) supset frak(a)_(i)$ for some $i$
]<prop:1.11>
6. Quotient:
#let Ann = "Ann"
$
  (frak(a):frak(b)) = {x in A, x frak(b) subset frak(a)}, \
  Ann(frak(b))=(0:frak(b)) = {x in A: x frak(b) = 0}
$
Specially, if $frak(b)$ is a prime ideal of $A$, then $Ann(x) = Ann(frak(b))$. Let $D$ be the set of zero-divisors in $A$ is $D=cap_(x neq 0) Ann(x)$.

7. Radical
$ r(frak(a)) = {x in A: exists n>0, "s.t." x^n in frak(a)}, $ obviously, we can get $frak(a) subset r(frak(a))$
#proposition()[$r(frak(a))=cap_(i=1)^(n)frak(p)_(i)$, where $frak(p)_(i)$ is prime ideal of $A$ s.t. $frak(a) subset frak(p)_(i)$.
]
#proof[
  Let $r(A\/frak(a)) = frak(N) = cap frak(q)_(i) = cap frak(p)_(i) + frak(a)$ by @prop:radical-form, where $frak(p)_(i)$ is prime ideal of $A$, then
  $
    forall f in r(A\/frak(a)) = frak(N), exists n>0, "s.t." f^n = 0 in A\/frak(a) => f in frak(a) => frak(q)_i supset frak(a)
  $
]
#proposition()[
  $D$ is the set of zero-divisors of $A$, then $D = cup_(x neq 0) r(Ann(x))$.
]<prop:1.15>
#proof[
  $D = r(D) = r(cup_(x neq 0) Ann(x)) = cup_(x neq 0)r(Ann(x))$
]
#proposition()[
  Let $frak(a),frak(b)$ be ideals in ring $A$, s.t. $r(frak(a))+r(frak(b))=(1) => frak(a)+frak(b)=(1)$
]
#proof()[
  $r(frak(a)+frak(b))=r(r(frak(a)) + r(frak(b))) = r(1) => frak(a)+frak(b)=(1)$
]
8. Extension and contraction
Let $f:A -> B$ is a homomorphism, $frak(a) subset A, frak(b) subset B$ is ideals then

$ frak(b)^(c) = f^(-1)(frak(b)) = {a in A: f(a) in frak(b)} $
is a ideal of $A$, called contraction, but
$ f(frak(a)) = {b in B: exists a in frak(a), "s.t." f(a)=b} $
is not ideal of $B$ in general. We let $frak(a)^e = <f(frak(a))>$ is the ideal of $B$, called extension.
#proposition()[Let $f:A -> B$ is a homomorphism, $frak(a) subset A, frak(b) subset B$ is ideals then
  1. $frak(a) subset frak(a)^(e c), frak(b) supset frak(b)^(c e)$
  2. $frak(a)^(e)=frak(a)^(e c e), frak(b)^(c)=frak(a)^(c e c)$
  3. If $C$ is the set of contradicated ideals in $A$ and $E$ is the set of extended ideals in $B$, then
  $ C= {frak(a): frak(a)^(e c) = frak(a)}, E= {frak(b): frak(b)^(c e) = frak(b)} $
  and $phi: frak(a) -> frak(a)^(e)$ is a bijection, where inverse map is $phi^(-1): frak(b) -> frak(b)^(c)$
]
= Modules
== Modules and module homomorphisms
#definition(title: "Module")[
  Let $A$ be a ring, $M$ be an abelian group. $M$ is a A-module if exist map
  $ phi: A times M -> M $
  s.t $forall a, b in A, m_(1),m_(2) in M$
  1. $phi(a, m_(1)+m_(2)) = phi(a, m_(1))+phi(a, m_(2))$
  2. $phi(a+b, m) = phi(a, m)+phi(b, m)$
  3. $phi(a b, m) = phi(a, phi(b, m))$
  4. $phi(1_A, m) = m$
]
#remark()[For express, we write $phi(a, m)=a dot m$, where $a in A, m in M$.
]
#definition(title: "Homomorphism")[
  Let $M, N$ be A-modules. $f: M -> N$ is a homomorphism if
  $ f(m_(1)+m_(2)) = f(m_(1))+f(m_(2)), quad f(a m) = a f(m), forall a in A, x,y in M $
]
#let Hom = "Hom"
#definition(title: "Hom")[
  Let $M, N$ be A-modules, set

  $ Hom_(A)(M,N) = {f: M-> N : f "is a homomorphism"} $
]
#proposition()[$Hom_(A)(M,N)$ is a A-module
]
#proof()[$forall f_(1), f_(2) in Hom_(A)(M,N), x in M, a in A$, then
  $ (f_(1)+f_(2))(x) = f_(1)(x)+f_(2)(x), quad (a f)(x) = a f(x) $
]

For any module $M$. therew is a natural isomorphism $Hom(A, M) tilde.equiv M$.
== Submodule and quotient module
#definition(title: "Submodule")[
  A submodule $M'$ of $M$ if $M' subset M$ is subgroup and $M'$ is A-module.
]
#definition(title: "Quotient module")[
  Let $M'$ be a submodule of $M$, then
  $ M\/M' = {m + M' : m in M} $
  is a quotient module.
]
Obviously, we com get $pi : M-> M\/M', quad m mapsto m +M'$ is natural homomorphism, then $pi$ is a bijection.

#let Coker = math.op("Coker")
#let Im = math.op("Im")

#example()[If $f: M -> N$ is an A-module homomorphism, then
  $
    ker(f) = { x in M: f(x) = 0 } "is submodule of M"\
    Im(f) = f(M) "is submodule of N"\
    Coker(f)= N\/Im(f) "is quotient module of N"
  $
  If $M' subset M$ is submodule, s.t. $M' subset ker(f)$, let
  $ ol(f) = M\/M' -> N, quad ol(x) mapsto ol(f)(ol(x))=f(x) $
  we get $ker(ol(f)) = ker(f)\/M'$, if we set $M' = ker(f)$, we can get $M\/ker(f) tilde.equiv Im(f)$.
]

== Operations on submodule
1. Sum
$ sum_(i in I) M_(i) = {m=sum x_(i): x_(i) in M_(i), forall i in I, x_(i)=0 "expect finite i"} $
is a submodule.
2. Intersection
$ cap_(i in I) M_(i) ={m: m in M_(i), forall i in I} $ is a submodule. Thus the submodules of $M$ form a complete lattice with respect to inclusion.
#proposition()[
  1. If $L supset M supset N$ are A-module, then $(L\/N)\/ (M\/N) tilde.equiv L\/M$.
  2. If $M_(1), M_(2)$ are submodule of $M$. then $(M_(1)+M_(2))\/M_(1) tilde.equiv M_(2)\/(M_(1) cap M_(2))$
]
#proof()[
  1. set
  $ f: L \/ N -> L \/ M, quad f(l+N) = l+M $
  we can simarly proof $f$ is well-define and $ker(f) = M\/N$. Hence
  $ (L\/N)\/ker(f) = Im(f) => (L\/N)\/(M\/N) = L\/M $
  2. set $g: M_(2) -> (M_(1)+M_(2))\/M_(1)$, like 1., $g$ is surjective, and $ker(g)=M_(1) cap M_(2)$.
]
3. Quotient: Let $M_(1),M_(2)$ are submodule of $M$, then
$ (M_(1):M_(2)) = {r in A: r M_(2) subset M_(1)} $
is an ideal of $A$. In particular, $Ann(M)=(0:M)={a in M: a M =0}$ is called the annihilator of $M$.

If $frak(a) subset Ann(M)$, we can regard $M$ as a $A\/frak(a)$-module, then
$ f: A\/frak(a) times M -> M, quad (ol(a), m) mapsto a m $
where $ol(a) = a+frak(a)$.

A-module is faithful if $Ann(M)=0$. If $Ann(M)=frak(a)$, then $M$ is faithful as $A\/frak(a)$-module.

4. Direct Sum: Set $M_(i)$ is A-module, then $plus.o M$ is a A-module (and abelian group), $|I| < infinity$,
$
  (x_(1), dots x_(n))+(y_(1),dots y_(n)) & = (x_(1)+y_(1), dots x_(n)+y_(n)) in plus.o M_(i) \
                    a(x_(1), dots x_(n)) & = (a x_(1), dots a x_(n)) in plus.o M_(i)
$
where almost all $x_(i)=0$ expect finite $i$. If we drop the restriction on the number of non-zero components, we get the direct product $product M_(i)$.

#remark[
  In other words, direct sum is the direct product of A-modules with the restriction that only finitely many components are non-zero. There be same if $|I| < infinity$
]

If set $ frak(a) = <(0,dots,0, 1, 0, dots, 0)> = {(0,dots,0, a_(i), 0, dots, 0): a_(i) in A_(i)} $
the ring $A$ considered as A-module as: $A=plus.o_(i in I) frak(a)_(i)$
#remark[
  Give a module decomposition $A = plus.o_(i=1)^(n) frak(a)_(i)$ of $A$ as a direct sum of ideals, we have
  $ A tilde.equiv product_(i=1)^(n)(A\/frak(b)_(i)), $
  where $frak(b)_(i) = plus.o_(j neq i) frak(a)_(i)$. Each ideal $frak(a)_(j)$ is a ring (isomorphic to $A \/frak(b)_(i)$), The identity element $e_(i) in frak(a)_(i)$ is an idempitent in $A$, and $frak(a)_(i) = e_(i)$.
]
#definition(title: "f.g. module")[$M$ is a finite generated A-module, if
  $
    x_(1), dots x_(n) in M, "s.t." M=sum_(i=1)^(n) A x_(i)("i.e." forall m in M, exists a_(i) in A, "s.t." m=sum_(i=1)^(n) a_(i) x_(i). )
  $
]
// This is a commit
#definition(
  title: "f.g. free module",
)[$M$ is a f.g. free A-module, if $M=plus.o_(i=1)^(n) A_(i)$, where $A(i)$ is a A-module.
]
#proposition()[
  $M$ is f.g. A-module $<=> M tilde.equiv A^n\/I$, where I is an ideal, $n>0$.
]
#proof()[
  [=>]Suppose $x_(1),dots, x_(n)$ is generators of $M$,
  $ phi : A^n -> M, quad (a_(1), dots a_(n)) |-> sum_(i=1)^(n) a_(i) x_(i) $
  so $phi$ is isomorphism, so $M tilde.equiv A^n \/ker(phi)$

  [<=] Obviously.
]
#definition(title: "endomorphism")[
  Let $M$ be a A-module, $phi: M -> M$ is an endomorphism of $M$ if $phi$ is a homomorphism.

  $"End"_(A)(M) = {phi: phi "is endmomorphism of" M}$
]
#proposition()[
  Let $M$ be a f.g. A-module, $frak(a)$ is ideal of $A$, and $phi: M -> M$ be an A-module endomorphism, such that. $phi(M) subset frak(a)M$, then $phi$ is satisfied the following
  $ phi^(n)+ a_(1)phi^(n-1)+ dots + a_(n) = 0, quad a_(i) in frak(a) $
]<A-dmodule-endomorphism>

#corollary()[
  Let $M$ be f.g. A-module, and $frak(a)$ is ideal of $A$, s.t. $frak(a) M = M$, then $exists x=1 mod frak(a)$, s.t. $x dot M=0$
]<A-dmodule-0-endomorphism>
#proof[
  Let $phi =id, x=1+a_(1)+dots + a_(n) => x dot M=0$ by @A-dmodule-endomorphism
]
#lemma(title: "Nakayama")[
  Let $M$ be f.g. A-module, $frak(a)$ is ideal of $A$ and $frak(a) subset frak(R)$. Then $frak(a) M=M => M=0$.
]<prop:Nakayama-lemma>
#proof[
  By @A-dmodule-0-endomorphism, we have $x M =0 (forall x=1 mod frak(R))$, hence $x$ is a unit of $A$, so $M=x^(-1)x M =0$
]
#corollary()[
  Let $M$ be f.g. A-module, $N$ is submodule of $M$, $frak(a) subset frak(R)$ is ideal, then $M=frak(a) M +N => M=N$.
]<col-2.7>
#proof[
  Apply @prop:Nakayama-lemma to $M\/N$, we get
  $ M\/N = (frak(a) M + N)\/N = frak(a)(M\/N) => M=N $
]
#proposition()[
  A is local ring, $frak(m)$ is the maximal ideal of $A$, $A\/frak(m)$ is the residue field of $A$.

  M is f.g. A-module, $frak(m) M$ is submodule of $M$, $M \/ frak(m)M$ is $A\/frak(m)$-module. We have natural homomorphism
  $ phi: M -> M \/ frak(m)M, quad x |-> phi(x)=x + frak(m)M $
  Let $x_(1), dots x_(n) in M$, s.t. ${phi(x_(i))}_(i=1)^(n)$ are basis of $M\/frak(m)M$, then $x_(1), dots x_(n)$ generator $M$.
]
#proof()[
  Let $N$ be the submodule of $M$ generated be ${x_(1), dots , x_(n)}$, then
  $ N xarrow(tau) M xarrow(phi) M\/frak(m)M, quad x|-> x |-> x+frak(m)M $
  $phi compose tau$ is surjective homomorphism, so $N+frak(m)M tilde.equiv M => M tilde.equiv N$ by @col-2.7
]

== Exact sequences
#definition(title: "Exact sequence")[
  A sequence of A-modules and homomorphisms
  $ dots -> M_(i-1) xarrow(f_(i)) M_(i) xarrow(f_(i+1)) M_(i+1) -> dots $<exact-seq>
  is exact at $M_(i)$, if $Im(f_(i)) = ker(f_(i+1))$. The sequence is exact if it is exact at every $M_(i)$. In particular,
  $
                      0 -> M' xarrow(f) M "is exact" & <=> f "is injective" \
                      M xarrow(g) M'' ->0 "is exact" & <=> g "is surjective" \
    0 -> M' xarrow(f) M xarrow(g) M'' ->0 "is exact" & <=> f "is injective" and g "is surjective"
  $<exact-sequence-example-3>
  and $g$ induces a isomorphism of $Coker(f) = M\/f(M')$ onto $M''$
]
A sequence of type @exact-sequence-example-3 is called short exact sequence. Any long exact sequence @exact-seq can be split up into short exact sequence, if $N_(i) = Im(f_(i)) = ker(f_(i+1))$, we have short exact sequence
$ 0-> N_(i) -> M_(i) -> N_(i+1) -> 0 , quad forall i $
#proposition()[
  1. Let a sequcence of A-module and homo-,
  $ M' xarrow(u) M xarrow(v) M'' -> 0 $<2.5>
  then the sequcence @2.5 is exact $<=> forall N$, the sequence
  $ 0 -> Hom(M'', N) xarrow(ol(v)) Hom(M, N) xarrow(ol(u)) Hom(M', N) $<2.6>
  is exact.
  2. Let a sequence of A-module and homo-
  $ 0-> N' xarrow(u) N xarrow(v) N'' $<2.7>
  then the sequence @2.7 is exact $<=> forall M$ the sequence
  $ 0 -> Hom(M, N') xarrow(ol(u)) Hom(M, N) xarrow(ol(v)) Hom(M, N'') $ is exact.
]<prop:2.9>
#proposition()[
  Let

  #import "@preview/commute:0.3.0": arr, commutative-diagram, node
  #align(center, commutative-diagram(
    node((0, 0), [$0$]),
    node((0, 1), [$M'$]),
    node((0, 2), [$M$]),
    node((0, 3), [$M''$]),
    node((0, 4), [$0$]),
    node((1, 1), [$N'$]),
    node((1, 0), [$0$]),
    node((1, 2), [$N$]),
    node((1, 3), [$N''$]),
    node((1, 4), [$0$]),
    arr((0, 0), (0, 1), []),
    arr((0, 1), (0, 2), [$u$]),
    arr((0, 2), (0, 3), [$v$]),
    arr((0, 3), (0, 4), []),
    arr((0, 1), (1, 1), [$f'$]),
    arr((0, 2), (1, 2), [$f$]),
    arr((0, 3), (1, 3), [$f''$]),
    arr((1, 0), (1, 1), []),
    arr((1, 1), (1, 2), [$u'$]),
    arr((1, 2), (1, 3), [$v'$]),
    arr((1, 3), (1, 4), []),
  ))
  be a commuitative diagram of A-module and homo-, with the row exact. Then there exist an exact sequence
  $
    0 -> ker(f') xarrow(ol(u)) ker(f) xarrow(ol(v)) ker(f'') xarrow(d) Coker(f') xarrow(ol(u)') Coker(f) xarrow(ol(v)') Coker(f'') -> 0
  $
  in which $ol(u), ol(v)$ are restriction of $u,v$, and $ol(u)',ol(v)'$ are indece by $u', v'$.

]<prop:2.10>
#proof()[
  Only prove $d: ker(f'') -> Coker(f''), x''=v(x),(x in M)$,
  $ v'(f(x)) = f''(v(x)) = 0 => f(x) in ker(v')=Im(u') , $
  Simarly, $ f'(x) in ker(u'), f'' in Im(v') => Coker(f')=N'\/Im(f')=N'\/Coker(u'), $
  we get
  $
    d: ker(f'') -> N'\/ker(u') \
    Im(d) = N'\/ker(u') = ker(ol(u)'), quad ker(d) = ker(u') = Im(ol(v)).
  $
]
#remark[
  @prop:2.10 is a special case of the exact homology sequence of homological algebra.
]
#definition()[
  Let $C$ be a class of A-modules and $lambda$ be a function on $C$, the function $lambda$ is additive, if
  $
    forall "exact sequence" 0 -> M' -> M -> M'' -> 0 => lambda(M')-lambda(M)+lambda(M'') = 0.
  $
]
#example()[
  Let $A$ be a field over $bb(K)$, $C$ be the class of all finite-$dim bb(K)$-vertor space, the $V -> dim(V)$ is an additive function on $C$.
]
#proposition()[
  Let $0 -> M_(0) -> M_(1) -> dots -> M_(m) -> 0$ be an exact sequence of A-modules, in which all the modules $M_(i)$ and the kernel of all the homo- belong to $C$. The any additive function $lambda$ on $C$, we have $ sum_(i=1)^(n)(-1)^(i)lambda(M_(i)) = 0 $
]
#proof()[
  Split up the sequence short exact sequence
  $ 0 -> N_(i) -> M_(i) -> N_(i+1) -> 0, quad "where "(N_(0)=N_(n+1) = 0) $
  then we get $lambda(M_(i)) = lambda(N_(i)) + lambda(N_(i+1))$. Now take the alternative sum of the $lambda(M_(i))$.
]
== Tensor product of modules
#definition(title: "Tensor product")[
  We constructe an A-module $T$, called the tensor product of $M$ and$N$, with the property that $forall "A-module" P$, we have the $A$-bilinear mappings $M times N → P$ are in a natural one-to-one correspondence withe the $A$-linear mappings $T -> P$.
]
#proposition()[
  Let $M, N, T$ be A-module, then there exist a pair $(T,g)$, where $g:M times N -> T$ is bilinear map, with the following properties
  $
    forall "A-module" P, f: M times N -> P "is bilinear map" \
    exists 1 f': T -> P "is linear map, s.t." f=f' compose g.
  $
  Moreover, if $(T,g), (T',g')$ are two pair with this property, then $exists 1$ isomorphism
  $ tau : T -> T' "s.t." tau compose g = g' $
]<prop:2.12>

#let oplus = $plus.o$
#let otimes = $times.o$

#corollary()[Let $x_(i) in M, y_(i) in N$, s.t. $sum x_(i) otimes y_(i) = 0 in M otimes N$, then exist f.g. submodule $M_0$ of $M$, $N_(0)$ of $N$, s.t. $sum x_(i) otimes y_(i) = 0 in M_(0) otimes N_(0)$
]
#proof[
  Let $C$ denote the free A-module $A^(M times N)$, $D$ be the submodule of $C$. if
  $
    sum x_(i) otimes y_(i) =0 => sum x_(i) otimes y_(i) in D => sum x_(i) otimes y_(i) "is finite sum of generator of" D
  $
  Let $M_(0)$ be the submodule of $M$ generated be $x_(i)$, $N_(0)$ is simarly. Then $ sum x_(i) otimes y_(i) in M_(0) otimes N_(0) $
]

In particular, if $M,N$ are f.g. A-module, so is $M otimes N$.
#proposition()[
  Let $M,N,P$ be A-module, then exists unique isomorphism, s.t.
  $ M otimes N -> N otimes M, quad x otimes y |-> y otimes x $
  $
    (M otimes N)otimes P -> M otimes (N otimes P) -> M otimes N otimes P \
    (x otimes y) otimes z |-> x otimes (y otimes z) |-> x otimes y otimes z
  $
  $
    (M oplus N) otimes P -> (M otimes P) oplus (N otimes P), quad (x,y)otimes z |-> (x otimes z, y otimes z)
  $
  $ A otimes M -> M, quad a otimes x |-> a x $
]<prop:2.15>
== Restriction and extension of scalars
#definition()[
  Set $f: A -> B$ be a ring homo-, $N$ be B-module, then $N$ has an A-module structure defined as
  $ forall a in A, x in N, quad (a,x) |-> f(a) dot x $
  This A-module is said to be obtained from $N$ by restriction of scalars. In particular, $f$ defines in this way an A-module structure on $B$.
]
#proposition()[
  Suppose $N$ is f.g. B-module and B is f.g. A-module, then $N$ is f.g. as an A-module.
]
#proof[
  Let $y_(1), dots, y_(n)$ generate $N$ over $B$ and $x_(1),dots, x_(n)$ generate $B$ as an A-module, then the product $x_(i) y_(j)$ generate $N$ over $A$.
]

Now let $M$ be an A-module. Since, as we have just seen, $B$ can be regarded as an A-module, we can form the A-module $M_(B) =B otimes_(A) M$. In fact $M_(B)$ carries a B-module structure s.t.
$ b(b' otimes x) = b b' otimes x, quad forall b, b' in B, x in M. $
The B-module $M_(B)$ is said to be obtained from $M$ by extension of scalars.
#proposition()[
  If $M$ is f.g. as an A-module, then $M_(B)$ is f.g. B-module.
]
#proof[
  If $x_(1), dots, x_(m)$ generate $M$ over A, then $forall x in M, exists a_(i) in A, "s.t." x = sum_(i=1)^(m) a_(i) x_(i)$, then
  $
    b otimes x = b otimes (sum a_(i) x_(i)) = sum b otimes a_(i) x_(i) = sum (b a_(i)) otimes x_(i) = sum b a_(i) (1 otimes x_(i)) in M_(B),
  $
  where $b in B, 1 otimes x_(i) in B$. Hence we get $1 otimes x_(i)$ generate $M_(B)$ over $B$.
]

== Exactnmess properties of the tensor product
#proposition()[
  $ Hom(M otimes N) tilde.equiv Hom(M, Hom(N, P)) $
]<prop:2.14>
#proof[这个证明应该有问题

  Let $f: M times N -> P$ be an A-linear map, $forall x in M, y |-> f(x,y)$ of $N$ into $P$ is A-linear. so $f$ gives rise to a mapping $M -> Hom(N, P)$. so
  $ forall phi "is A-homo-", phi: M -> hom_(A)(N,P), quad (x,y) |-> phi(x)(y) $
  hence the set $S$ of A-bilinear map $M times N -> P$ is 1:1 correspondence with $Hom(M, Hom(N, P))$.

  On the other hand, $S$ is 1-1 correspondence with $Hom(M otimes N, P)$ by define of tensor product. so we have a canonical isomorphism.
]
#proposition()[
  let
  $ M' xarrow(f) M xarrow(g) M'' -> 0 $<2.15>
  be an exact sequence of A-module and homo-, let $N$ by any A-module, then the sequence
  $ M' otimes N xarrow(f otimes id) M otimes N xarrow(g otimes id) M'' otimes N -> 0 $<2.16>
  is exact.
]
#proof[
  Let $E$ donote @2.15, $E otimes N$ denote @2.15, $P$ be any A-module, we can get $Hom(N, P)$ is A-module.

  $E$ is exact $=>Hom(E, Hom(N, P))$ is exact by @prop:2.9. Hence $Hom(E otimes N, P)$ is exac by @prop:2.14. By @prop:2.9 again, it follows that $E otimes N$ is exact.
]
#proposition()[
  The following is equivalent for an A-module $N$.
  1. N is flat
  2. If $0 -> M' -> M -> M'' -> 0$ is exact, the tensor sequence
  $ 0 -> M' otimes N -> M otimes N -> M'' otimes N -> 0 "is flat". $
  3. If $f: M' -> M$ is injective $=> f otimes id : M' otimes N -> M otimes N$ is injective.
  4. If $f: M' -> M$ is injective, and $M, M'$ is f.g., then $f otimes id : M' otimes N -> M otimes N$ is injective.
]
== Algebras
#definition()[
  Let $f:A -> B$ be a ring homo-, $forall a in A, B in B$, define a product $a b = f(a) b$.

  Then this define marks $B$ into A-module $=> B$ has A-module structure as well as a ring structure. The ring $B$ is said to be an A-algebra.
]
#remark[
  1. In particular, if $A=bb(K)$ is field and $B neq 0$, then $f:bb(K) -> B$ is injective and therefore $bb(K)$ can be cononically identified with its image in $B$. Thus a $bb(K)$-algebra is effictively a ring containing $bb(K)$ as a subring.
  2. let $A$ be any ring. Since $A$ an identity element there is a unique homo- of $bb(Z)$ into $A$, $n |-> n dot 1$. Thus evedry ring is automatically a $bb(Z)$-algebra.
]
== Tensor product of algebras
#definition[
  Let $B,C$ be two A-algebra, $f : A -> B, g: A -> C$ are homo-. Since $B,C$ are A-module, so $D=B otimes_(A) C$ is an A-module. We shall define a multiplication on $D$. Consider the map
  $ B times C times B times C -> D, quad (b,c,b',c') |-> b b' otimes c c' $
]
This is A-linear in each factor, so by @prop:2.14, which induce an A-module homo-
$ B otimes C otimes B otimes C -> D $
hence by @prop:2.15, an A-modulehomo- $D otimes D -> D$ and this in ture by @prop:2.12 corresponds to an A-bilinear map
$ mu : D times D -> D $
where is
$
  mu(b otimes c, b' otimes c') = b b', c c' => (sum_(i)(b_(i) otimes c_(i)), sum_(j)(b_(j) otimes c_(j))) = sum_(i,j) (b_(i) b_(j)' otimes c_(i) c'_(j))
$

= Rings and Modules of fractions
Let $A$ is a ring, $S subset A$, s.t. $1 in S, "and" forall a,b in S, a b in S$, then
$
  A times S:(a_(1),s_(1)) tilde (a_(2), s_(2)) <=> exists t in S, "s.t." t(a_(1) s_(s) - a_(2) s_(1)) = 0. \
  A times S\/tilde = {a / s : a in A, s in S} = S^(-1) A
$
we put a ring structure on $S^(-1)A$ be define
$
  S^(-1)A times S^(-1)A -> S^(-1) times A \
  a_(1) / s_(1) + a_(2) / s_(2) = (a_(1)s_(2)+a_(2)s_(1)) / (s_(1)s_(2)), quad a_(1) / s_(1) dot a_(2) / s_(2) = (a_(1)a_(2)) / (s_(1)s_(2))
$
we also have a ring homo- $f: A -> S^(-1)A, f(x) = x / 1$. This isn't injuctive in general.
#remark()[
  If $A$ is an intergal domain and $S=A-{0}$, then $S^(-1)A$ is the field of fractions on A.
]
#definition(title: "Ring of fraction")[
  The ring $S^(-1)A$ is called the ring of fractions of $A$ with respect $S$.
]
It has an universal property.
#proposition(title: "Universal Property")[
  Let $g:A -> B$ be a ring homo-, s.t. $forall s in S, g(s)$ is a unit in $B$, Then $ exists 1 h: S^(-1)A -> B, "s.t." g = h compose f. $
]<prop:Universal-property>

#proof[
  [Uniqueness]Let $h$ satifies the coditions, then $h(a / 1) = h compose f(a) = g(a)(forall a in A)$, then if $s in S$, we get
  $
    h(1\/s) = h((s\/1)^(-1)) = [h(s\/1)]^(-1) = [g(s)]^(-1)\
    => h(a\/s) = h(a\/1)h(1\/s) = g(a)g(s^(-1))
  $
  $=> h$ is uniquely determined by $g$.

  [Existness] Let $h(a\/s) = g(a) [g(s)]^(-1) => h$ is ring homo-. Suppose $a / s = a' / s'$, then
  $ exists t in S, "s.t." (a s' - a' s)t = 0 => (g(a)g(s') - g(a')g(s))g(t) = 0 $
  Since $g(t)$ is a unit, so $g(a)[g(s)]^(-1) = g(a')[g(s')]^(-1)$.
]
#proposition()[
  The ring $S^(-1)A$ and homo- $f:A -> S^(-1)A$ have the follow properties.
  1. $s in S => f(s)$ is a unit in $S^(-1)A$
  2. $f(a)=0 => a s =0$ for some $s in S$
  3. Every element of $S^(-1)A$ is the form $f(a)f(s)^(-1)$ where $a in A, s in S$.
]<prop:3.1>
Conversely, there three properties determined $S^(-1)A$ up to isomorphism.
#corollary()[If $g: A-> B$ is ring homo-, s.t.
  1. $s in S => g(s)$ is a unit in $B$
  2. $g(a) = 0 => a s = 0$ for some $s in S$
  3. Every element of $B$ is the form $g(a)g(s)^(-1)$
  Then there is a unique isomorphism $h: S^(-1)A -> B, h(a\/s) = g(a) g(s)^(-1)$
]
#proof()[
  By @prop:3.1, we have to show that
  $ h: S^(-1)A -> B, h(a\/s) = g(a) g(s)^(-1) $ is isomorphism, By (3), we get $h$ is surjective, Now, just to prove $h$ is injective.
  $ h(a\/s) = 0 => g(a) = 0 => a s =0 "for some" s in S => a / s=0 in S^(-1)A $
  Hence $h$ is injective, so $h$ is isomorphism.
]
#proposition()[
  The operation $S^(-1)$ is exact, i.e.
  $ M' xarrow(f) M xarrow(g) M'' "exact" => S^(-1)M' xarrow(S^(-1)f) S^(-1)M xarrow(S^(-1)g) S^(-1)M'' "exact" $
]<prop:3.3>
#proof()[
  Only need to prove $Im(S^(-1)f) = ker(S^(-1)g)$,

  [$subset$]$ M' xarrow(f) M xarrow(g) M'' "exact" => g compose f=0 => S^(-1)g compose S^(-1)f = S^(-1)(0) = 0 $
  $=> Im(S^(-1)f) subset ker(S^(-1)g)$

  [$supset$] Let $m \/ s in ker(S^(-1)g) => g(m) / s = 0 in S^(-1)M => exists t in S$, s.t. $t dot g(m) = 0 in M''$

  But $t g(m) = g(t m)$ since $g$ is an A-module homo-, so $t m in ker(g) = Im(f)$, so $t m = f(m') in S^(-1)M$ (where $m' in M'$).

  We have $m / s = f(m') / s in Im(S^(-1)f) => ker(S^(-1)g) subset Im(S^(-1)f)$
]
#corollary()[
  If $N, P$ are submodule of $M$, $M$ is A-module, then
  1. $S^(-1)(N+P) = S^(-1)N + S^(-1)P$
  2. $S^(-1)(N cap P) = S^(-1)N cap S^(-1)P$
  3. the $S^(-1)A$-module $S^(-1)(M\/N)$ and $S^(-1)M\/S^(-1)N$ are isomorphism.
]
#proof()[
  Just prove (3). Apply $S^(-1)$ to the exact sequence $0 -> N -> M -> M\/N -> 0$
]
#proposition()[
  Let $M$ be an A-module, then the $S^(-1)A$-module $S^(-1)M$ and $S^(-1)A otimes_(A) M$ are isomorphism; more precisely, $exists 1 f^(-1): S^(-1)A otimes_(A) M -> S^(-1)M$ is isomorphism, s.t.
  $
    f(a / s otimes m) = (a m) / s, quad forall a in A, m in M, s in S
  $
]<prop:3.5>
#proof[
  Let bilinear mapping
  $
    phi: S^(-1) times_A M -> S^(-1)M, quad (a / s,m) |-> (a m) / s
  $<eq:3.1>
  therefore by @prop:Universal-property, $phi$ induce an A-homomorphism
  $
    f : S^(-1)A otimes_(A) M -> S^(-1)M, quad f(a / s otimes m) = (a m) / s
  $
  Clearly, $f$ is surjective, and it's uniquely defined by @eq:3.1. Now to prove $f$ is injective.

  Let $sum_(i)a_(i) / s_(i) m_(i) in S^(-1)A otimes M$. If denote $s = product_(i)s_(i) in S, t_(i) = product_(j neq i) s_(j)$, we have
  $
    sum_(i)a_(i) / s_(i) otimes m_(i) = sum_(i)(a_(i)t_(i)) / s otimes m = sum_(i)1 / s otimes a_(i)t_(i) m =1 / s otimes sum_(i) a_(i)t_(i)m,
    "这里有问题"
  $
  so that every element of $S^(-1)A otimes M$ is of the form $(1 / s)otimes m$.
  $ f((1 / s)otimes m) = 0 => m / s = 0 => t m = 0 $ for some $t in S$, and therefore
  $
    1 / s otimes m =t / (s t) otimes m = 1 / (s t) otimes t m = 1 / (s t) otimes 0 = 0.
  $
  Hence $f$ is injective.
]
#corollary()[
  $S^(-1)A$ is flat A-module.
]
#proof[
  Just because @prop:3.3 and @prop:3.5 and $ forall M' -> M -> M'' "exact" => S^(-1)A otimes M' -> S^(-1)A otimes M -> S^(-1)A otimes M'' "exact." $
]
#proposition()[
  If $M, N$ are A-module, $exists 1 S^(-1)A$-module $f$ is isomorphism
  $
    f: S^(-1)M otimes_(S^(-1)A) S^(-1)N -> S^(-1)(M otimes_(A) N), quad f(m / s)otimes f(n / t) = (m otimes n ) / (s t)
  $
  In particular, if $frak(p)$ in any prime ideal, then $M_(frak(p)) otimes_(A_(frak(p))) (M otimes_(A) N)_(frak(p))$ as $A_(frak(p))$-module.
]
#proof[
  by @prop:3.5, we have $S^(-1)A otimes M tilde.equiv S^(-1)M$, so
  $
    S^(-1)M otimes_(S^(-1)A) S^(-1)N tilde.equiv S^(-1)(M otimes_(A) N)
  $
  Hence we have an isomorphism
  $
    f: S^(-1)M otimes_(S^(-1)A) S^(-1)N -> S^(-1)(M otimes_(A) N),
    quad f(m / s)otimes f(n / t) = (m otimes n ) / (s t)
  $
]
== Local properties
#definition(title: "Local properties")[
  A property $P$ of a ring $A$(or A-module $M$) is said to be a local property if the following is true
  $A("or" M) "has" P <=> A_(frak(p)) "has" P, forall frak(p) "is prime ideal of" A$.
]
The following propositions give example of local properties.
#proposition()[
  Let $M$ is an A-module, then the following are equivalent
  1. $M=0$
  2. $M_(frak(p)) = 0$ for all prime ideal $frak(p)$ of A
  3. $M_(frak(m)) = 0$ for all maximal ideal $frak(m)$ of A
]<prop:3.8>
#proof[$1 => 2 => 3$ is obviously, now to prove $3 => 1$.

  Suppose 3 satified and $M neq 0$, let $x in M, x neq 0$ and $frak(a) = Ann(x) => frak(a) neq (1) "is ideal" => a subset frak(m)$, consider $x / 1 in M_(frak(m)) => x / 1 = 0 => x$ is killed by some elements of $A - frak(m)$, but this is impossible, so $M=0$
]
#proposition()[
  Let $phi: M -> N$ be an A-homo, then the following are equivalent
  1. $phi$ is injective
  2. $phi_(frak(p)): M_(frak(p)) -> N_(frak(p))$ is injective for each prime ideal $(frak(p))$
  3. $phi_(frak(m)): M_(frak(m)) -> N_(frak(m))$ is injective for each maximal ideal $(frak(m))$
  Simarly, with injective replaced by suijective.
]
#proof()[
  $(1) => (2)$ $0 -> M -> N$ is exact $=> 0 -> M_(frak(p)) -> N_(frak(p))$ is exact, hence $phi_(frak(p))$ is injective.

  $(2) => (3)$ Obviously

  $(3) => (1)$ Let $M' = ker(phi) => 0 -> M' -> M -> N$ is exact, so $0 -> M'_(frak(m)) -> M_(frak(m)) -> N_(frak(m))$ is exact by @prop:3.3, and $M_(frak(m)) tilde.equiv ker(phi_(frak(m))) = 0$. Since $phi_(frak(m))$ is injective, so $M'=0$ by @prop:3.8, so $phi$ is injective.
]

Flatness is a local property.
#proposition()[
  $forall$ A-module $M$ the following are equivalent
  1. $M$ is flat A-module
  2. $M_(frak(p))$ is flat $A_(frak(p))$-module for prime ideal $frak(p)$
  3. $M_(frak(m))$ is flat $A_(frak(m))$-module for maximal ideal $frak(m)$
]
== Extended and Contracted ideals in ring of fractions
#definition()[
  Let $A$ is a ring, $S$ is a multiplicative closed subset of $A$,
  $
    f: A -> S^(-1)A, quad a|-> a / 1 "is a natural homo" \
    C := {frak(a) subset A: exists frak(b) subset S^(-1)A "is an ideal, s.t." f^(-1)(frak(b)) = frak(a)} \
    E := {frak(b) subset S^(-1)A: exists frak(a) subset A "is an ideal, s.t." frak(b) = S^(-1) f(frak(a)) }
  $
]
#example[
  If $frak(a) subset A$ is ideal and $frak(a) subset S^(-1)A$, then $frak(a) = S^(-1)A$
]
#proposition()[
  1. Every ideal in $S^(-1)A$ is an extented ideal.
  2. If $frak(a) subset A$ is ideal then $frak(a)^(e c) = cup_(s in S)(a:S)$. Hence $frak(a)^(e) = (1) <=> a cap S neq emptyset$
  3. The prime ideals of $S^(-1)A$ are 1-1 correspodence with the prime ideals of $A$ with don't meet $S$.
  $ ol(P)_(c) = {ol(frak(p)) in S^(-1)A} xarrow(1-1) P = {frak(p) subset A and frak(p) cap S = emptyset} $
  4. The operation $S^(-1)$ commutes with the fraction of finite sums, products and intersections and radicals of ideals.
]<prop:3.11>
#proof[
  下次补上
]
#remark[
  If $frak(a), frak(b)$ are ideal of $A$, the formula
  $S^(-1)(frak(a) : frak(b)) = (S^(-1)frak(a) : S^(-1)frak(b))$
  is true provided $frak(b)$ is f.g.
]
#corollary()[
  If $frak(N)$ is the nilradical of $A$, then $S^(-1)frak(N)$ is the nilradical of $S^(-1)A$.
]
#corollary()[
  If $frak(p)$ is a prime ideal of $A$, the prime ideal of the local ring $A_(frak(p))$ are 1-1 correspodence with prime ideals of $A$ contained in $frak(p)$, i.e.
  $
    ol(P)_(c) = {ol(frak(p)) in A_(frak(p))} xarrow(1-1) P = {frak(p)' subset A "is prime and" frak(p)' subset frak(p)}
  $
]
#proof[
  Let $S = A-frak(p)$ in @prop:3.11 (3)
]
#proposition()[
  Let $M$ be a f.g. A-module. $S$ multi- closed subset of $A$, then $S^(-1)(Ann(M)) = Ann(S^(-1)M)$.
]<prop:3.14>
#proof()[
  If it is ture for $M,N$, then it is ture for $M+N$ and
  $
    S^(-1)(Ann(M+N)) & = S(Ann(M) cap Ann(N)) = S^(-1)(Ann(M)) cap S^(-1)(Ann(N)) \
                     & = Ann(S^(-1)M) cap Ann(S^(-1)N) = Ann(S^(-1)(M+N))
  $
  Hence is enough to prove for $M=(x)$, then let $M = A\/frak(a)$ where $frak(a) = Ann(M)$, then
  $
    S^(-1)M = S^(-1)A \/ S^(-1)frak(a) => Ann(S^(-1)M) = S^(-1)frak(a) = S^(-1)(Ann(M))
  $
]
#corollary()[
  If $N,P$ are submodule of A-module, $P$ is f.g., then $S^(-1)(N:P) = (S^(-1)N:S^(-1)P)$
]
#proof[
  $(N:P) = Ann((N+P)\/N)$ by @prop:3.14
]
#proposition()[
  Let $f: A-> B$ be a homo $frak(p) subset A, frak(q) subset B$ be prime ideal, then
  $ frak(p) = frak(q)^(c) <=> frak(p)^(e c) = frak(p) $
]
#proof[
  [$=>$] by prop:1.17

  [$arrow.l.double$] If $frak(p)^(e c) = frak(p)$, let $S = f(A-frak(p)) subset B => frak(p)^(e) cap A = emptyset => frak(p)^(e c)$ is a proper ideal in $S^(-1)B$ by @prop:3.11 and $frak(p)^(e c) = frak(m)$, where $frak(m)$ is maximal of $S^(-1)B$. If $frak(q) = frak(m)^(c) => frak(q)$ is prime, because $frak(q) supset frak(p)^(e), frak(q) cap S = emptyset => frak(q)^(c) = frak(p)$.
]

= Primary Decomposition
#definition(title: "Primary")[
  An ideal $q$ is a ring $A$ is primary if
  $ forall x, y in frak(q) <=> "either" x in frak(q) or y^(n) in frak(q), "where" n>0 $
]
#remark()[
  Prime ideal is primary. In other words
  $ frak(q) "is primary" <=> A\/frak(q) neq 0 "and" forall "zero-divisor" in A\/frak(q) "is nilpotent" $
]
#remark()[
  The contraction of a primary ideal is primary, i.e. if $f:A->B, frak(q)$ is primary ideal in $B$, then $A\/frak(q)^(c)$ is isomorphism to a subring of $B\/frak(q)$
]
#proposition()[
  Let $frak(q)$ be a primary in $A$, the $r(frak(q))$ is the smallest prime ideal containing $frak(q)$
]
#proof[
  (Smallest) Let $pi : A -> A\/frak(q)$, then $r(frak(q)) = cap frak(p)-> pi(r(frak(q))) = {"zero-divisor of" A\/frak(q)} = frak(N)(A\/frak((q)))$

  (Prime) Suppose $x,y in r(frak(q)) => exists n "s.t." (x dot y)^(n) in frak(q)$, let $z = x^(n), w=y^(n) => z in frak(q) "or" w^(m) in frak(q) => x in r(frak(q)) => r(frak(q))$ is prime.
]
#definition(title: "p-primary")[
  if $frak(p) = r(frak(q))$, then $frak(q)$ is said to $frak(p)$-primary
]
#proposition()[
  If $r(frak(a))$ is maximal, then $frak(a)$ is primary.
]
#proof[
  $ pi : A-> A\/frak(a), quad r(frak(a)) = frak(m) |-> ol(frak(m)) = frak(m) + frak(a) $
  $r(frak(a)) "is maximal" => ol(frak(m))$ is maximal of $A\/frak(a)$

  Because $ol(frak(m)) subset frak(N)(A\/frak(a)) = cap ol(frak(p)) ("where" ol(frak(p)) "is prime") => A\/frak(a) "has only one prime ideal" ol(frak(m)) => forall r +frak(a) in A\/frak(a)$

  $
    cases(
      r+frak(a) in ol(frak(m)) => r+frak(a) "is nilpotent of" A\/frak(a) \
      r+frak(a) in.not ol(frak(m)) => r+frak(a) "is unit of" A\/frak(a)
    )
  $
  $forall "zero-divisor" in A\/frak(a)$ is not unit, hence zero-divisor in nilpotent in $A\/frak(a)$.
]
#lemma()[
  If $frak(q)_(i) (i in {1,dots n})$ are $frak(p)$-primary, hence $frak(q) = cap_(i=1)^(n) frak(q)_(i)$ is $frak(p)$-primary.
]
#proof[
  We know $r(frak(q)) = r(cap_(i=1)^(n)frak(q)_(i)) = cap_(i=1)^(n) r(frak(q)_(i)) = frak(p)$.

  Let $x dot y in frak(q)$ and $y in.not frak(q) => exists "some" i in {1, dots, n}, "s.t." x dot y in frak(q)_(i) "and" y in.not frak(q)_(i) => x in frak(q)_(i) "for any" i => x in frak(p)$, since $frak(q)$ is primary.
]
#lemma()[
  Let $frak(q)$ be a $frak(p)$-primary, $x in A$, then
  1. if $x in frak(q) => (frak(q):x) =(1)$
  2. if $x in.not frak(q) => (frak(q):x)$ is $frak(p)$-primary and therefore $r(frak(q):x) = frak(p)$
  3. if $x in.not frak(p) => (frak(q):x) = frak(q)$
]<Lem:4.2>
#proof[
  (1), (3) are obviously, nowto prove (2).

  If $y in (frak(q):x), "s.t." x dot y in frak(q)(x in.not frak(q))$, we have $y in frak(p) => frak(q) subset (frak(q):x) subset frak(p) => r(frak(q):x) = frak(p)$

  Let $y dot z in (frak(q):x), y in.not frak(p) => x dot y dot z in frak(q) => z in r(frak(q):x)$.
]
#definition()[
  The primary decomoposition of $frak(a)$ is
  $ frak(a) = cap_(i=1)^(n) frak(q)_(i), quad "where" frak(q)_(i) "is primary ideal." $<eq:4.3>
]
#definition()[
  We call @eq:4.3 minimal if
  1. $frak(p)_(i) = r(frak(q)_(i))$ are all distinct
  2. $frak(q)_(i) supset cap_(j neq i) frak(q)_(j)$
]
#theorem(title: "1st uniqueness theorem")[
  Let $frak(a)$ be a decomopoable ideal and $frak(a) = cap_(i=1)^(n) frak(q)_(i)$ be a minimal primary decomoposition of $frak(a)$. Let $frak(p)_(i) = r(frak(q)_(i)) (1 <= i <= n)$.

  Then the $frak(p)_(i)$ are precisely the prime ideal which occur in the set ideal $r(frak(a):x), (x in A)$ and hence are independent of the particular decomoposition of $frak(a)$.
]<thm:1-uniqueness>
#proof[
  Let $x in A$ and $r(frak(a):x)$ is prime ideal, by @Lem:4.2
  $
    r(frak(a):x) = r(cap_(i=1)^(n) frak(q)_(i):x) = r(cap_(i=1)^(n)(frak(q)_(i): x)) = cap_(i=1)^(n) r(frak(q)_(i):x) = cap_(i=1)^(n) frak(p)_(i)
  $
  by @prop:1.11, we get $forall i in {1, dots, n}, exists x_(i) in cap_(j neq i)frak(q)_(j), x_(i) in.not frak(q)_(i)$, s.t.
  $ r(frak(a):x_(i)) = cap_(j=1)^(n) r(frak(q)_(j): x_(i)) = frak(p)_(i) $
]
#definition(title: "Associated ")[
  Assume @eq:4.3 is the samllest primary decomoposition of $frak(a)$, the prime $frak(p)_(i) = r(frak(q)_(i))$ are said to belong to $frak(a)$. (or to be associated with $frak(a)$)
]
#example[
  Let $frak(a) =(x^(2),x y) in A=k[x,y]$, then $a = frak(p)_(1) cap frak(p)_(2)^(2)$, where $frak(p)_(1) = (x), frak(p)_(2) = (x,y)$. The ideal $frak(p)_(2)^(2)$ is primary, so $frak(p)_(1), frak(p)_(2)$ are prime ideals. In this example, $frak(p)_(1) subset frak(p)_(2)$, we have $r(frak(a)) = frak(p)_(1) cap frak(p)_(2) = frak(p)_(1)$, but $frak(a)$ is not primary ideal.
]
#definition(title: "Minimal and embedded")[
  The minimal element of ${frak(p)_(i)}$ be called the minimal prime ideal belong in $frak(a)$ or to be associated with $frak(a)$.

  The ideal $frak(a)$ is primary $<=>$ $frak(a)$ has only one associated prime ideal.

  The minimal elements of the set ${frak(p_(i))}_(i=1)^(n)$ are called the minimal or isolated prime ideals belonging to $frak(a)$.

  The others are called embedded prime ideals.
]
#remark[
  In the example above, $frak(p)_(2) = (x, y)$ is embedded.
]
#proposition()[
  Let $frak(a)$ be a decomorposable ideal. Then any prime ideal $frak(p) supset frak(a)$ contains a minimal prime ideal belong to $frak(a)$.
]
#proof()[
  $
    frak(p) supset frak(a) = cap_(i=1)^(n) frak(q)_(i), quad frak(p) = r(frak(q)) supset cap_(i=1)^(n) r(frak(q)_(i)) = cap_(i=1)^(n) frak(p)_(i),
  $
  by @prop:1.11, we have $exists "some" i in {1, dots, n}, "s.t." frak(p)_(i) subset frak(p)$.
]
#proposition()[
  Let $frak(a)$ be a decomopoable ideal, $frak(a) = cap_(i=1)^(n) frak(q)_(i), frak(p)_(i) = r(frak(q)_(i))$, then
  $ cup_(i=1)^(n) frak(p)_(i) = {x in A: (frak(a):x) neq frak(a)} $
  In particular, if $frak(a) = (0)$, then $D = {x in A:(0:x) neq 0}$ is the set of non-zero divisor. Then $D$ is the union of all prime ideals belong to $(0)$.
]
#proof[
  Only to prove $frak(a) = (0)$, [$subset$]: $frak(a)$ is decomopoable, hence $0 subset A\/frak(a)$ is decomopoable and
  $ (0) = cap_(i=1)^(n) ol(frak(q))_(i), quad ol(frak(q)) = pi(frak(q)_(i)) "is primary" $
  where $pi: A -> A\/frak(a), , x |-> x+frak(a)$ is the natural homomorphism.

  Let $ol(D)$ be the set of zero-divisor of $A\/frak(a)$, then we get $ol(D) = cup_(ol(x) neq
  (0)) r(ol(0): ol(x))$ by @prop:1.15, where $r(ol(0):ol(x)) = r(cap frak(q)_(i): ol(x)) = cap r(frak(q)_(i): x) subset ol(frak(p))_(i)$.

  [$supset$]: By @thm:1-uniqueness, we get $forall ol(frak(p))_(i), exists ol(x) in A\/frak(a)$, s.t. $ol(frak(p))_(i) = r(0:ol(x)) => ol(frak(p))_(i) subset ol(D)$ for any $i$.
]
#proposition()[
  Let $A$ is a ring, $S$ is multiplicative closed subset, let $frak(q)$ be a $frak(p)$-primary ideal, then
  1. If $S cap frak(p) neq emptyset => S^(-1)frak(q) = S^(-1)A$
  2. If $S cap frak(p) = emptyset => S^(-1)frak(q)$ is a $S^(-1)frak(q)$-primary ideal and $(S^(-1)frak(q))^(c) = frak(q)$.
]
#remark[
  $frak(q)^(e c) = (S^(-1) frak(q))^(c) :=S(frak(q))$
]
#proposition()[
  Let $S$ be a multiplicative closed subset, $frak(a)_(i)$ are decomopoable, let $frak(a)_(i) = cap_(i=1)^(n) frak(q)_(i), frak(p)_(i) = r(frak(q)_(i))$, Suppose that $frak(q)_(i)$ are numbered, s.t.
  $
    cases(
      S cap frak(p)_(i) neq emptyset quad i>= m,
      S cap frak(p)_(i) neq emptyset quad i < m quad (m neq n)
    )
  $
  Then $S^(-1)frak(a) = cap_(i=1)^(n)S^(-1)frak(q)_(i), S(frak(a)) = (S^(-1)frak(a))^(c) = cap_(i=1)^(m) frak(q)_(i)$ and there are unique decomoposition.
]
#proof[
  下次补上
]
#definition()[
  A set $sum$ of prime ideals belong to $frak(a)$ is said isolated if $frak(p)'$ is prime ideal belong to $frak(a)$ and $frak(p)' subset frak(p), frak(p) in sum => frak(p)' in sum$.
]
#theorem(title: "2nd uniqueness theorem")[
  Let $frak(a)$ be a decomopoable ideal,
  $ frak(a) = cap_(i=1)^(n) frak(q)_(i) "is minimal decomopoable", frak(p)_(i) = r(frak(q)_(i)), $<eq:4.4>
  Let ${frak(p)_(i)}$ be an isolated set of prime ideal of $frak(a)$, then $cap_(j=1)^(k)frak(q)_(i j )$ is independent of @eq:4.4
]<thm:2-uniqueness>
#proof()[
  下次补上.
]
