BUILDAPP := buildapp
EXE := cl-froth
BUILD_OPTS := --load-system cl-froth --entry cl-froth:main

all:
	$(BUILDAPP) $(BUILD_OPTS) --output $(EXE)

clean:
	rm -f $(EXE) *.fasl
