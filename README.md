# Dotfiles

The collections of portable dotfiles suitable for programming environment.

## Vim (NeoVim) CheetSheet

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

