include ../tools.mk


# Test compiler behavior in case: `jobserver-auth` points to correct pipe which is not jobserver.

all:
	echo "start"
	number=1 ; while [ $$number -le 10000 ]; \
	do \
		echo $$number; \
		echo "fn main() {}" | MAKEFLAGS="--jobserver-auth=3,3" $(RUSTC) - 3</dev/null 2>&1 | diff jobserver.stderr - || exit 1;\
		number=$$((number + 1)) ; \
	done
