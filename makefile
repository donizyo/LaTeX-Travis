# engine
ENGINE=xelatex
OPTIONS=-interaction=nonstopmode -halt-on-error

# @see https://linux.die.net/man/1/pdflatex
# `-interaction=nonstopmode` sets the interaction mode to nonstop,
#     which makes TeX run without requiring feedback from the user,
#     through the errors.
# `-halt-on-error` ensures TeX exits with an error code
#     when an error is encountered during processing,
#     thus failing the build in Travis CI.
compile:
	find . -type f -iname 'main.tex' -print -exec ${ENGINE} ${OPTIONS} {} +

# publish files (such as *.pdf and *.log) onto deploy branch on Github
deploy:
	chmod u+x scripts/deploy.sh && ./scripts/deploy.sh
