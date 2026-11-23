#import "/styles/lib.typ": *
#import "../figures/03-localization-diagrams.typ": (
  localized-tensor-square-diagram,
  module-localization-universal-diagram, // 按顺序
  ring-localization-universal-diagram,
)

= Rings and Modules of Fractions

== Localization
#definition(title: "Multiplicatively closed subset")[
  A subset $S subset.eq A$ is multiplicatively closed if $1 in S$ and $s t in S$ for $s,t in S$.
]
Let $A$ be a ring and $S subset.eq A$ a multiplicatively closed subset. For an $A$-module $M$, define
$
  (m,s) tilde (n,t) quad <=> quad u(t m-s n)=0 "for some" u in S.
$
Reflexivity and symmetry follow from the formula. For transitivity, suppose $u(t m-s n)=0$ and $v(r n-t p)=0$. Multiply by $v r$ and $u s$, respectively, and add to get $u v t(r m-s p)=0$. Denote the set of classes by $S^(-1)M$ and write $m\/s$ for the class of $(m,s)$. In particular $m\/s=0$ exactly when some $u in S$ kills $m$.

For $M=A$ the classes form a ring $S^(-1)A$ with addition and multiplication of fractions. For general $M$, addition and the $S^(-1)A$-action are
$
  m\/s+n\/t=(t m+s n)\/(s t),
  quad (a\/r)(m\/s)=(a m)\/(r s).
$
To check independence of representatives, suppose $u(s' m-s m')=0$ and $v(t' n-t n')=0$. For the sum, the difference of cross-multiplied numerators is
$
  t t'(s' m-s m')+s s'(t' n-t n'),
$
which is killed by $u v$. For the action, if $w(r' a-r a')=0$, the difference is
$
  r'a(s' m-s m')+s m'(r'a-r a'),
$
which is killed by $u w$. The action calculation for $M=A$ also verifies multiplication of ring fractions. The ring and module axioms follow by using common denominators and the laws in $A$ and $M$. The zero and identity of $S^(-1)A$ are $0\/1$ and $1\/1$. The natural ring homomorphism is $f:A -> S^(-1)A$, $a |-> a\/1$.

#remark[
  If $A$ is an integral domain and $S=A without {0}$, then $S^(-1)A$ is its field of fractions. Each nonzero $a\/s$ has inverse $s\/a$.
]
#definition(title: "Ring of fractions")[
  The ring $S^(-1)A$ is called the ring of fractions of $A$ with respect to $S$.
]
#proposition(title: "Universal Property")[
  Let $g:A -> B$ be a ring homomorphism taking every $s in S$ to a unit. There is a unique ring homomorphism $h:S^(-1)A -> B$ with $g=h compose f$.
]<prop:Universal-property>
#proof[
  Since $(s\/1)(1\/s)=1$, any such map satisfies $h(a\/s)=g(a)g(s)^(-1)$. Conversely, if $a\/s=a'\/s'$, then some $u in S$ satisfies $u(s'a-s a')=0$. Applying $g$ and cancelling $g(u),g(s),g(s')$ proves that the formula is well-defined. The formulas for addition, multiplication and identity show it is a ring homomorphism, and $h(a\/1)=g(a)$.
]

The following commutative triangle illustrates the universal property.

#ring-localization-universal-diagram()

The module version uses the natural $A$-linear map $iota:M -> S^(-1)M$, $m |-> m\/1$. For an $S^(-1)A$-module $P$ and an $A$-linear map $g:M -> P$, the unique $S^(-1)A$-linear extension sends $m\/s$ to $(1\/s)g(m)$. Applying $g$ to the defining equivalence and cancelling the units $u\/1$, $s\/1$ and $t\/1$ proves well-definedness. The fraction rules give linearity, and $m\/s=(1\/s)(m\/1)$ forces uniqueness. The following diagram illustrates the universal property.

#module-localization-universal-diagram()

If each $s in S$ acts invertibly on $M$, the natural map $M -> S^(-1)M$ is an isomorphism of $A$-modules. Indeed, the zero criterion gives injectivity, and writing $m=s n$ gives $m\/s=n\/1$. The inverse sends $m\/s$ to the unique $n$ with $s n=m$. If $M$ already has an $S^(-1)A$-action extending its $A$-action, this inverse is $S^(-1)A$-linear by the module universal property applied to $id_M$.

#example[
  In $A=k[x,y]\/(x y)$ let $S={x^n : n >= 0}$. Since $x y=0$ and $x$ becomes a unit, $y=(x y)\/x=0$ in $S^(-1)A$, and hence $S^(-1)A tilde.equiv k[x,x^(-1)]$. In the same way, localizing a module kills every element annihilated by an element of $S$.
]

