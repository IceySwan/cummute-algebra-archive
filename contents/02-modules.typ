#import "/styles/lib.typ": *
#import "/styles/operator.typ": *

= Modules
== Modules and module homomorphisms
#block(breakable: false)[#definition(title: "Module")[
    An $A$-module is an abelian group $M$ with a scalar action $A times M -> M$, $(a,m) |-> a m$, satisfying
    $
      a(m+n) & =a m+a n, & (a+b)m & =a m+b m, \
      (a b)m & =a(b m),  &  1_A m & =m
    $
    for $a,b in A$ and $m,n in M$.
  ]
]
#definition(title: "Homomorphism")[
  A homomorphism of $A$-modules is a map $f:M -> N$ preserving addition and scalar multiplication.
]
#definition(title: "Hom")[
  Write $Hom_A(M,N)$ for the set of $A$-module homomorphisms from $M$ to $N$.
]
#proposition()[
  The set $Hom_A(M,N)$ is an $A$-module under pointwise addition and scalar multiplication.
]
#proof[
  The maps $(f+g)(x)=f(x)+g(x)$ and $(a f)(x)=a f(x)$ are $A$-linear, using commutativity of $A$ for the latter. The module axioms follow pointwise from those of $N$.
]

Evaluation at $1$ gives a natural isomorphism $Hom_A(A,M) tilde.equiv M$, with inverse $m |-> (a |-> a m)$.

== Submodule and quotient module
#definition(title: "Submodule")[
  A submodule $M'$ of $M$ is an additive subgroup closed under the scalar action of $A$.
]
#definition(title: "Quotient module")[
  For a submodule $M'$, the quotient $M\/M'$ consists of cosets $m+M'$ with the induced operations. The submodule property makes both operations independent of representatives.
]
The natural map $pi : M -> M\/M'$ is surjective with kernel $M'$.

#example[
  For a homomorphism $f:M -> N$, the kernel $ker(f)$ and image $Im(f)=f(M)$ are submodules of $M$ and $N$ respectively. The cokernel is $Coker(f)=N\/Im(f)$.

  If $M' subset.eq ker(f)$, the induced map $overline(f):M\/M' -> N$ sends $m+M'$ to $f(m)$. Its value is independent of the representative since $f$ kills $M'$. It has kernel $ker(f)\/M'$ and image $Im(f)$. Taking $M'=ker(f)$ gives the first isomorphism theorem $M\/ker(f) tilde.equiv Im(f)$.
]

== Operations on submodules
1. Sum: The sum $sum_(i in I) M_i$ consists of finite sums of elements from the $M_i$.
2. Intersection: The intersection $inter.big_(i in I) M_i$ consists of elements common to every $M_i$. Sums and intersections give arbitrary joins and meets, so the submodules of $M$ form a complete lattice.

#proposition()[
  1. If $N subset.eq M subset.eq L$ are nested submodules, then $(L\/N)\/(M\/N) tilde.equiv L\/M$.
  2. If $M_1,M_2$ are submodules of $M$, then $(M_1+M_2)\/M_1 tilde.equiv M_2\/(M_1 inter M_2)$.
]
#proof[
  The map $L\/N -> L\/M$ given by $l+N |-> l+M$ is well-defined and surjective, with kernel $M\/N$. The map $M_2 -> (M_1+M_2)\/M_1$ given by $x |-> x+M_1$ is surjective with kernel $M_1 inter M_2$. Apply the first isomorphism theorem to each.
]

3. Ideal quotient: For submodules $M_1,M_2$ of $M$, the set $(M_1:M_2)={a in A : a M_2 subset.eq M_1}$ is an ideal of $A$. In particular,
$
  Ann(M)=(0:M)={a in A : a M=0}
$
is the annihilator of $M$. Write $Ann(m)=Ann(A m)$ for $m in M$.

If $frak(a) subset.eq Ann(M)$, the action $(a+frak(a))m=a m$ makes $M$ an $A\/frak(a)$-module. It is well-defined since $frak(a)$ annihilates $M$. An $A$-module is faithful if its annihilator is zero, so $M$ is faithful over $A\/Ann(M)$.

4. Direct sum: The direct sum $oplus.big_(i in I) M_i$ consists of tuples in $product_(i in I) M_i$ with finite support, with componentwise operations. For finite $I$, the direct sum and product coincide.

