"===============================================================================
" DESCRIPTION:   Yank in visual mode will now do three things
"                1) Default yank behaviour
"                2) Yank selection to "p register
"                3) Yank selection to system clipboard
" EXAMPLE USAGE: Use `y` in visual mode as usual. If the default " register is
"                overwritten you can still access the selection in the p register
"                easily with the shortcut <Leader>p
"===============================================================================
function! EnhancedYank() range
    normal! ""gvy
    let selection = getreg('"')
    let @p = selection
    let @+ = selection
endfunction

"===============================================================================
" Function Keymappings
"===============================================================================
xnoremap y :call EnhancedYank()<CR>
xnoremap <Leader>p "pp
nnoremap <Leader>p "pp

"===============================================================================
" Unite Keymap Menu Item(s)
"===============================================================================
let g:unite_source_menu_menus.CustomKeyMaps.command_candidates += [['➤ Paste from the p buffer                                        <Leader>p', '"pp']]
