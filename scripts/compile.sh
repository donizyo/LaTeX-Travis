#!/bin/bash
# vim: fileencoding=utf-8

# `-interaction=nonstopmode` sets the interaction mode to nonstop,
#     which makes TeX run without requiring feedback from the user,
#     through the errors.
# `-halt-on-error` ensures TeX exits with an error code
#     when an error is encountered during processing,
#     thus failing the build in Travis CI.
alias pdflatex='pdflatex -interaction=nonstopmode -halt-on-error'
find . -type f -iname 'main.tex' -exec pdflatex {} +
