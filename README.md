# cl-froth
cl-froth is a port of the FORTH interpreter froth, written in Clojure
some time ago. The point of it is for me to become acquainted with
Common Lisp, so expect ugliness and bad practices ahead

# building
Uses ASDF and quicklisp.

To build an executable using SBCL, run `make`. This requires buildapp
to run. Without buildapp, you can try doing `(load "make")` or running
`./make.lisp`. This is also currently SBCL only, but will eventually
include some other Lisps as well.

# license
I don't know, how about Microsoft Public License?
