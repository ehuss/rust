include ../tools.mk


# Test compiler behavior in case: `jobserver-auth` points to correct pipe which is not jobserver.

all:
	echo "start"
	number=1 ; while [ $$number -le 10000 ]; \
	do \
		echo "fn main() {}" | RUSTC_LOG=rustc_codegen_ssa=info MAKEFLAGS="--jobserver-auth=3,3" $(RUSTC) - 3</dev/null 2>&1 | $(CGREP) "early EOF on jobserver pipe" || exit 1;\
		number=$$((number + 1)) ; \
	done
