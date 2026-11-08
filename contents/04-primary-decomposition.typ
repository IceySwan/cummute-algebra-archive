#import "/styles/lib.typ": *
#import "/styles/operator.typ": *

= Primary Decomposition
#definition(title: "Primary")[
  A proper ideal $frak(q)$ of $A$ is primary if, whenever $x y in frak(q)$ and $x in.not frak(q)$, some positive power $y^n$ belongs to $frak(q)$.
]
#remark[
  Every prime ideal is primary. The definition says exactly that $A\/frak(q)$ is nonzero and every zero-divisor in it is nilpotent.
]
#remark[
  If $frak(q)$ is a primary ideal of $B$, its contraction $frak(q)^c$ along a ring homomorphism $A -> B$ is primary in $A$. Indeed, the induced map $A\/frak(q)^c -> B\/frak(q)$ is injective, so any zero-divisor in the first ring has nilpotent image and is therefore nilpotent.
]
#proposition()[
  If $frak(q)$ is primary, then $r(frak(q))$ is the smallest prime ideal containing $frak(q)$.
]
#proof[
  The radical is proper since $1 in.not frak(q)$. If $x y in r(frak(q))$, then $x^n y^n in frak(q)$ for some $n >= 1$. Either $x^n in frak(q)$ or a positive power of $y^n$ lies in $frak(q)$, so $x$ or $y$ lies in $r(frak(q))$. Thus the radical is prime. Every prime containing $frak(q)$ contains its radical, since a prime contains an element whenever it contains a positive power of that element.
]
#definition(title: "p-primary")[
  A primary ideal $frak(q)$ with $r(frak(q))=frak(p)$ is called $frak(p)$-primary.
]
#proposition()[
  If $r(frak(a))$ is maximal, then $frak(a)$ is primary.
]
#proof[
  Every prime containing $frak(a)$ contains $frak(m)=r(frak(a))$, hence equals $frak(m)$ by maximality. By @prop:quotient-ideals, $A\/frak(a)$ has the single prime $frak(m)\/frak(a)$, which is its nilradical by @prop:radical-form. Every zero-divisor is a nonunit, so @non-unit puts it in this unique maximal ideal. Thus all zero-divisors in the quotient are nilpotent, as required.
]
#lemma()[
  If $frak(q)_1,dots,frak(q)_n$ are $frak(p)$-primary and $n >= 1$, then $frak(q)=inter.big_(i=1)^n frak(q)_i$ is $frak(p)$-primary.
]<lem:common-radical>
#proof[
  The radical of a finite intersection is the intersection of the radicals. A power in the intersection lies in each ideal. Conversely, an element in all the radicals has a power in each ideal, and the largest of these finitely many exponents works for every ideal. Thus $r(frak(q))=frak(p)$. If $x y in frak(q)$ and $x in.not frak(q)$, choose $i$ with $x in.not frak(q)_i$. Then $y in r(frak(q)_i)=frak(p)=r(frak(q))$, proving primariness.
]
#block(breakable: false)[#lemma()[
    Let $frak(q)$ be $frak(p)$-primary and $x in A$. Then

    1. If $x in frak(q)$, then $(frak(q):x)=A$.
    2. If $x in.not frak(q)$, then $(frak(q):x)$ is $frak(p)$-primary.
    3. If $x in.not frak(p)$, then $(frak(q):x)=frak(q)$.
  ]<Lem:4.2>
]
#proof[
  For (1), every product $a x$ belongs to $frak(q)$. For (2), $(frak(q):x)$ is proper since it excludes $1$. If $a in (frak(q):x)$, then $x a in frak(q)$ and $x in.not frak(q)$, so $a in frak(p)$. Thus $frak(q) subset.eq (frak(q):x) subset.eq frak(p)$, giving radical $frak(p)$. If $a b in (frak(q):x)$ and $a in.not (frak(q):x)$, then $(a x)b in frak(q)$ and $a x in.not frak(q)$, giving $b in frak(p)$. Hence the colon ideal is primary. For (3), if $a x in frak(q)$, then $a in frak(q)$ since $x$ is outside the radical. The reverse inclusion follows from the ideal property.
]
#definition()[
  A primary decomposition of a proper ideal $frak(a)$ is a finite expression
  $ frak(a)=inter.big_(i=1)^n frak(q)_i, quad frak(q)_i "primary", quad n >= 1. $<eq:4.3>
  An ideal admitting such an expression is called decomposable. The results below concern decomposable ideals.
]
#definition()[
  The decomposition @eq:4.3 is minimal if

  1. The primes $frak(p)_i=r(frak(q)_i)$ are pairwise distinct.
  2. For each $i$, $inter.big_(j != i) frak(q)_j subset.eq.not frak(q)_i$.
]
The second condition makes each component essential to the intersection. By @lem:common-radical, components with the same radical can be merged. Removing redundant components then gives a minimal decomposition.

