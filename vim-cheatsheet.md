# Vim Cheat Sheet
This cheat sheet contains shortcuts to make me productive using nvim config in this repository.

> DISCLAIMER: This cheat sheet may won't work with other nvim config setup

## Intellisense via lsp (lspsaga) and jdtls
| | |
|--------------- | --------------- |
| `<Ctrl>]`   | `vim.lsp.buf` jump to class files |
| `gh` | `Lspsaga lsp_finder` find declaration and references for symbol under cursor |
| `gd` | `Lspsaga peek_definition` peek symbol definition in a floating window |
| `gD` | `vim.lsp.buf` go to type definition |
| `<Leader>si` | `telescope` [s]earch [i]mplementation for the symbol under cursor |
| `<Leader>sc` | `telescope` [s]earch incoming [c]alls for the symbol under cursor |
| `K` | `Lspsaga hover_doc` show doc symbol under cursor |
| `<Leader>ca` | `Lspsaga` `normal and visual mode` open code action window |
| `gr` | `Lspsaga rename` rename variable |
| `<Leader>sl` | `Lspsaga show_line_diagnostic` [s]how [l]ine diagnostic. Press `<Enter>` to close |
| `<Leader>sw` | `Lspsaga show_workspace_diagnostic` [s]how [w]orkspace diagnostic. Press `<Enter>` to close |
| `<Leader>sb` | `Lspsaga show_buf_diagnostic` [s]how [b]buffer diagnostic. Press `<Enter>` to close |
| `[d` | `Lspsaga diagnostic_jump_prev` jump to previous diagnostic |
| `]d` | `Lspsaga diagnostic_jump_next` jump to next diagnostic |
| `[e` | `Lspsaga` jump to previous error diagnostic |
| `]e` | `Lspsaga` jump to next error diagnostic |
| `<Alt>d` | `Lspsaga` open float terminal |
| `<Alt>d` | `Lspsaga` `terminal mode` close float terminal |
| `<Leader>o` | `Lspsaga` toggle file outline in a split window |
| `<Alt>o` | `jdtls` organize imports |
| `crm` | `jdtls` `visual mode` extract method |
| `crv` | `jdtls` extract variable |
| `crc` | `jdtls` extract constant |
| `<Leader>ty` | `jdtls` run test class |
| `<Leader>tr` | `jdtls` run test for nearest method |
| `:Format` | `vim.lsp.buf` format file in the current buffer |
| `<Leader>f` | `vim.lsp.buf` format file in the current buffer |

## Commenting
| | |
|--------------- | --------------- |
| `<Leader>gcc` | toggle comment a line |
| `<Leader>gc` | toggle comment selected file (visual) |

## File navigation
| | |
|--------------- | --------------- |
| `sf` | `telescope` `file_browser` open file browser |
| `h` | `telescope` `file_browser` go to parent dir |
| `N` or `c` | `telescope` `file_browser` create a new file in telescope file browser, when the new path ends with `/`, a new directory will be created |
| `r` | `telescope` `file_browser` rename the file under cursor |
| `/` | `telescope` `file_browser` start insert |
| `d` | `telescope` `file_browser` delete the file under cursor |
| `q` | `telescope` `file_browser` close window |
| `<Leader>sf` | `telescope` [s]earch [f]iles under root directory (recursively) |
| `<Leader>sg` | `telescope` [s]earch by [g]rep |
| `<Leader>space` | `telescope` list current buffers |
| `<Leader>?` | `telescope` list recent files |

## File editing
| | |
|--------------- | --------------- |
| select lines, then in `visual mode` `:` then add `s/{1}/{2}/<CR>` | find texts int the selected lines that matches `{1}` then replace them with `{2}` |
| `:s/{1}/{2}/` | replace `{1}` with `{2}` in the current buffer |
| `:bp` | go to previous buffer |
| `:bn` | go to next buffer |
| `:b{#}` | go to specific buffer where `{#}` is the buffer's number |
| `:bd` | delete current buffer |
| `<Leader>yy` | copy current line to clipboard |
| `<Leader>y` | `visual mode` copy selected lines to clipboard |
| `<leader>p` | paste from clipboard |
| `<leader>w` | save current buf |
| `<leader>wq` | save current buf and close |
| `<leader>wy` | save all changed opened bufs |
| `v%` | select matching braces, inclusive |

## Vim Surrounds
`{symbol}` refers to mostly parentheses, brackets, quotes, XML tags.
| | |
|--------------- | --------------- |
| `visual mode` `S{symbol}` | surrounds the highlighted text with the `{symbol}` |
| `ysiw[` | surrounds the word under cursor with `[`, use `]` to add spaces i.e., `[ hello ]`. The logic applies to `{}` and `()` |
| `ys2iw{symbol}` | surrounds 2 words (`2iw`) from symbol under cursor with `{symbol}`. The `ys` command could be followed by vim movement command |
| `yss{symbol}` | surrounds the entire line with `{symbol}`, e.g: `yss<p>` |
| `ds{symbol}` | deletes surrounding symbol |
| `cs{symbol1}{symbol2}` | change surrounding from `{symbol1}` to `{symbol2}`, e.g.,`cs']` |
| `cst{symbol}` | change surrounding **tag** from any tag to `{symbol}`, e.g.,`cst]` changes `<p>hello</p>` to `[ hello ]` |

## Git
| | |
|--------------- | --------------- |
| `:Gitsigns toggle_current_line_blame` | toggle show git blame for current line |



