# Find and Replace on Neovim - LazyVim

## Find and Replace

- Use `/` to search for a pattern in the current buffer
- Use `?` to search for a pattern backward
- Use `n` to repeat the last search
- Use `N` to repeat the last search in the opposite direction
- Use `:noh` to clear the search highlights
- Use `:set hlsearch` to enable search highlights
- Use `:set nohlsearch` to disable search highlights

## Replace

- Use `:%s/old/new/g` to replace all occurrences of `old` with `new` in the current buffer
- Use `:%s/old/new/gc` to replace all occurrences of `old` with `new` in the current buffer with confirmation
- Use `:%s/old/new/gc` to replace all occurrences of `old` with `new` in the current buffer without confirmation
- Use `:%s/old/new/g` to replace all occurrences of `old` with `new` in the current buffer
- Use `:%s/old/new/gc` to replace all occurrences of `old` with `new` in the current buffer with confirmation
- Use `:%s/old/new/gc` to replace all occurrences of `old` with `new` in the current buffer without confirmation
