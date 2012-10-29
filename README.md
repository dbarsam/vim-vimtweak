vim-vimtweak
============
A Vim plugin wrapper for `vimtweak.dll`, a GVim tweaking dll.

This code is a personal repackaging of Yasuhiro Matsumoto's [vimtweak.dll](https://github.com/mattn/vimtweak) with some superfluous customizations and should not be confused with an actual Vim plugin.

Credit & References
---------------------
[vimtweak](https://github.com/mattn/vimtweak)
[transparency-windows-vim](https://github.com/mattn/transparency-windows-vim)
[gVimWin32FullScreen](https://github.com/derekmcloughlin/gvimfullscreen_win32)

Installation
------------
Place `plugin/vimtweak.vim` in your vim runtime plugin directory.
Place `lib/vimtweak.dll` anywhere in your vim runtime directory.

Building vimtweak.dll
---------------------
The `src/vimtweak.c` file is configured to be built with Microsoft NMake via the `Makefile` file.

