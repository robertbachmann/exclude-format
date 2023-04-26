---
title: Lorem ipsum
author: Nullus
---

::: {.some-class #someId some-attr1=a some-att2=b}
Lorem ipsum.
:::

::: {exclude-format='latex beamer' #someId2}
This text was produced with Pandoc.
:::

::: {exclude-format='latex,beamer' #someId3}
This text was produced with Pandoc.
:::

```{=latex}
This text was produced with Pandoc and \LaTeX{}.
```

Lorem ipsum.