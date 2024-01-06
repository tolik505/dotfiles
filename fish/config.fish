if status is-interactive
    # Abbreviation
    abbr -a bi brew install
    abbr -a bu brew uninstall
    abbr -a vi nvim .
    abbr -a d lazydocker
    abbr -a prt lsof -i tcp:
    abbr -a ze zellij
    abbr -a zes zellij -s
    abbr -a zel zellij ls
    abbr -a zea zellij attach
    abbr -a zek zellij kill-session
    abbr -a zeka zellij kill-all-sessions
    abbr -a zed zellij delete-session
    abbr -a zeda zellij delete-all-sessions
    abbr -a zee zellij -l editor -s

    ## Env Vars
    # Emulates vim's cursor shape behavior
    set fish_vi_force_cursor
    # Set the normal and visual mode cursors to a block
    set fish_cursor_default block
    # Set the insert mode cursor to a line
    set fish_cursor_insert line
    # Set the replace mode cursor to an underscore
    set fish_cursor_replace_one underscore
    # Set the visual mode cursor to a blinking block
    set fish_cursor_visual block blink
end
