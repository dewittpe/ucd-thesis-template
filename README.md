# University of Colorado Denver | Anschutz Medical Campus Ph.D. Thesis Template

[![Build Status](https://travis-ci.com/dewittpe/ucd-thesis-template.svg?branch=master)](https://travis-ci.com/dewittpe/ucd-thesis-template)

This work is based on the `.cls` that Peter DeWitt used for his dissertation,
and is based on the `.cls` file written by Sarah Kreidler
github.com/dewittpe/ucd-dissertation-template.

Two example LaTeX `.cls` files are provided.  There are nearly the same, the
only difference is `ucdenver-dissertation.cls` is for those with one thesis
advisor and `ucdenver-dissertation-coadvisors.cls` is for those with
co-advisors.

The `ucdDissertation.bst`, `ucdenver-dissertation.cls` and `dissertation.tex`
are the three files, at a minimum, you'll need as a starting point for your
dissertation.

    .
    |-- figures                               #-\
    |   |-- a.pdf                             #--\
    |   |-- b.pdf                             #---\
    |   |-- c.pdf                             #----\
    |   `-- d.pdf                             #-----\
    |-- appendix01.tex                        #------- Contents of the dissertation
    |-- chapter01.tex                         #-----/
    |-- chapter02.tex                         #----/
    |-- chapter03.tex                         #---/
    |-- chapter04.tex                         #--/
    |-- chapter05.tex                         #-/
    |-- dissertation-coadvisors.pdf           # Example Output
    |-- dissertation-coadvisors.tex           # Example parent file if you have co-advisors
    |-- dissertation.pdf                      # Example Output
    |-- dissertation.tex                      # Example parent file if you have one advisor
    |-- Format-Guide.pdf                      # UCD Format Guide
    |-- makefile                              
    |-- newcommands.tex                       # Custom LaTeX macros
    |-- README.md                             # _This_ file
    |-- references.bib                        # bibtex references
    |-- r-references.bib                      # more references
    |-- ucdDissertation.bst                   # bibtex style file
    |-- ucdenver-dissertation.cls             # .cls for one advisor
    |-- ucdenver-dissertation-coadvisors.cls  # .cls for co-advisors
    `-- usepackages.tex                       # Additional packages needed

## Notes
This template is a good start, but there is no guarantee that using this
template will produce a document passing the graduate school format review.
You will likely need to tweak a line or two within your dissertation.  I did.

A more complex design, each chapter in its own subdirectory, with its own
makefile, can be very helpful, especially if you are using
[knitr](https://yihui.name/knitr/) to author parts of your dissertation.  More
details can be provided if needed.