For a finite product of rings $A=product_i A_i$, the coordinate ideals $frak(a)_i=A e_i$ give $A=oplus.big_i frak(a)_i$ as an $A$-module, where $e_i$ has $1$ in the $i$th coordinate and zero elsewhere.
#remark[
  Conversely, given a finite decomposition $A=oplus.big_i frak(a)_i$ into ideals, put $frak(b)_i=oplus.big_(j != i) frak(a)_j$. Distinct summands have zero product since their intersections are zero. Writing $1=sum_i e_i$ with $e_i in frak(a)_i$ shows that $e_i$ acts as the identity on $frak(a)_i$. In particular $e_i^2=e_i$ and $frak(a)_i=(e_i)$. The coordinate projections identify $frak(a)_i$ with $A\/frak(b)_i$ as rings and $A$ with $product_i (A\/frak(b)_i)$.
]
#definition(title: "f.g. module")[
  An $A$-module $M$ is finitely generated if $M=sum_(i=1)^n A x_i$ for a finite family $x_1,dots,x_n$ in $M$.
]
#definition(title: "f.g. free module")[
  A finitely generated free $A$-module is a module isomorphic to $A^n$ for some $n >= 0$.
]
#proposition()[
  An $A$-module is finitely generated exactly when it is isomorphic to $A^n\/K$ for a submodule $K subset.eq A^n$ and some finite $n$.
]
#proof[
  Given generators $x_1,dots,x_n$, the map $phi:A^n -> M$ sending $(a_i)_i$ to $sum_i a_i x_i$ is surjective. The first isomorphism theorem gives $M tilde.equiv A^n\/ker(phi)$. Conversely, the images of the standard generators generate every quotient of $A^n$.
]
#definition(title: "Endomorphism")[
  An endomorphism of $M$ is an $A$-linear map $M -> M$. Write $op("End")_A(M)$ for the ring of endomorphisms under addition and composition.
]
#proposition(title: "Determinant trick")[
  Let $M$ be generated by $n >= 1$ elements, let $frak(a)$ be an ideal of $A$, and let $phi:M -> M$ be an $A$-endomorphism with $phi(M) subset.eq frak(a)M$. Then
  $
    phi^n+a_1 phi^(n-1)+dots+a_n id_M=0,
    quad a_i in frak(a)^i.
  $
]<A-dmodule-endomorphism>
#proof[
  For generators $x_1,dots,x_n$, write $phi(x_i)=sum_j b_(i j)x_j$ with $b_(i j) in frak(a)$. Put $B=(b_(i j))$ and regard $M$ as an $A[T]$-module with $T$ acting by $phi$. For the column $x=(x_i)_i$ in $M^n$, we have $(T I_n-B)x=0$. The adjugate identity over the commutative ring $A[T]$ gives $det(T I_n-B)x=0$.

  In the determinant expansion, the coefficient $a_i$ of $T^(n-i)$ is a sum of signed products of $i$ entries of $B$, so $a_i in frak(a)^i$. The polynomial is monic and annihilates each generator. Its action is $A$-linear, so it annihilates all of $M$.
]
#corollary()[
  If $M$ is finitely generated and $frak(a)M=M$, there is an $x in 1+frak(a)$ such that $x M=0$.
]<A-dmodule-0-endomorphism>
#proof[
  Apply @A-dmodule-endomorphism to $phi=id_M$ and take $x=1+a_1+dots+a_n$. The zero module admits a generating family consisting of its zero element.
]
#lemma(title: "Nakayama")[
  Let $M$ be a finitely generated $A$-module and $frak(a)$ an ideal contained in the Jacobson radical. If $frak(a)M=M$, then $M=0$.
]<prop:Nakayama-lemma>
#proof[
  By @A-dmodule-0-endomorphism, some $x in 1+frak(a)$ annihilates $M$. By @prop:jacobson-units, $x$ is a unit, so $M=x^(-1)x M=0$.
]
#corollary()[
  If $M$ is finitely generated, $N$ is a submodule and $frak(a)$ is contained in the Jacobson radical, then $M=frak(a)M+N$ implies $M=N$.
]<col-2.7>
#proof[
  The quotient $M\/N$ is finitely generated and the given equality implies $frak(a)(M\/N)=M\/N$. Apply @prop:Nakayama-lemma.
]
#proposition()[
  Let $(A,frak(m))$ be a local ring and $M$ a finitely generated $A$-module. If the classes of $x_1,dots,x_n in M$ span $M\/frak(m)M$ over the residue field $A\/frak(m)$, then $x_1,dots,x_n$ generate $M$. In particular, any lifts of a basis generate $M$.
]
#proof[
  Let $N=sum_i A x_i$. The natural map $M -> M\/frak(m)M$ takes $N$ onto the quotient, so $N+frak(m)M=M$. Since the Jacobson radical is $frak(m)$, @col-2.7 gives $N=M$.
]
#remark[
  A finite generating family supplies the matrix in @A-dmodule-endomorphism. Applying that relation to the identity produces an annihilator congruent to $1$ modulo $frak(a)$. The Jacobson radical condition makes it a unit, giving Nakayama and, on the quotient by the lifted generators, the local generation criterion.
]