Write $A_(frak(p))$ and $M_(frak(p))$ for localization at $S=A without frak(p)$ when $frak(p)$ is prime. The set $A without frak(p)$ is multiplicatively closed exactly when $frak(p)$ is prime. A homomorphism $g:M -> N$ induces $S^(-1)g$ by $m\/s |-> g(m)\/s$, since an equality of fractions remains true after applying $g$ to the cross-multiplied difference.

#proposition()[
  The ring $S^(-1)A$ and its natural map $f:A -> S^(-1)A$ have the following properties.

  1. For $s in S$, the element $f(s)$ is a unit.
  2. If $f(a)=0$, then $u a=0$ for some $u in S$.
  3. Every element is $f(a)f(s)^(-1)$ for some $a in A$, $s in S$.
]<prop:3.1>
#proof[
  These follow from $f(s)^(-1)=1\/s$, the zero criterion for fractions, and $a\/s=(a\/1)(1\/s)$. In particular, the kernel consists exactly of elements killed by some $s in S$.
]
#corollary()[
  If $g:A -> B$ satisfies the three properties of @prop:3.1 with $B$ and $g$ in place of $S^(-1)A$ and $f$, then $h:S^(-1)A -> B$, $h(a\/s)=g(a)g(s)^(-1)$, is the unique isomorphism with $g=h compose f$.
]
#proof[
  Property (1) gives $h$ by @prop:Universal-property, and (3) gives surjectivity. If $h(a\/s)=0$, then $g(a)=0$, so $u a=0$ for some $u in S$ by (2). Thus $a\/s=0$.
]
#remark[
  The ring $S^(-1)A$ is the zero ring exactly when $0 in S$. If $0 in S$ then $1\/1=0\/1$; conversely $S^(-1)A=0$ forces $1\/1=0$, so some $u in S$ kills $1$. For $S={f^n : n >= 0}$ the ring $S^(-1)A$ is written $A_f$, the localization that inverts $f$.
]

#proposition()[
  Localization is exact. If $M' xarrow(f) M xarrow(g) M''$ is exact at $M$, then its localization is exact at $S^(-1)M$.
]<prop:3.3>
#proof[
  Since $g compose f=0$, the localized composite is zero. Conversely, suppose $g(m)\/s=0$. Then $t g(m)=0$ for some $t in S$, so $t m in Ker(g)=Im(f)$. Choose $m' in M'$ with $t m=f(m')$. The equality
  $ m\/s=(t m)\/(t s)=f(m')\/(t s) $
  puts $m\/s$ in $Im(S^(-1)f)$.

  Localization takes zero to zero. For injective $f$, apply the middle-term argument to $0 -> M' -> M$ to obtain $Ker(S^(-1)f)=0$. For surjective $g$, apply it to $M -> M'' -> 0$ to obtain $Im(S^(-1)g)=S^(-1)M''$.
]
#corollary()[
  If $N,P$ are submodules of $M$, identify their localizations with submodules of $S^(-1)M$. Then

  1. $S^(-1)(N+P)=S^(-1)N+S^(-1)P$.
  2. $S^(-1)(N inter P)=S^(-1)N inter S^(-1)P$.
  3. $S^(-1)(M\/N) tilde.equiv (S^(-1)M)\/(S^(-1)N)$.
]
#proof[
  Exactness preserves the inclusions and gives (3) from $0 -> N -> M -> M\/N -> 0$. A fraction $(n+p)\/s$ splits as $n\/s+p\/s$, and a sum of two fractions from $N$ and $P$ has numerator in $N+P$ after taking a common denominator. If $n\/s=p\/t$ with $n in N$ and $p in P$, then $u t n=u s p$ for some $u in S$. The common class is represented by $(u t n)\/(u s t)$ with numerator in $N inter P$. The other inclusion follows from the submodule inclusions.
]
#example[
  Take $A=bb(Z)$, $S={2^n : n >= 0}$ and $M=bb(Z)\/12 bb(Z)$. By @prop:crt, $M$ is the direct sum of the parts modulo $4$ and $3$. The first localizes to zero because $4 in S$ kills it. On the second, every power of $2$ already acts invertibly, so it is unchanged by localization and $S^(-1)M tilde.equiv bb(Z)\/3 bb(Z)$. For instance $overline(3)\/1=0$ since $4 dot overline(3)=0$ in $M$, and $overline(1)\/2$ goes to the class of $2$ modulo $3$.
]

