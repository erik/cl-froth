LISP=sbcl

sbcl_BUILDOPTS= --load ./make.lisp
clisp_BUILDOPTS=-K full -on-error exit < ./make.lisp

FILES=cl-froth.asd core.lisp compile.lisp dictionary.lisp package.lisp \
functions.lisp stack.lisp cl-froth.lisp wrappers.lisp reader.lisp

BUILD_OPTS := --load-system cl-froth --entry cl-froth:main

all: cl-froth

clisp:
	$(MAKE) all "LISP=clisp"

cl-froth: $(FILES)
	$(LISP) $($(LISP)_BUILDOPTS)

clean:
	rm -f *.fasl
	rm -f cl-froth
