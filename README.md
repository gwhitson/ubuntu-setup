# ubuntu-setup bash script
Setup script for ubuntu (22.04 LTS), intended to be ran on a minimal GUI install right
as the install finishes.

connect to internet and run the setup script. You only need the setup script at first
as it will download git and everything necessary to get the other files needed for 
the setup.

Installs git CLI

Installs Neovim and everything necessary for my nvim config. Clones the PackerNvim
github repo so that when you are able to start nvim, you can just run ':PackerSync'
and then ':LspInstall {name of coding language Ex: python, sh, c++}' or on any file
you open, run ':LspInstall' and LSPZero will prompt you to install an LSP that
matches the open file. You may need to install additional software to run certain LSP's

removes the setup script and any files left over
