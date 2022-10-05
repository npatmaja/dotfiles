# Dotfiles

The collections of portable dotfiles suitable for programming environment.

## Vim (NeoVim) CheetSheet

### Vim window navigation
| Keymap   | Description    |
|--------------- | --------------- |
| Ctrl w, s	| split window |
| Ctrl w, w	| switch windows |
| Ctrl w, q	| quit a window |
| Ctrl w, v	| split window vertically |
| Ctrl w, h	| move cursor to window left |
| Ctrl w, l	| move cursor to window right |
| Ctrl w, k	| move cursor to window above |
| Ctrl w, j	| move cursor to window below |
| `:NvimTreeToggle` / `leader+tt` | Toggle open nvim tree window |
| `:NvimTreeFocus` / `leader+tf` | Focus to nvim tree window |

### File Editing
| Short Key | Description |
| --- | --- |
| `:e /path/to/file` | Open the file in a new vim buffer |
| `:ls` | List all buffers |
| `:b<n>` | Open the buffer no `n` |
| `:bd` | Delete current active buffer |
| `:bn` / `bnext` | Go to next buffer |
| `:bp` / `bprev` | Go to previous buffer |
| `:ene` / `enew` | Open a blank file for editing |
| `leader+yy` (normal mode) | Copy a line to clipboard |
| `leader+y` (visual mode) | Copy blocked text to clipboard |
| `leader+p` | Paste text from clipboard |
| `C+u` | Move screen up by half page |
| `C+b` | Move screen up by one page |
| `C+d` | Move screen down by half page |
| `C+f` | Move screen down by one page |


### Programming (autocomplete, snippets, etc)

#### Autocompletion

| Keymap   | Description    |
|--------------- | --------------- |
| `Tab`   | Select next item  |
| `Shift+Tab`   | Select previous item  |
| `C+j` | Select previous item |
| `C+k` | Select next item |
| `C+d` | Scroll down |
| `C+f` | Scroll up |
| `C+Space` | Open suggestion box |
| `C+e` | Close suggestion box |
| `Enter` | Select suggestion |

#### Code snippet

| Keymap   | Description    |
|--------------- | --------------- |
| `Tab`   | Go to next placeholder   |
| `Shift+Tab`   | Go to previous placeholder   |

### File Navigation

| Keymap   | Description    |
|--------------- | --------------- |
| `leader+space`   | Opens the Telescope UI and searches through the names of ***open buffers*** |
| `leader+sf`   | Search through project files in the current directory. Useful when open new files   |
| `leader+sp`   | Search the whole project, equivalent with `Shift+F` in other editors |
| `Ctrl+c`      | Close the Telescope window |

See the [default mapping](https://github.com/nvim-telescope/telescope.nvim#default-mappings) fo a more comprehensive list.

### Other useful command
| Command   | Description    |
|--------------- | --------------- |
| `:%!jq .` | Prettify JSON String |

### JDTLS
| Command   | Description    |
|--------------- | --------------- |
| `leader+df`   |  Run test class  |
| `leader+dn`   |  Run nearest test method  |