#proposition()[
  There is a unique $S^(-1)A$-linear isomorphism $F:S^(-1)A otimes_A M -> S^(-1)M$ with $F((a\/s) otimes m)=(a m)\/s$.
]<prop:3.5>
#proof[
  The map
  $ S^(-1)A times M -> S^(-1)M, quad (a\/s,m) |-> (a m)\/s $<eq:3.1>
  is well-defined by the fraction action, since it is $(a\/s)(m\/1)$. It is $A$-bilinear, so @prop:2.12 gives the unique map $F$ induced by @eq:3.1. The formula makes $F$ linear over $S^(-1)A$, and it is surjective since $m\/s=F((1\/s) otimes m)$.

  For a finite sum of tensors, set $s=product_i s_i$ and $t_i=product_(j != i) s_j$. Balancing over $A$ and additivity give
  $
    sum_i (a_i\/s_i) otimes m_i
    = sum_i ((a_i t_i)\/s) otimes m_i
    = (1\/s) otimes sum_i a_i t_i m_i.
  $
  Thus it suffices to check a tensor $(1\/s) otimes m$ in the kernel. If $m\/s=0$, choose $t in S$ with $t m=0$. Then $(1\/s) otimes m=(t\/(s t)) otimes m=(1\/(s t)) otimes (t m)=0$. This proves injectivity.
]
#corollary()[
  The $A$-module $S^(-1)A$ is flat.
]
#proof[
  The maps in @prop:3.5 commute with the homomorphisms induced by $M -> N$, as one checks on pure tensors. Hence tensoring with $S^(-1)A$ is exact by @prop:3.3 and tensor symmetry.
]
#proposition()[
  For $A$-modules $M,N$, there is a unique $S^(-1)A$-linear isomorphism
  $
    F: S^(-1)M otimes_(S^(-1)A) S^(-1)N -> S^(-1)(M otimes_A N),
  $
  given by $F((m\/s) otimes (n\/t))=(m otimes n)\/(s t)$. In particular,
  $ M_(frak(p)) otimes_(A_(frak(p))) N_(frak(p)) tilde.equiv (M otimes_A N)_(frak(p)). $
]<prop:localized-tensor>
#proof[
  If $u(s' m-s m')=0$, then $u(s'(m otimes n)-s(m' otimes n))=0$ by bilinearity. Multiplying by $t$ gives the equality of the proposed fractions with denominators $s t$ and $s't$. The same argument works in the second variable. Addition in either variable is checked using common denominators. For a scalar $a\/r$, moving it across the tensor sign uses $(a m) otimes n=m otimes (a n)$ and gives denominator $r s t$. Thus the formula defines an $S^(-1)A$-bilinear map and induces $F$.

  The $A$-bilinear map $(m,n) |-> (m\/1) otimes (n\/1)$ induces a map on $M otimes_A N$. Extend it by the module universal property to obtain $G$ on $S^(-1)(M otimes_A N)$. Then $G((m otimes n)\/(s t))=(m\/s) otimes (n\/t)$. These tensors generate the source of $F$, and the fractions $(m otimes n)\/1$ generate its target over $S^(-1)A$, so the two composites are identities. The formulas also show that $F$ is natural in both variables.
]

For homomorphisms $f:M -> M'$ and $g:N -> N'$, naturality is the commutativity of the following square, where $F'$ is the corresponding isomorphism for $M',N'$.

#localized-tensor-square-diagram()

== Local Properties
#definition(title: "Local properties")[
  A property of $A$, or of an $A$-module $M$, is local if it holds exactly when it holds for all $A_(frak(p))$, or for all $M_(frak(p))$ as $A_(frak(p))$-modules, respectively, as $frak(p)$ ranges over the prime ideals of $A$.
]
#proposition()[
    For an $A$-module $M$, the following are equivalent.

    1. $M=0$.
    2. $M_(frak(p))=0$ for every prime ideal $frak(p)$ of $A$.
    3. $M_(frak(m))=0$ for every maximal ideal $frak(m)$ of $A$.
  ]<prop:3.8>

