#import "@preview/cetz:0.4.2": canvas, draw

#let algebra-logo(
  size: 9cm,
  line-color: black,
  text-color: black,
  background: white,
  dash-color: luma(80),
  stroke-width: 1.3pt,
  font-size: none,
) = {
  let scale = if type(size) == length { size / 7cm } else { 1.0 }
  let actual-font-size = if font-size != none { font-size } else { 13.5pt * calc.pow(scale, 0.7) }
  let actual-label-size = if font-size != none { font-size } else { 13.5pt * calc.pow(scale, 0.7) }
  let actual-stroke = stroke-width * calc.pow(scale, 0.5)
  let actual-dash-stroke = actual-stroke * 0.95
  let dash-len = 3.0pt * scale
  let dash-gap = 4.2pt * scale

  box(width: size)[
    #set math.equation(numbering: none)
    #canvas({
      import draw: *

      // 节点坐标 (Diamond / Lattice Layout)
      let top = (0, 3.6)
      let left = (-1.65, 1.8)
      let right = (1.65, 1.8)
      let bottom = (0, 0)

      // 1. 虚线 (0) ⤏ m (特化链 / 闭包支架)
      line(
        top,
        bottom,
        stroke: (
          paint: dash-color,
          thickness: actual-dash-stroke,
          dash: (dash-len, dash-gap),
        ),
      )

      // 2. 实线连线
      for (a, b) in (
        (top, left), // (0) -> p_1
        (left, right), // p_1 -- p_2 (同高素理想)
        (left, bottom), // p_1 -> m
        (right, bottom), // p_2 -> m
      ) {
        line(a, b, stroke: (paint: line-color, thickness: actual-stroke))
      }

      // 3. 绘制节点圆形背景与边框
      for (pos, label) in (
        (top, $(0)$),
        (left, $frak(p)_1$),
        (right, $frak(p)_2$),
        (bottom, $frak(m)$),
      ) {
        circle(
          pos,
          radius: 0.48,
          fill: background,
          stroke: (paint: line-color, thickness: actual-stroke),
        )
        content(
          pos,
          text(fill: text-color, size: actual-font-size)[#label],
          anchor: "center",
        )
      }

      // 4. 底部说明文字 Spec(A)
      content(
        (0, -1.05),
        text(
          fill: line-color,
          size: actual-label-size,
          font: ("Source Sans 3", "Noto Sans SC", "DejaVu Sans"),
          weight: "regular",
          tracking: 2.5pt,
        )[Spec(A)],
        anchor: "center",
      )
    })
  ]
}

#set page(width: auto, height: auto, margin: 1cm, fill: white)

// 预览
#align(center)[
  #algebra-logo()
]
