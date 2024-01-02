## OUP Wishbone interface generator

This repository contains resources to automatically generate the Wishbone interface for the OUP project. We make use of a tool called [wbgen2](https://ohwr.org/project/wishbone-gen/wikis/Home) by CERN. This tool generates HDL code from a definition file in C-like syntax. Our Wishbone interface is defined in the `oup_wbgen2.wb` file.

To generate HDL code under Linux, the usage is as follows:

1. Initialize this repository's submodules with `git submodule update --init --recursive`.
2. Build wbgen2:
    1. Install Lua 5.1. For example, in Ubuntu, `sudo apt-get install lua5.1`.
    2. Change to the wbgen2 directory with `cd tools/wishbone-gen`.
    3. Make wbgen2 with `make`.
    4. Change back to the repo's root directory with `cd ../..`.
2. Make the HDL, headers and documentation with `make`. You can specify the language with `make vhdl` and `make verilog`.
3. Get the files you need from the `rtl` and `sw` directories.

For Windows, my recommendation is to get Windows Subsystem for Linux (WSL). See Troubleshooting for some additional steps if you get stuck.

### Troubleshooting

If you are running under WSL, and get errors like 
```
./squish
/usr/bin/env: ‘lua\r’: No such file or directory
make: *** [Makefile:9: rtl] Error 127
```
this is because git is checking files out with Windows line endings (CRLF) instead of Unix line endings (LF). 
To fix this, change your git configuration `git config --global core.autocrlf false` and clone a fresh version of the repo to start over with Unix line endings (you also can fix it in-place instead, see [this guide](https://docs.github.com/en/get-started/getting-started-with-git/configuring-git-to-handle-line-endings#refreshing-a-repository-after-changing-line-endings).
