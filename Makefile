WBGEN2="./tools/wishbone-gen/wbgen2"
SOURCE="oup_wbgen2.wb"
VHDLTARGET="rtl/oup_wishbone.vhd"
VERILOGTARGET="rtl/oup_wishbone.v"
SWTARGET="sw/oup_wishbone.h"
DOCTARGET="docs/oup_wishbone.htm"
FLAGS=-f html -H signals

all: verilog

vhdl:
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
	sha256sum $(SOURCE) > .BUILDHASH

verilog:
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
	sha256sum $(SOURCE) > .BUILDHASH
	
clean:
	rm -f \
		$(SWTARGET) $(DOCTARGET) \
		$(VERILOGTARGET) \
		$(VHDLTARGET)
