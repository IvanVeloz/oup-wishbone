WBGEN2="./bin/wbgen2"
SOURCE="oup_wbgen2.wb"
RTLTARGET="rtl/oup_wishbone.vhd"
VERILOGTARGET="rtl/oup_wishbone.vhd"
SWTARGET="sw/oup_wishbone.h"
DOCTARGET="docs/oup_wishbone.htm"
FLAGS=-l vhdl -f html -H signals

# TODO: preppend source file checksums to output files

all: rtl

rtl:
	mkdir -p ./rtl
	mkdir -p ./sw
	mkdir -p ./docs
	$(WBGEN2) \
		$(FLAGS) \
		-D $(DOCTARGET) \
		-V $(RTLTARGET) \
		-C $(SWTARGET) \
		$(SOURCE)
	sha256sum $(SOURCE) > .BUILDHASH

verilog:
	mkdir -p ./rtl
	mkdir -p ./sw
	mkdir -p ./docs
	$(WBGEN2) \
		-l verilog -f html -H signals \
		-D $(DOCTARGET) \
		-V $(VERILOGTARGET) \
		-C $(SWTARGET) \
		$(SOURCE)
	sha256sum $(SOURCE) > .BUILDHASH
	
clean:
	rm $(RTLTARGET)
	rm $(SWTARGET)
	rm $(DOCTARGET)
	rm $(VERILOGTARGET)