#proof[
  The zero module localizes to zero, and maximal ideals are prime. Conversely, if $x != 0$ in $M$, choose a maximal ideal $frak(m)$ containing the proper ideal $Ann(x)$. The fraction $x\/1$ is nonzero in $M_(frak(m))$, since any element killing $x$ lies in $frak(m)$.
]
#proposition()[
  A homomorphism $phi:M -> N$ is injective exactly when $phi_(frak(p))$ is injective for every prime $frak(p)$, or equivalently when $phi_(frak(m))$ is injective for every maximal $frak(m)$. The same equivalences hold for surjectivity.
]<prop:local-maps>
#proof[
  By @prop:3.3, $(Ker(phi))_(frak(p)) tilde.equiv Ker(phi_(frak(p)))$ and $(Coker(phi))_(frak(p)) tilde.equiv Coker(phi_(frak(p)))$. Apply @prop:3.8 to the kernel for injectivity and to the cokernel for surjectivity.
]
#remark[
  The same zero test detects exactness at an intermediate module. For a complex $U xarrow(f) V xarrow(g) W$, localize the quotient $Ker(g)\/Im(f)$ by @prop:3.3. Its vanishing at all maximal ideals is equivalent to exactness at $V$.
]

Flatness is a local property.
#proposition()[
  For an $A$-module $M$, the following are equivalent.

  1. $M$ is flat over $A$.
  2. $M_(frak(p))$ is flat over $A_(frak(p))$ for every prime $frak(p)$.
  3. $M_(frak(m))$ is flat over $A_(frak(m))$ for every maximal $frak(m)$.
]
#proof[
  Assume (1). For an injection $U -> V$ of $S^(-1)A$-modules, tensoring over $A$ with $M$ gives an injection. Since $S$ acts invertibly, the natural maps $U -> S^(-1)U$ and $V -> S^(-1)V$ are isomorphisms. Localizing the tensored map using @prop:3.3 and applying @prop:localized-tensor therefore gives the injection obtained by tensoring $U -> V$ with $S^(-1)M$ over $S^(-1)A$. Taking $S=A without frak(p)$ proves (2), which implies (3).

  Assume (3) and let $U -> V$ be an injection of $A$-modules. At each maximal ideal $frak(m)$ it localizes to an injection. By flatness of $M_(frak(m))$ and @prop:localized-tensor, the map $U otimes_A M -> V otimes_A M$ is injective after localization at each $frak(m)$. By @prop:local-maps it is injective, and the injection criterion for flatness gives (1).
]

