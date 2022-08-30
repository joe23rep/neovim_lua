vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

" no tabline on alpha
  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

" format on save
  augroup _lsp
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.formatting()
  augroup end

" remove whitespace on save + stop cursor from moving on save
""  function! <SID>StripTrailingWhitespaces()
""      let l = line(".")
""     let c = col(".")
""     %s/\s\+$//e
""      call cursor(l, c)
""  endfun

""autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Automatically remove whitespaces on save
"autocmd BufWritePre * %s/\s\+$//e
]])