== Exact sequences
#definition(title: "Exact sequence")[
  A sequence of $A$-modules and homomorphisms
  $ dots -> M_(i-1) xarrow(f_i) M_i xarrow(f_(i+1)) M_(i+1) -> dots $<exact-seq>
  is exact at $M_i$ if $Im(f_i)=ker(f_(i+1))$. A sequence is exact if it is exact at every term with both an incoming and an outgoing map. In particular, exactness of $0 -> M' xarrow(u) M$ means that $u$ is injective, and exactness of $M xarrow(v) M'' -> 0$ means that $v$ is surjective. The sequence
  $ 0 -> M' xarrow(u) M xarrow(v) M'' -> 0 $<exact-sequence-example-3>
  is exact when $u$ is injective, $v$ is surjective and $Im(u)=ker(v)$. Then $v$ induces $Coker(u) tilde.equiv M''$.
]
A sequence of type @exact-sequence-example-3 is called short exact. With $N_i=Im(f_i)=ker(f_(i+1))$, the exact sequence @exact-seq gives short exact sequences
$ 0 -> N_i -> M_i -> N_(i+1) -> 0. $
#proposition()[
  1. The sequence
  $ M' xarrow(u) M xarrow(v) M'' -> 0 $<2.5>
  is exact if and only if, for every $A$-module $P$, the sequence
  $ 0 -> Hom_A(M'',P) xarrow(overline(v)) Hom_A(M,P) xarrow(overline(u)) Hom_A(M',P) $<2.6>
  is exact. The maps are precomposition with $v$ and $u$.
  2. The sequence
  $ 0 -> N' xarrow(u) N xarrow(v) N'' $<2.7>
  is exact if and only if, for every $A$-module $P$, the sequence
  $ 0 -> Hom_A(P,N') xarrow(overline(u)) Hom_A(P,N) xarrow(overline(v)) Hom_A(P,N'') $
  is exact. The maps are postcomposition with $u$ and $v$.
]<prop:2.9>
#proof[
  For (1), surjectivity of $v$ makes precomposition with $v$ injective. A map $M -> P$ killing $Im(u)=ker(v)$ factors uniquely through $v$. Conversely, apply injectivity of precomposition with $v$ to the quotient map $M'' -> Coker(v)$, which composes with $v$ to zero. Thus $v$ is surjective. Taking $P=M''$ and precomposing $id_(M'')$ in succession gives $v compose u=0$. For $P=M\/Im(u)$ the quotient map factors through $v$ by exactness, so $ker(v) subset.eq Im(u)$.

  For (2), injectivity of $u$ gives injectivity on Hom, and a map $P -> N$ killed by $v$ takes values in $Im(u)$, where it lifts uniquely to $N'$. Conversely, taking $P=A$ identifies the Hom sequence with @2.7 via evaluation at $1$, since evaluation commutes with postcomposition.
]
#proposition(title: "Snake lemma")[
  A commutative diagram of $A$-modules with exact rows, as below, induces the following exact sequence.

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

  $
    0 -> ker(f') xarrow(overline(u)) ker(f) xarrow(overline(v)) ker(f'') \
    xarrow(delta) Coker(f') xarrow(overline(u')) Coker(f) xarrow(overline(v')) Coker(f'') -> 0.
  $
  The maps other than $delta$ come from restriction to kernels and passage to cokernels, using commutativity.
]<prop:2.10>
#proof[
  For $z in ker(f'')$, choose $x in M$ with $v(x)=z$. Then $v'(f(x))=f''(z)=0$, so $f(x)=u'(y)$ for a unique $y in N'$. Define $delta(z)=y+Im(f')$. A change of lift replaces $x$ by $x+u(w)$ for $w in M'$ and replaces $y$ by $y+f'(w)$. The class is thus well-defined. Taking sums and scalar multiples of lifts proves linearity.

  At $ker(f')$ the map is injective since $u$ is. If $x in ker(f)$ satisfies $v(x)=0$, write $x=u(w)$. Then $u'(f'(w))=0$, so $w in ker(f')$ by injectivity of $u'$. Conversely, $v u=0$. This gives exactness at $ker(f)$.

  A lift in $ker(f)$ gives $delta(z)=0$. If $delta(z)=0$, then $y=f'(w)$ for some $w in M'$, and $x-u(w)$ is a lift of $z$ in $ker(f)$. This proves exactness at $ker(f'')$.

  The class $delta(z)$ maps to zero since $u'(y)=f(x)$. Conversely, if the class of $y$ maps to zero in $Coker(f)$, write $u'(y)=f(x)$. Then $v(x) in ker(f'')$ by commutativity, and $delta(v(x))$ is the class of $y$. This gives exactness at $Coker(f')$.

  A class from $Coker(f')$ maps to zero under the composite since $v'u'=0$. If $n+Im(f)$ maps to zero in $Coker(f'')$, write $v'(n)=f''(z)$ and choose $x$ with $v(x)=z$. Then $n-f(x) in ker(v')=Im(u')$, so the class of $n$ comes from $Coker(f')$. Finally $v'$ is surjective, so the induced map onto $Coker(f'')$ is surjective.
]
#remark[
  @prop:2.10 is a special case of the long exact sequence in homology.
]
#definition()[
  Let $C$ be a class of $A$-modules. A function $lambda$ on $C$ with values in an abelian group is additive if for each short exact sequence $0 -> M' -> M -> M'' -> 0$ with terms in $C$, we have $lambda(M)=lambda(M')+lambda(M'')$.
]
#example[
  Dimension is additive on finite-dimensional vector spaces over a field.
]
#proposition()[
  Let $0 -> M_0 -> M_1 -> dots -> M_m -> 0$ be exact. If the $M_i$, the kernels of the maps and the zero module belong to $C$, then for every additive $lambda$ on $C$,
  $ sum_(i=0)^m (-1)^i lambda(M_i)=0. $
]
#proof[
  Split the sequence into $0 -> N_i -> M_i -> N_(i+1) -> 0$, with $N_0=N_(m+1)=0$ and the other $N_i$ the successive images, identified with the kernels of the outgoing maps. Inserting $lambda(M_i)=lambda(N_i)+lambda(N_(i+1))$ gives cancellation, since $lambda(0)=0$ by additivity.
]

