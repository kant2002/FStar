# Poly files are here for benchmarking, and expected to fail without tactics
EXCLUDED_FSTAR_FILES=Launch.fst CanonDeep.fst Poly1.fst Poly2.fst \
		     StringPrinterTest.fst StringPrinterTest.Aux.fst ReifiedTc.fst
		     # ^ these last 3 should be fixed and restored

ifndef KRML_HOME
  EXCLUDED_FSTAR_FILES += $(wildcard StringPrinter*)
endif

FSTAR_FILES = $(filter-out $(EXCLUDED_FSTAR_FILES), $(wildcard *.fst))

all: verify-all eci19.all #stringprintertest

%.all: %
	+$(MAKE) -C $^ all

$(CACHE_DIR):
	mkdir -p $@

ifdef KRML_HOME
INCLUDE_PATHS+=$(KRML_HOME)/krmllib
endif

#shadowing of files because of implicitly opening a namespace
#321: already cached
OTHERFLAGS += --warn_error -274-321

include ../Makefile.common

verify-all: $(CACHE_DIR) $(addsuffix .checked, $(addprefix $(CACHE_DIR)/, $(FSTAR_FILES)))

launch: Launch.fst
	$(FSTAR) --unsafe_tactic_exec $^

ifdef KRML_HOME
stringprintertest: $(CACHE_DIR)
	 [ ! -f $(KRML_HOME)/krml ] || [ ! -x $(KRML_HOME)/krml ] || $(KRML_HOME)/krml -tmpdir stringprintertest -bundle 'StringPrinter.\*' -bundle StringPrinterTest.Aux -drop 'FStar.Tactics.\*' -drop 'FStar.Reflection.\*' StringPrinterTest.fst -skip-linking
else
stringprintertest:
endif

FStar.Tactics.CanonCommSemiring.cmxs FStar.Tactics.CanonCommMonoid.cmxs:
	$(FSTAR) --cache_checked_modules --codegen Plugin --extract 'FStar.Tactics.CanonCommSemiring FStar.Tactics.CanonCommMonoid FStar.Tactics.CanonCommSwaps' FStar.Tactics.CanonCommSemiring.fst
	rm -f ./*.cmxs
	cat FStar.Tactics.CanonCommMonoid.ml.fixup >> FStar.Tactics.CanonCommMonoid.ml
	cat FStar.Tactics.CanonCommSemiring.ml.fixup >> FStar.Tactics.CanonCommSemiring.ml
	env OCAMLPATH="../../bin/" ocamlfind ocamlopt -shared -I . -package fstar-tactics-lib -o ./FStar.Tactics.CanonCommMonoid.cmxs ./FStar.Tactics.CanonCommSwaps.ml ./FStar.Tactics.CanonCommMonoid.ml
	env OCAMLPATH="../../bin/" ocamlfind ocamlopt -shared -I . -package fstar-tactics-lib -o ./FStar.Tactics.CanonCommSemiring.cmxs ./FStar.Tactics.CanonCommSwaps.ml ./FStar.Tactics.CanonCommMonoid.ml ./FStar.Tactics.CanonCommSemiring.ml

canon-native: FStar.Tactics.CanonCommSemiring.cmxs FStar.Tactics.CanonCommMonoid.cmxs
	$(FSTAR) --load FStar.Tactics.CanonCommMonoid FStar.Tactics.CanonCommMonoid.fst
	$(FSTAR) --load FStar.Tactics.CanonCommSemiring FStar.Tactics.CanonCommSemiring.fst
