inoremap è \`e
inoremap é \'e
inoremap ò \`o
inoremap à \`a
inoremap ù \`u
inoremap ì \`\i\

set makeprg=pdflatex\ -file-line-error\ -halt-on-error\ -interaction=nonstopmode\ %

" Match file name
setlocal errorformat=%-P**%f
setlocal errorformat+=%-P**\"%f\"

" Match LaTeX errors
setlocal errorformat+=%E!\ LaTeX\ %trror:\ %m
setlocal errorformat+=%E%f:%l:\ %m
setlocal errorformat+=%E!\ %m

" More info for undefined control sequences
setlocal errorformat+=%Z<argument>\ %m

" More info for some errors
setlocal errorformat+=%Cl.%l\ %m

" Catch-all to ignore unmatched lines
setlocal errorformat+=%-G%.%#
