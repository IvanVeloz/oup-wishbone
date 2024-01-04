WBGEN2="tools/wishbone-gen/wbgen2"
SOURCE="oup_wbgen2.wb"

VHDLTARGET="rtl/oup_wishbone.vhd"
VERILOGTARGET="rtl/oup_wishbone.v"
SWTARGET="sw/oup_wishbone.h"
DOCTARGET="docs/oup_wishbone.htm"

FLAGS=-f html -H signals
VERILOGFLAGS=-l verilog
VHDLFLAGS=-l vhdl


.DELETE_ON_ERROR:

.PHONY: all
all: .buildhash

.PHONY: check
check: all
	tests/verify_output_up_to_date.sh

$(WBGEN2):
	$(MAKE) -C tools/wishbone-gen

.buildhash: $(VERILOGTARGET)
	sha256sum $(SOURCE) > .buildhash

$(VHDLTARGET): $(WBGEN2)
	mkdir -p ./rtl
	mkdir -p ./sw
	mkdir -p ./docs
	$(WBGEN2) \
		$(FLAGS) \
		-l vhdl \
		-D $(DOCTARGET) \
		-V $(VHDLTARGET) \
		-C $(SWTARGET) \
		$(SOURCE)

$(VERILOGTARGET): $(WBGEN2)
	mkdir -p ./rtl
	mkdir -p ./sw
	mkdir -p ./docs
	$(WBGEN2) \
		$(FLAGS) \
		-l verilog \
		-D $(DOCTARGET) \
		-V $(VERILOGTARGET) \
		-C $(SWTARGET) \
		$(SOURCE)

.PHONY: clean
clean:
	rm -f \
		$(SWTARGET) $(DOCTARGET) \
		$(VERILOGTARGET) \
		$(VHDLTARGET)
