# 交换图与结构图源码（Commutative Algebra）

本目录集中存放 `atiyah-commute-algebra/` 正文中的交换图与结构图模块。交换图使用 `@preview/commute`，格图/Hasse 图使用 `@preview/cetz`。

## 约定

1. **一章一模块**，文件名 `NN-短名.typ`（`NN` 为所属章号），例如 `02-modules-diagrams.typ`。
2. 模块导出**无参函数**，返回 `align(center, ...)` 包裹的图内容（`commutative-diagram`、`canvas` 等）；图本身不编号，正文用 "the following diagram" 引用。
3. 模块自行引入绘图宏包和所需算符，正文不出现坐标：
   ```typst
   #import "@preview/commute:0.3.0": arr, commutative-diagram, node
   #import "/styles/operator.typ": otimes
   ```
4. 正文引用方式（章文件位于 `contents/`）：
   ```typst
   #import "../figures/02-modules-diagrams.typ": snake-lemma-diagram
   ...
   #snake-lemma-diagram()
   ```
5. 修改后从仓库根目录编译：
   ```powershell
   typst compile --root . atiyah-commute-algebra/main.typ atiyah-commute-algebra/main.pdf
   ```

## 现有图模块

| 模块 | 函数 | 用于 |
|---|---|---|
| `02-modules-diagrams.typ` | `snake-lemma-diagram()` | Ch2 §2.6 蛇引理的阶梯图 |
| `02-modules-diagrams.typ` | `tensor-universal-diagram()` | Ch2 §2.7 张量积的万有性质（三角形） |
| `03-localization-diagrams.typ` | `ring-localization-universal-diagram()` | Ch3 §3.1 环局部化的万有性质（三角形） |
| `03-localization-diagrams.typ` | `module-localization-universal-diagram()` | Ch3 §3.1 模局部化的万有性质（三角形） |
| `03-localization-diagrams.typ` | `localized-tensor-square-diagram()` | Ch3 §3.1 局部化张量的自然性方块 |
| `04-associated-primes.typ` | `associated-primes-diagram()` | Ch4 §4.2 例 $(x^2,x y)=(x) inter (x,y)^2$ 的包含格图（CeTZ，标出极小/嵌入素理想与两个 primary 分量） |

> 封面上的蛇引理图（含红色蛇形 $delta$ 路径）由 `assets/atiyah-commute-cover.typ` 用 CeTZ 绘制，与 `02-modules-diagrams.typ` 中的正文版本相互独立。