== Extended and Contracted Ideals in Rings of Fractions
#definition()[
  For the natural homomorphism $f:A -> S^(-1)A$, use $e$ and $c$ for extension and contraction, as in @prop:extension-contraction. For an ideal $frak(a)$ of $A$, the extension $frak(a)^e=S^(-1)frak(a)$ consists of fractions with a representative whose numerator lies in $frak(a)$, by the common denominator rule.
]
#example[
  If $frak(a)$ meets $S$, then $S^(-1)frak(a)=S^(-1)A$, since the extension contains a unit $s\/1$ for $s in frak(a) inter S$.
]
#proposition()[
  1. Every ideal of $S^(-1)A$ is extended. Extension and contraction give inverse inclusion-preserving bijections between ideals of $S^(-1)A$ and ideals $frak(a)$ of $A$ with $frak(a)^(e c)=frak(a)$.
  2. For any ideal $frak(a)$ of $A$,
  $ frak(a)^(e c)=union.big_(s in S)(frak(a):s). $
  In particular $frak(a)^e=S^(-1)A$ exactly when $frak(a) inter S != emptyset$.
  3. Extension and contraction restrict to inverse bijections between prime ideals of $S^(-1)A$ and prime ideals of $A$ disjoint from $S$.
  4. Extension commutes with finite sums, products, intersections and with radicals.
]<prop:3.11>
#proof[
  For (1), a fraction $a\/s$ belongs to an ideal $J$ of $S^(-1)A$ exactly when $a\/1$ does, since $s\/1$ is a unit. Thus $J=S^(-1)(J^c)$, and the asserted bijection follows.

  For (2), if $a\/1=b\/s$ with $b in frak(a)$, some $u in S$ satisfies $u s a=u b in frak(a)$. Conversely, $s a in frak(a)$ gives $a\/1=(s a)\/s in frak(a)^e$. This proves the formula. Applying it to $a=1$ gives the criterion for $frak(a)^e$ to be the whole ring. In general, $a\/t$ belongs to $frak(a)^e$ exactly when $u a in frak(a)$ for some $u in S$, by multiplication by the unit $t\/1$.

  For (3), a prime of $S^(-1)A$ contracts to a prime by inverse image and its contraction excludes $S$ since a proper ideal contains no units. If $frak(p)$ is prime and disjoint from $S$, the membership criterion in (2) gives $a\/t in frak(p)^e$ exactly when $a in frak(p)$. This shows that $frak(p)^e$ is prime, since primality of $frak(p)$ applies to the numerator of a product. It also gives $frak(p)^(e c)=frak(p)$.

  For (4), the submodule formulas following @prop:3.3 give sums and intersections, and products commute with extension since both sides are generated by the images of products. For radicals, if $(a\/s)^n in S^(-1)frak(a)$ then $u a^n in frak(a)$ for some $u in S$. Hence $(u a)^n in frak(a)$ and $a\/s=(u a)\/(u s)$ lies in $S^(-1)r(frak(a))$. Conversely, a fraction with numerator in $r(frak(a))$ has a power in $S^(-1)frak(a)$.
]
#remark[
  The equality $S^(-1)(frak(a):frak(b))=(S^(-1)frak(a):S^(-1)frak(b))$ holds if $frak(b)$ is finitely generated. This is the ideal case of @cor:localized-colon below.
]
#corollary()[
  If $frak(N)$ is the nilradical of $A$, then $S^(-1)frak(N)$ is the nilradical of $S^(-1)A$.
]
#proof[
  Apply (4) of @prop:3.11 to $(0)$.
]
#corollary()[
  For a prime ideal $frak(p)$ of $A$, the primes of $A_(frak(p))$ correspond to the primes of $A$ contained in $frak(p)$. In particular, $A_(frak(p))$ is local with maximal ideal $frak(p)A_(frak(p))$, and its residue field is the field of fractions of $A\/frak(p)$.
]
#proof[
  The primes disjoint from $A without frak(p)$ are precisely the primes contained in $frak(p)$. By (3) of @prop:3.11, $frak(p)A_(frak(p))$ is the largest prime. It is contained in some maximal ideal, which is prime and hence contained in $frak(p)A_(frak(p))$, so the two are equal. Every maximal ideal is prime and thus equals this largest prime.

  The quotient $A_(frak(p))\/frak(p)A_(frak(p))$ is $S^(-1)(A\/frak(p))$ for $S=A without frak(p)$, and the image of $S$ in the domain $A\/frak(p)$ consists of all nonzero elements. Hence the quotient is the field of fractions of $A\/frak(p)$.
]
#example[
  Take $A=bb(Z)$ and $frak(p)=(p)$ with $p$ a prime number. Then $A_(frak(p))$ is the subring of $bb(Q)$ consisting of the fractions $a\/b$ with $p ∤ b$. Its maximal ideal consists of the fractions whose numerator is divisible by $p$, and every element outside it is a unit. Thus $bb(Z)_((p))$ is local, with residue field $bb(F)_p$.
]

#proposition()[
  If $M$ is a finitely generated $A$-module, then $S^(-1)Ann_A(M)=Ann_(S^(-1)A)(S^(-1)M)$.
]<prop:3.14>
#proof[
  Fractions with numerators annihilating $M$ annihilate $S^(-1)M$. Conversely, let $a\/s$ annihilate $S^(-1)M$ and choose generators $m_1,dots,m_n$ of $M$. Each $(a m_i)\/s$ is zero, so some $t_i in S$ kills $a m_i$. With $t=product_i t_i$, the element $t a$ kills every generator. Thus $a\/s=(t a)\/(t s)$ lies in $S^(-1)Ann_A(M)$.
]
#corollary()[
  If $N,P$ are submodules of $M$ and $P$ is finitely generated, then $S^(-1)(N:P)=(S^(-1)N:S^(-1)P)$.
]<cor:localized-colon>
#proof[
  The ideal $(N:P)$ is the annihilator of the finitely generated module $(N+P)\/N$, a quotient of $P$. Apply @prop:3.14 and the localization formulas for sums and quotients.
]
#proposition()[
  Let $f:A -> B$ be a ring homomorphism and $frak(p)$ a prime ideal of $A$. There is a prime ideal of $B$ contracting to $frak(p)$ exactly when $frak(p)^(e c)=frak(p)$, where $e,c$ refer to $f$.
]
#proof[
  The necessity is @prop:extension-contraction. For sufficiency, let $S=f(A without frak(p))$ in $B$. The identity $frak(p)^(e c)=frak(p)$ gives $frak(p)^e inter S=emptyset$. Its extension to $S^(-1)B$ is therefore proper by @prop:3.11. Choose a maximal ideal there containing $S^(-1)(frak(p)^e)$. Its contraction $frak(q)$ to $B$ is prime, contains $frak(p)^e$, and is disjoint from $S$. Consequently $f^(-1)(frak(q))$ contains $frak(p)$ and excludes every element of $A without frak(p)$, so it equals $frak(p)$.
]
