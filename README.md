Exclude-Format filter
==================================================================

[![GitHub build status][CI badge]][CI workflow]


[CI badge]: https://img.shields.io/github/actions/workflow/status/robertbachmann/exclude-format/ci.yaml?branch=main
[CI workflow]: https://github.com/robertbachmann/exclude-format/actions/workflows/ci.yaml


Usage
------------------------------------------------------------------

This filter removes `Div` elements from the output of specified
formats.

**Example:**

````
::: {exclude-format='latex beamer'}
This text was produced with Pandoc.
:::

```{=latex}
This text was produced with Pandoc and \LaTeX{}.
```
````

Multiple formats can be seperated with comma ("`,`") or spaces.

### Plain pandoc

Pass the filter to pandoc via the `--lua-filter` (or `-L`) command
line option.

    pandoc --lua-filter exclude-format.lua ...

### R Markdown

Use `pandoc_args` to invoke the filter. See the [R Markdown
Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/lua-filters.html)
for details.

``` yaml
---
output:
  word_document:
    pandoc_args: ['--lua-filter=exclude-format.lua']
---
```

License
------------------------------------------------------------------

This pandoc Lua filter is published under the MIT license, see
file `LICENSE` for details.
