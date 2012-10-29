" ===================================================================
"                     VimTweak Commands for VIM
" ===================================================================
" File:           plugin/vimtweak.vim
" Purpose:        ViM plugin wrapper for vimtweak.dll
" Author:         David Barsam
" URL:            https://github.com/dbarsam/vim-vimtweak
" ===================================================================
" Related:
" https://github.com/mattn/vimtweak
" https://github.com/mattn/transparency-windows-vim
" https://github.com/derekmcloughlin/gvimfullscreen_win32
" ===================================================================
if exists('g:loaded_vimtweak_plugin') || !has('gui_running') || !(has('win32') || has('win64'))
   finish 
endif 
let g:loaded_vimtweak_plugin = 1.00.00

" ============
" Disable Compatibility Options
" ============
let s:save_cpo = &cpo
set cpo&vim

" ============
" Plugin Data
" ============
if exists('g:vimtweak_dll')
    let s:dll = g:vimtweak_dll
else
    let s:prevslash = &shellslash
    set shellslash
    let s:dll = get( split(globpath(&rtp, "lib/vimtweak.dll"), '\n'), 0, '')
    let &shellslash = s:prevslash
    unlet s:prevslash
endif

if exists('g:vimtweak_focus_transparency_gained_value')
    let s:ftgv = 255 - g:vimtweak_focus_transparency_gained_value
else
    let s:ftgv = 255 
endif

if exists('g:vimtweak_focus_transparency_lost_value')
    let s:ftlv = 255 - g:vimtweak_focus_transparency_lost_value
else
    let s:ftlv = 255 - 50
endif

if exists('g:vimtweak_focus_transparency')
    let s:ft = g:vimtweak_focus_transparency
else
    let s:ft = 1
endif

if !filereadable(s:dll)
    echoerr 'VimTweak: "' . s:dll . '" is not readable.  VimTweak plugin is broken.'
endif

" ============
" Plugin Commands
" ============
com! -bar -nargs=1 TweakAlpha       call libcallnr(s:dll, "SetAlpha", <args>)
com! -bar -nargs=1 TweakMaximize    call libcallnr(s:dll, "EnableMaximize",<args>)
com! -bar -nargs=1 TweakTopMost     call libcallnr(s:dll, "EnableTopMost",<args>)
com! -bar -nargs=1 TweakCaption     call libcallnr(s:dll, "EnableCaption",<args>)
com! -bar -nargs=1 TweakFullScreen  call libcallnr(s:dll, "ToggleFullScreen",<args>)

" ============
" Plugin Autocommand Group
" ============
augroup VimTweakGroup
  autocmd!
  if s:ft
      autocmd FocusGained *  exe "TweakAlpha ".s:ftgv
      autocmd FocusLost   *  exe "TweakAlpha ".s:ftlv
  endif
augroup END

" ============
" Restore Compatibility Options
" ============
let &cpo = s:save_cpo

" ===================================================================
" End
" ===================================================================
