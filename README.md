# cl-froth
cl-froth is a port of the FORTH interpreter froth, written in Clojure
some time ago. The point of it is for me to become acquainted with
Common Lisp, so expect ugliness and bad practices ahead

# building
Building is currently done through the Makefile, which should be able
to become fairly implementation agnostic eventually. However, as of
right now, only SBCL and CLISP are supported, and even then, the CLISP
version seems to have some issues.

Run `make all` for SBCL, `make clisp` for CLISP

