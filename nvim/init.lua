require("aybo")

vim.cmd([[
  augroup filetypedetect
    au! BufRead,BufNewFile *.templ setfiletype templ
  augroup END
]]);
