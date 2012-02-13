LISP=sbcl

sbcl_BUILDOPTS= --noinform --load ./make.lisp
clisp_BUILDOPTS=-K full -on-error exit < ./make.lisp

FILES=cl-froth.asd src/core.lisp src/compile.lisp src/dictionary.lisp src/package.lisp \
src/functions.lisp src/stack.lisp src/cl-froth.lisp src/wrappers.lisp src/reader.lisp

BUILD_OPTS := --load-system cl-froth --entry cl-froth:main

all: cl-froth

clisp:
	$(MAKE) all "LISP=clisp"

cl-froth: $(FILES)
	$(LISP) $($(LISP)_BUILDOPTS)

clean:
	rm -f *.fasl
	rm -f cl-froth
