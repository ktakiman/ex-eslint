# ex-eslint

A simple vim plug-in which executes eslint on a current buffer, made to practice my plugin writing skills, but also to be useful.

## dependencies

[nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

## useage

It exports a single lua function - `execEsLint` - which I map in init.vim:

```
nnoremap <leader>kl <cmd>lua require('eslint').execEsLint()<cr>
```