== Tensor product of modules
#definition(title: "Tensor product")[
  The tensor product $M otimes_A N$ is an $A$-module equipped with a bilinear map $(x,y) |-> x otimes y$, universal for $A$-bilinear maps out of $M times N$. A bilinear map is $A$-linear in each variable with the other fixed. We omit the subscript when the scalar ring is clear.
]
#proposition()[
  For $A$-modules $M,N$, there is a pair $(T,g)$ with $g:M times N -> T$ bilinear such that every bilinear $b:M times N -> P$ factors uniquely as $b=h compose g$ for an $A$-linear $h:T -> P$. Any two such pairs are related by a unique isomorphism carrying one universal map to the other.
]<prop:2.12>
#proof[
  Let $F$ be the free $A$-module with basis $e_(x,y)$ indexed by $M times N$. Quotient by the submodule $D$ generated by the relations
  $
    e_(x+x',y)-e_(x,y)-e_(x',y), & quad e_(a x,y)-a e_(x,y), \
    e_(x,y+y')-e_(x,y)-e_(x,y'), & quad e_(x,a y)-a e_(x,y).
  $
  The basis classes define a bilinear $g$. Any bilinear $b$ extends from the basis to a linear map on $F$ killing $D$, hence factors through $F\/D$. The classes generate, so the factorization is unique. For two universal pairs, factoring their universal maps through one another gives inverse homomorphisms by uniqueness.

  For homomorphisms $u:M -> M'$ and $v:N -> N'$, the bilinear map $(x,y) |-> u(x) otimes v(y)$ induces $u otimes v$.
]
#corollary()[
  If a finite sum $sum_i x_i otimes y_i$ vanishes in $M otimes N$, there exist finitely generated submodules $M_0 subset.eq M$ and $N_0 subset.eq N$ containing the $x_i$ and $y_i$, respectively, such that the same sum vanishes in $M_0 otimes N_0$.
]<cor:tensor-finite-witness>
#proof[
  In the construction of @prop:2.12, the element $sum_i e_(x_i,y_i)$ is a finite linear combination of the displayed relation generators. Take $M_0$ and $N_0$ to be generated by all first and second coordinates, respectively, of the basis elements in the sum and in these finitely many relations. The same equality holds in the free module on $M_0 times N_0$, which embeds by its basis into $F$. Passing to its quotient by the bilinear relations proves the claim.
]

