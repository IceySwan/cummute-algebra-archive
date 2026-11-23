#import "/styles/lib.typ": primary-color, secondary-color, alert-color, coker, ker
#import "@preview/cetz:0.4.2": canvas, draw

// 方案 B：带有 S 曲线的经典“蛇引理”同调图（The Snake Lemma）
#let commutative-algebra-logo() = {
  set text(size: 10pt, fill: primary-color)
  set math.equation(numbering: none)

  figure(
    box(width: 150mm, height: 85mm, {
      canvas({
        import draw: *

        let y_ker = 1.9
        let y_m = 0.8
        let y_n = -0.7
        let y_cok = -1.8

        let x_m1 = -2.4
        let x_m = 0.0
        let x_m2 = 2.4

        let node_box(pos, lbl, col: primary-color, bg: white) = {
          rect(
            (pos.at(0) - 0.45, pos.at(1) - 0.3),
            (pos.at(0) + 0.45, pos.at(1) + 0.3),
            fill: bg,
            stroke: 0.8pt + col.lighten(40%),
            radius: 0.1,
          )
          content(pos, text(fill: col, weight: "medium")[#lbl])
        }

        // Kernels row (top)
        content((x_m1, y_ker), text(fill: secondary-color)[$ker f'$])
        content((x_m, y_ker), text(fill: secondary-color)[$ker f$])
        content((x_m2, y_ker), text(fill: secondary-color, weight: "bold")[$ker f''$])
        line((-1.8, y_ker), (-0.6, y_ker), mark: (end: ">", size: 0.12), stroke: 0.8pt + secondary-color)
        line((0.6, y_ker), (1.8, y_ker), mark: (end: ">", size: 0.12), stroke: 0.8pt + secondary-color)

        // Middle Row 1: 0 -> M' -> M -> M'' -> 0
        content((-4.0, y_m), [$0$])
        node_box((x_m1, y_m), [$M'$])
        node_box((x_m, y_m), [$M$])
        node_box((x_m2, y_m), [$M''$])
        content((4.0, y_m), [$0$])

        line((-3.6, y_m), (x_m1 - 0.5, y_m), mark: (end: ">", size: 0.12), stroke: 0.9pt + primary-color)
        line((x_m1 + 0.5, y_m), (x_m - 0.5, y_m), mark: (end: ">", size: 0.12), stroke: 0.9pt + primary-color)
        content(((x_m1 + x_m) / 2, y_m + 0.22), text(size: 8pt)[$u$])
        line((x_m + 0.5, y_m), (x_m2 - 0.5, y_m), mark: (end: ">", size: 0.12), stroke: 0.9pt + primary-color)
        content(((x_m + x_m2) / 2, y_m + 0.22), text(size: 8pt)[$v$])
        line((x_m2 + 0.5, y_m), (3.6, y_m), mark: (end: ">", size: 0.12), stroke: 0.9pt + primary-color)

        // Middle Row 2: 0 -> N' -> N -> N'' -> 0
        content((-4.0, y_n), [$0$])
        node_box((x_m1, y_n), [$N'$])
        node_box((x_m, y_n), [$N$])
        node_box((x_m2, y_n), [$N''$])
        content((4.0, y_n), [$0$])

        line((-3.6, y_n), (x_m1 - 0.5, y_n), mark: (end: ">", size: 0.12), stroke: 0.9pt + primary-color)
        line((x_m1 + 0.5, y_n), (x_m - 0.5, y_n), mark: (end: ">", size: 0.12), stroke: 0.9pt + primary-color)
        content(((x_m1 + x_m) / 2, y_n + 0.22), text(size: 8pt)[$u'$])
        line((x_m + 0.5, y_n), (x_m2 - 0.5, y_n), mark: (end: ">", size: 0.12), stroke: 0.9pt + primary-color)
        content(((x_m + x_m2) / 2, y_n + 0.22), text(size: 8pt)[$v'$])
        line((x_m2 + 0.5, y_n), (3.6, y_n), mark: (end: ">", size: 0.12), stroke: 0.9pt + primary-color)

        // Vertical maps f', f, f''
        line((x_m1, y_m - 0.35), (x_m1, y_n + 0.35), mark: (end: ">", size: 0.12), stroke: 1.1pt + primary-color)
        content((x_m1 - 0.25, (y_m + y_n) / 2), text(size: 8.5pt)[$f'$])
        line((x_m, y_m - 0.35), (x_m, y_n + 0.35), mark: (end: ">", size: 0.12), stroke: 1.1pt + primary-color)
        content((x_m - 0.25, (y_m + y_n) / 2), text(size: 8.5pt)[$f$])
        line((x_m2, y_m - 0.35), (x_m2, y_n + 0.35), mark: (end: ">", size: 0.12), stroke: 1.1pt + primary-color)
        content((x_m2 - 0.25, (y_m + y_n) / 2), text(size: 8.5pt)[$f''$])

        // Cokernels row (bottom)
        content((x_m1, y_cok), text(fill: secondary-color, weight: "bold")[$coker f'$])
        content((x_m, y_cok), text(fill: secondary-color)[$coker f$])
        content((x_m2, y_cok), text(fill: secondary-color)[$coker f''$])
        line((-1.7, y_cok), (-0.7, y_cok), mark: (end: ">", size: 0.12), stroke: 0.8pt + secondary-color)
        line((0.7, y_cok), (1.7, y_cok), mark: (end: ">", size: 0.12), stroke: 0.8pt + secondary-color)

        // Inclusions and projections
        line(
          (x_m1, y_ker - 0.25),
          (x_m1, y_m + 0.35),
          mark: (end: ">", size: 0.1),
          stroke: (paint: secondary-color, dash: "dashed", thickness: 0.7pt),
        )
        line(
          (x_m, y_ker - 0.25),
          (x_m, y_m + 0.35),
          mark: (end: ">", size: 0.1),
          stroke: (paint: secondary-color, dash: "dashed", thickness: 0.7pt),
        )
        line(
          (x_m2, y_ker - 0.25),
          (x_m2, y_m + 0.35),
          mark: (end: ">", size: 0.1),
          stroke: (paint: secondary-color, dash: "dashed", thickness: 0.7pt),
        )

        line(
          (x_m1, y_n - 0.35),
          (x_m1, y_cok + 0.25),
          mark: (end: ">", size: 0.1),
          stroke: (paint: secondary-color, dash: "dashed", thickness: 0.7pt),
        )
        line(
          (x_m, y_n - 0.35),
          (x_m, y_cok + 0.25),
          mark: (end: ">", size: 0.1),
          stroke: (paint: secondary-color, dash: "dashed", thickness: 0.7pt),
        )
        line(
          (x_m2, y_n - 0.35),
          (x_m2, y_cok + 0.25),
          mark: (end: ">", size: 0.1),
          stroke: (paint: secondary-color, dash: "dashed", thickness: 0.7pt),
        )

        // Bridge: white halo under the snake where it crosses vertical arrow f
        line((-0.22, 0.05), (0.22, 0.05), stroke: 4.5pt + white)

        // THE SNAKE
        hobby(
          (2.8, 1.9),
          (3.7, 0.9),
          (0.0, 0.05),
          (-3.7, -0.9),
          (-2.8, -1.8),
          stroke: 1.8pt + alert-color,
          mark: (end: ">", size: 0.16),
        )
        content((0.75, 0.38), box(
          fill: white,
          radius: 2pt,
          inset: (x: 2.5pt, y: 1.5pt),
          text(size: 11pt, weight: "bold", fill: alert-color)[$delta$],
        ))
      })
      place(top + center, dy: 66mm, text(
        size: 8.5pt,
        $0 -> ker f' -> ker f -> ker f'' -->^(delta) coker f' -> coker f -> coker f'' -> 0$,
      ))
    }),
    kind: "cover-logo",
    numbering: none,
    outlined: false,
    alt: "The Snake Lemma commutative diagram with the connecting homomorphism delta winding across the rows.",
  )
}
