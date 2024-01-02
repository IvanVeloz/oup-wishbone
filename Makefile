WBGEN2="./tools/wishbone-gen/wbgen2"
SOURCE="oup_wbgen2.wb"
VHDLTARGET="rtl/oup_wishbone.vhd"
VERILOGTARGET="rtl/oup_wishbone.v"
SWTARGET="sw/oup_wishbone.h"
DOCTARGET="docs/oup_wishbone.htm"
FLAGS=-f html -H signals
VERILOGFLAGS=-l verilog
VHDLFLAGS=-l vhdl

all: wbgen2 dirs verilog hash

check: wbgen2 dirs verilog hash
	tests/verify_output_up_to_date.sh

wbgen2:
	$(MAKE) -C tools/wishbone-gen

dirs:
	mkdir -p ./rtl
	mkdir -p ./sw
	mkdir -p ./docs

hash:
	sha256sum $(SOURCE) > .buildhash

vhdl:
	$(WBGEN2) \
		$(FLAGS) \
		-l vhdl \
		-D $(DOCTARGET) \
		-V $(VHDLTARGET) \
		-C $(SWTARGET) \
		$(SOURCE)

verilog:
	$(WBGEN2) \
		$(FLAGS) \
		-l verilog \
		-D $(DOCTARGET) \
		-V $(VERILOGTARGET) \
		-C $(SWTARGET) \
		$(SOURCE)

clean:
	rm -f \
		$(SWTARGET) $(DOCTARGET) \
		$(VERILOGTARGET) \
		$(VHDLTARGET)