If $M,N$ are finitely generated, then the tensors of pairs of generators generate $M otimes N$ by bilinearity.
#proposition()[
  For $A$-modules $M,N,P$, there are canonical isomorphisms
  $
               M otimes N & -> N otimes M,                      &            x otimes y & |-> y otimes x, \
    (M otimes N) otimes P & -> M otimes (N otimes P),           & (x otimes y) otimes z & |-> x otimes (y otimes z), \
     (M oplus N) otimes P & -> (M otimes P) oplus (N otimes P), &        (x,y) otimes z & |-> (x otimes z,y otimes z), \
               A otimes M & -> M,                               &            a otimes x & |-> a x.
  $
]<prop:2.15>
#proof[
  The first map and its inverse come from swapping variables in the universal bilinear map. Both parenthesizations in the second map represent trilinear maps on $M times N times P$, by applying @prop:2.12 twice, so the rebracketing maps are inverse. For the third map the inverse adds the tensor maps induced by the two summand inclusions. The inverse of the last map sends $x$ to $1 otimes x$, since $1 otimes (a x)=a otimes x$.
]

== Restriction and extension of scalars
#definition()[
  Given a ring homomorphism $f:A -> B$ and a $B$-module $N$, restriction of scalars gives $N$ an $A$-action $a x=f(a)x$. This also makes $B$ an $A$-module.
]
#proposition()[
  If $N$ is finitely generated over $B$ and $B$ is finitely generated over $A$, then $N$ is finitely generated over $A$.
]
#proof[
  If $y_j$ generate $N$ over $B$ and $x_i$ generate $B$ over $A$, then the products $x_i y_j$ generate $N$ over $A$.
]

For an $A$-module $M$, extension of scalars gives the $B$-module $M_B=B otimes_A M$. The action is $b(b' otimes x)=b b' otimes x$. Multiplication by $b$ on $B$ is $A$-linear, so this action respects the tensor relations.
#proposition()[
  If $M$ is finitely generated over $A$, then $M_B$ is finitely generated over $B$.
]
#proof[
  If $x_i$ generate $M$, then $b otimes sum_i a_i x_i=sum_i b f(a_i)(1 otimes x_i)$. Thus the $1 otimes x_i$ generate $M_B$.
]