#theorem(title: "1st uniqueness theorem")[
  Let $frak(a)=inter.big_(i=1)^n frak(q)_i$ be a minimal primary decomposition and put $frak(p)_i=r(frak(q)_i)$. The $frak(p)_i$ are precisely the prime ideals among the ideals $r(frak(a):x)$ with $x in A$. Thus their set depends only on $frak(a)$.
]<thm:1-uniqueness>
#proof[
  For every $y in A$, membership $y in (frak(a):x)$ is equivalent to $y x in frak(a)$, hence to $y x in frak(q)_i$ for every $i$. Thus $(frak(a):x)=inter.big_i (frak(q)_i:x)$. Taking radicals and applying @Lem:4.2 gives
  $ r(frak(a):x)=inter.big_(i:x in.not frak(q)_i) frak(p)_i. $
  The empty intersection is $A$. If the intersection is prime, (2) of @prop:1.11 shows it contains one of the primes being intersected. It also lies in that prime, so the two are equal.

  Conversely, minimality gives an $x_i in inter.big_(j != i) frak(q)_j$ with $x_i in.not frak(q)_i$. In the displayed intersection for $x_i$, only the term $frak(p)_i$ occurs. Thus $r(frak(a):x_i)=frak(p)_i$.
]
#definition(title: "Associated")[
  The primes $frak(p)_i=r(frak(q)_i)$ of a minimal primary decomposition are called the prime ideals associated with $frak(a)$, or belonging to $frak(a)$.
]
#example[
  In $A=k[x,y]$ for a field $k$, one minimal primary decomposition of $frak(a)=(x^2,x y)$ is
  $ frak(a)=(x) inter (x,y)^2. $
  Indeed, $(x,y)^2=(x^2,x y,y^2)$, and its monomials divisible by $x$ are precisely those divisible by $x^2$ or $x y$. The first component is prime, with quotient $k[y]$. The second is $(x,y)$-primary since its radical is the maximal ideal $(x,y)$. The elements $x$ and $y^2$ show that neither component contains the other.
]
#definition(title: "Minimal and embedded")[
  The minimal elements under inclusion among the associated primes of $frak(a)$ are called minimal or isolated. The other associated primes are called embedded.
]
A decomposable proper ideal is primary exactly when it has one associated prime. Indeed, a minimal decomposition then has one component. Conversely, a primary ideal gives a minimal decomposition with one component, and @thm:1-uniqueness identifies the associated prime.
#remark[
  In the example, $y^2$ belongs only to the second component and $x$ belongs only to the first. The formula in @thm:1-uniqueness gives $r(frak(a):y^2)=(x)$ and $r(frak(a):x)=(x,y)$. The former is the minimal associated prime and the latter is embedded. The radical is $(x)$. The ideal $frak(a)$ fails the primary condition because $x y in frak(a)$, $x in.not frak(a)$, and every positive power of $y$ lies outside $frak(a)$.
]
#proposition()[
  If $frak(a)$ is decomposable, each prime ideal containing it contains a minimal associated prime of $frak(a)$. Consequently the minimal associated primes are precisely the primes minimal over $frak(a)$.
]
#proof[
  A prime $frak(p)$ containing $frak(a)$ contains $r(frak(a))=inter.big_i frak(p)_i$, where the $frak(p)_i$ come from a minimal decomposition. By (2) of @prop:1.11, it contains some $frak(p)_i$, which in turn contains a minimal associated prime by finiteness.

  If $frak(p)$ is minimal over $frak(a)$, then it equals the minimal associated prime it contains, since that prime also contains $frak(a)$. Conversely, for a minimal associated prime $frak(p)$, any prime between $frak(a)$ and $frak(p)$ contains a minimal associated prime. That associated prime must be $frak(p)$ by minimality, so the intermediate prime equals $frak(p)$.
]
#proposition()[
  If $frak(a)$ is decomposable with associated primes $frak(p)_1,dots,frak(p)_n$, then
  $ union.big_(i=1)^n frak(p)_i={x in A : (frak(a):x) != frak(a)}. $
  In particular, if $(0)$ is decomposable, the set $D={x in A : (0:x) != (0)}$ of zero-divisors is the union of the primes associated with $(0)$.
]
#proof[
  If $x$ is outside all $frak(p)_i$, then @Lem:4.2 gives $(frak(q)_i:x)=frak(q)_i$ for each $i$. Intersecting gives $(frak(a):x)=frak(a)$. Conversely, if $x in frak(p)_i$, use the witness $x_i$ from the proof of @thm:1-uniqueness. Since $x in r(frak(a):x_i)$, there is an $n >= 1$ with $x^n x_i in frak(a)$. For the least such $n$, the element $x^(n-1)x_i$ lies outside $frak(a)$ and belongs to $(frak(a):x)$. This proves the equality. Taking $frak(a)=(0)$ gives the statement for $D$.
]
#proposition()[
  Let $S$ be a multiplicatively closed subset of $A$ and let $frak(q)$ be $frak(p)$-primary.

  1. If $S inter frak(p) != emptyset$, then $S^(-1)frak(q)=S^(-1)A$.
  2. If $S inter frak(p)=emptyset$, then $S^(-1)frak(q)$ is $S^(-1)frak(p)$-primary and its contraction is $frak(q)$.
]<prop:localized-primary>
#proof[
  In (1), for $s in S inter frak(p)$ some power $s^n$ is in $S inter frak(q)$, so the extension is the whole ring by @prop:3.11. In (2), every $s in S$ lies outside the radical, so $(frak(q):s)=frak(q)$ by @Lem:4.2. The saturation formula of @prop:3.11 gives $(S^(-1)frak(q))^c=frak(q)$ and the fraction membership criterion reduces to membership of the numerator in $frak(q)$. In particular the extension is proper. If $(a\/s)(b\/t)$ lies in it and $a\/s$ lies outside it, then $a b in frak(q)$ and $a in.not frak(q)$. Hence some $b^n in frak(q)$, giving $(b\/t)^n in S^(-1)frak(q)$. Its radical is $S^(-1)frak(p)$ by @prop:3.11.
]
#remark[
  For an ideal $frak(a)$ of $A$, write $S(frak(a))=(S^(-1)frak(a))^c$ for its saturation.
]
#proposition()[
  Let $frak(a)=inter.big_(i=1)^n frak(q)_i$ be a primary decomposition and let $frak(p)_i=r(frak(q)_i)$. Set $I={i : S inter frak(p)_i=emptyset}$. Then
  $
    S^(-1)frak(a)=inter.big_(i in I) S^(-1)frak(q)_i,
    quad S(frak(a))=inter.big_(i in I) frak(q)_i.
  $
]<prop:localized-components>
#proof[
  Localization commutes with finite intersections by @prop:3.11. By @prop:localized-primary, indices outside $I$ contribute the whole localized ring. Contraction is inverse image and commutes with intersections, and each component indexed by $I$ contracts back to $frak(q)_i$. For $I=emptyset$ the intersection in each formula is the whole ring in question.
]
#definition()[
  A set $Sigma$ of primes associated with $frak(a)$ is isolated if it is closed downwards among those primes. Thus if $frak(p) in Sigma$ and $frak(p)' subset.eq frak(p)$ is associated with $frak(a)$, then $frak(p)' in Sigma$.
]
#block(breakable: false)[#theorem(title: "2nd uniqueness theorem")[
    Let $frak(a)$ be decomposable, with minimal primary decomposition
    $ frak(a)=inter.big_(i=1)^n frak(q)_i, quad frak(p)_i=r(frak(q)_i). $<eq:4.4>
    For an isolated set $Sigma$ of associated primes, the intersection $inter.big_(i:frak(p)_i in Sigma) frak(q)_i$ is independent of the primary decomposition in @eq:4.4. In particular the components corresponding to minimal primes are individually unique.
  ]<thm:2-uniqueness>
]
#proof[
  The empty set gives the intersection $A$. Otherwise take $S=A without union.big_(frak(p) in Sigma) frak(p)$. Since the ideals in $Sigma$ are proper and prime, $1 in S$ and products of elements of $S$ remain in $S$.

  Every prime in $Sigma$ is disjoint from $S$. If an associated prime $frak(p)'$ outside $Sigma$ were disjoint from $S$, it would be contained in the finite union of the primes in $Sigma$. By (1) of @prop:1.11 it would lie in one of them, contrary to downward closure. Thus localization at $S$ retains exactly the components indexed by $Sigma$.

  By @prop:localized-components, their intersection is $S(frak(a))$. The set of associated primes is intrinsic by @thm:1-uniqueness, so for the given $Sigma$, the ideal $S(frak(a))$ is independent of the decomposition. A singleton consisting of a minimal associated prime is isolated, giving uniqueness of its component.
]
#remark[
  The prime correspondence @prop:3.11 selects the primes disjoint from the denominators. The same selection governs the primary components by @prop:localized-components, and contraction recovers the intersection selected in @thm:2-uniqueness. For $(x^2,x y)$, localization at the prime $(x)$ inverts $y$, so the embedded component with radical $(x,y)$ becomes the whole localized ring. Contraction recovers the component $(x)$.
]
