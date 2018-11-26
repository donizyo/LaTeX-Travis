[![TravisBuildStatus](https://travis-ci.org/donizyo/LaTeX-Travis.svg?branch=master)](https://travis-ci.org/donizyo/LaTeX-Travis)

# What this project does
This project is an experiment,
which tests if [TravisCI](https://travis-ci.org/) could
install [TeX Live](https://www.tug.org/texlive/) packages,
compile [LaTeX](https://www.latex-project.org/) documents,
generate PDFs,
and publish them.

You can check out the output PDF [here](https://github.com/donizyo/LaTeX-Travis/blob/deploy/main.pdf).

# How it is done
First of all, TravisCI is told to download and install
all the debian packages of TeX Live;

Then, TravisCI compiles all the TeX files
and turn them into PDFs;

At last, TravisCI executes _deploy.sh_,
which creates a new orphan branch **deploy**,
remove any cached files,
commit PDFs and log files,
and force push the branch onto the Github.

# Licenses
All the files in this project,
are licensed under [MIT license](https://choosealicense.com/licenses/mit/),
except generated PDFs, which are licensed
under [![CC BY 4.0](https://licensebuttons.net/l/by/4.0/80x15.png)](https://creativecommons.org/licenses/by/4.0/).

# Reference
1. [Continuous integration for LaTeX](https://mirocupak.com/continuous-integration-for-latex/)
2. [texlive - How to build my LaTeX automatically using Travis CI? - TeX - LaTeX Stack Exchange](https://tex.stackexchange.com/q/398830/174531)
3. [PHPirates/travis-ci-latex-pdf: Overview of methods to build LaTeX with Travis-CI](https://github.com/PHPirates/travis-ci-latex-pdf)
4. [How to create a new empty branch for a new project - Stack Overflow](https://stackoverflow.com/a/13969482/4927212)
5. [Git push requires username and password - Stack Overflow](https://stackoverflow.com/a/50007306/4927212)
6. [Authenticate with GitHub using token - Stack Overflow](https://stackoverflow.com/a/22977235/4927212)
7. [Pushing to github from TravisCI - Github Gist](https://gist.github.com/willprice/e07efd73fb7f13f917ea)