== Exactness properties of the tensor product
#block(breakable: false)[#proposition()[
    For $A$-modules $M,N,P$, there is a natural $A$-linear isomorphism
    $ Hom_A(M otimes_A N,P) tilde.equiv Hom_A(M,Hom_A(N,P)). $
  ]<prop:2.14>
]
#proof[
  A bilinear map $b:M times N -> P$ defines an $A$-linear map $x |-> (y |-> b(x,y))$ from $M$ to $Hom_A(N,P)$. Conversely, a linear $h:M -> Hom_A(N,P)$ defines the bilinear map $(x,y) |-> h(x)(y)$. These constructions are inverse and respect the pointwise operations. By @prop:2.12, bilinear maps also correspond to linear maps $M otimes_A N -> P$. The formulas commute with precomposition in $M$ and $N$ and postcomposition in $P$, giving naturality.
]
#proposition()[
  If
  $ M' xarrow(f) M xarrow(g) M'' -> 0 $<2.15>
  is exact, then for every $A$-module $N$ the sequence
  $ M' otimes N xarrow(f otimes id) M otimes N xarrow(g otimes id) M'' otimes N -> 0 $<2.16>
  is exact.
]
#proof[
  Apply (1) of @prop:2.9 to @2.15 with target $Hom_A(N,P)$ for arbitrary $P$. By naturality of @prop:2.14, the resulting exact sequence is the Hom sequence obtained from @2.16 with target $P$. The converse of (1) of @prop:2.9 gives exactness of @2.16.
]
#proposition()[
  For an $A$-module $N$ the following are equivalent.

  1. $N$ is flat, meaning that $- otimes_A N$ takes exact sequences to exact sequences.
  2. Tensoring any short exact sequence of $A$-modules with $N$ gives a short exact sequence.
  3. For every injection $f:M' -> M$, the map $f otimes id_N$ is injective.
  4. The same injectivity holds for every injection between finitely generated $A$-modules $M'$ and $M$.
]
#proof[
  Conditions (1) and (2) are equivalent by breaking exact sequences into short exact sequences on successive images. Under (2), each injection fits into a short exact sequence with its cokernel, giving (3). Right exactness shows that (3) implies (2), and (3) implies (4) by restriction.

  Assume (4) and identify $M'$ with its image in $M$. Let $w=sum_i x_i otimes y_i$ in $M' otimes N$ map to zero in $M otimes N$. By @cor:tensor-finite-witness, its expression already vanishes in $M_0 otimes N_0$ for finitely generated $M_0 subset.eq M$ and $N_0 subset.eq N$ containing the relevant coordinates. Hence it vanishes in $M_0 otimes N$. Let $M'_0$ be the submodule of $M'$ generated by the $x_i$. Its inclusion into $M_0$ is between finitely generated modules. By (4), the sum vanishes in $M'_0 otimes N$, and its image $w$ in $M' otimes N$ is zero.
]
#remark[
  The tensor universal property gives the Hom adjunction @prop:2.14. It transfers the first Hom exactness criterion in @prop:2.9 to right exactness of tensor product. Flatness adds preservation of injections, which supplies the left end of the tensored short exact sequence.
]
#example[
  The group $(bb(Z)\/2 bb(Z)) otimes_(bb(Z)) (bb(Z)\/3 bb(Z))$ is generated by $overline(1) otimes overline(1)$. This tensor is killed by both $2$ and $3$, hence by $1$, so the tensor product is zero. Tensoring the inclusion $2 bb(Z) -> bb(Z)$ with $bb(Z)\/2 bb(Z)$ gives a zero map between two copies of $bb(Z)\/2 bb(Z)$: under $2 bb(Z) tilde.equiv bb(Z)$ the inclusion becomes multiplication by $2$. Thus $bb(Z)\/2 bb(Z)$ fails the injection criterion for flatness.
]

== Algebras
#definition()[
  An $A$-algebra is a ring $B$ equipped with a ring homomorphism $f:A -> B$. It has the $A$-module structure $a b=f(a)b$.
]
#remark[
  If $A$ is a field and $B != 0$, the structure map is injective, so $A$ identifies with a subring of $B$. Every ring is a $bb(Z)$-algebra by the unique homomorphism $n |-> n dot 1_A$.
]

== Tensor product of algebras
#definition[
  For $A$-algebras $B,C$, give $D=B otimes_A C$ the multiplication determined by
  $ (b otimes c)(b' otimes c')=b b' otimes c c'. $
]
The right-hand side is $A$-linear in each of $b,c,b',c'$. For fixed $b,c$, @prop:2.12 gives a linear map $D -> D$ in the second tensor. This map is bilinear in $b,c$, so another application of @prop:2.12 gives a linear map $D -> Hom_A(D,D)$ and hence a bilinear multiplication $D times D -> D$. In particular,
$
  (sum_i b_i otimes c_i)(sum_j b'_j otimes c'_j)
  = sum_(i,j) b_i b'_j otimes c_i c'_j.
$
Associativity, commutativity and the identity $1_B otimes 1_C$ are checked on pure tensors, which generate $D$. The map $a |-> f(a) otimes 1_C=1_B otimes g(a)$, where $f$ and $g$ are the two structure maps, makes $D$ an $A$-algebra.
