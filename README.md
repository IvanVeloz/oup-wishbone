## OUP Wishbone interface generator

This repository contains resources to automatically generate the Wishbone interface for the OUP project. We make use of a tool called [wbgen2](https://ohwr.org/project/wishbone-gen/wikis/Home) by CERN. This tool generates HDL code from a definition file in C-like syntax. Our Wishbone interface is defined in the `oup_wbgen2.wb` file.

To generate HDL code under Linux, the usage is as follows:

1. Download wbgen2 from [the Open Hardware Repository](https://ohwr.org/project/wishbone-gen/wikis/Documents/Project-Attachments) and place it on the `bin` directory of this repo. As an alternative, you may build it from source.
2. Run `make`.
3. Get the files you need from the `rtl` and `sw` directories.

You may modify the `Makefile` for use with Cygwin on Windows. Another option is to use WSL to run a Linux shell. This would need no modification.