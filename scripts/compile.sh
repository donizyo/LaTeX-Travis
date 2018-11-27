#!/bin/bash
# vim: fileencoding=utf-8

# @see https://linux.die.net/man/1/pdflatex
# `-interaction=nonstopmode` sets the interaction mode to nonstop,
#     which makes TeX run without requiring feedback from the user,
#     through the errors.
# `-halt-on-error` ensures TeX exits with an error code
#     when an error is encountered during processing,
#     thus failing the build in Travis CI.
find . -type f -iname 'main.tex' -print0 -exec pdflatex -file-line-error -interaction=nonstopmode -halt-on-error {} +
