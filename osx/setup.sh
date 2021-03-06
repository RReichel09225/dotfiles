# DO NOT EXECUTE THIS FILE DIRECTLY
# it is sourced from ../setup.sh

install_homebrew_casks () {
    info 'installing homebrew casks'
    brew tap phinze/cask
    brew install brew-cask
    # See https://github.com/sindresorhus/quick-look-plugins
    brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql suspicious-package

    # Install MacVim with lua support
    brew install macvim --with-cscope --with-lua --HEAD
    brew linkapps

    info 'homebrew casks installed'
}

install_vim_powerline_fonts () {
    info 'installing vim powerline fonts'

    overwrite_all=false
    backup_all=false
    skip_all=false

    sources=($DOTFILES_ROOT/osx/fonts/*)
    for source in "${sources[@]}"
    do
        dest="$HOME/Library/Fonts/`basename \"${source}\"`"

        if [ -f "$dest" ] || [ -d "$dest" ]
        then

            overwrite=false
            backup=false
            skip=false

            if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
            then
                user "File already exists: `basename \"$source\"`, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
                read -n 1 action

                case "$action" in
                    o )
                        overwrite=true;;
                    O )
                        overwrite_all=true;;
                    b )
                        backup=true;;
                    B )
                        backup_all=true;;
                    s )
                        skip=true;;
                    S )
                        skip_all=true;;
                    * )
                        ;;
                esac
            fi

            if [ "$overwrite" == "true" ] || [ "$overwrite_all" == "true" ]
            then
                rm -rf "$dest"
                success "removed $dest"
            fi

            if [ "$backup" == "true" ] || [ "$backup_all" == "true" ]
            then
                mv "$dest" "$dest"\.backup
                success "moved $dest to $dest.backup"
            fi

            if [ "$skip" == "false" ] && [ "$skip_all" == "false" ]
            then
                copy_file "$source" "$dest"
            else
                success "skipped $source"
            fi

        else
            copy_file "$source" "$dest"
        fi

    done
}

install_keyremap4macbook_config () {
    info 'installing KeyRemap4MacBook config'

    overwrite_all=false
    backup_all=false
    skip_all=false

    sources=($DOTFILES_ROOT/osx/keyremap4macbook/private.xml)
    for source in "${sources[@]}"
    do
        dest="$HOME/Library/Application Support/KeyRemap4MacBook/`basename \"${source}\"`"

        if [ -f "$dest" ] || [ -d "$dest" ]
        then

            overwrite=false
            backup=false
            skip=false

            if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
            then
                user "File already exists: `basename \"$source\"`, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
                read -n 1 action

                case "$action" in
                    o )
                        overwrite=true;;
                    O )
                        overwrite_all=true;;
                    b )
                        backup=true;;
                    B )
                        backup_all=true;;
                    s )
                        skip=true;;
                    S )
                        skip_all=true;;
                    * )
                        ;;
                esac
            fi

            if [ "$overwrite" == "true" ] || [ "$overwrite_all" == "true" ]
            then
                rm -rf "$dest"
                success "removed $dest"
            fi

            if [ "$backup" == "true" ] || [ "$backup_all" == "true" ]
            then
                mv "$dest" "$dest"\.backup
                success "moved $dest to $dest.backup"
            fi

            if [ "$skip" == "false" ] && [ "$skip_all" == "false" ]
            then
                link_files "$source" "$dest"
            else
                success "skipped $source"
            fi

        else
            link_files "$source" "$dest"
        fi

    done
}

compile_osa () {
    osacompile -o "$2" "$1"
    success "compiled applescript $1 to $2"
}

install_applescripts () {
    info 'installing applescripts'

    overwrite_all=false
    backup_all=false
    skip_all=false

    sources=($DOTFILES_ROOT/osx/applescripts/*.scpt)
    dest_dir="$HOME/Applications"
    mkdir -p "$dest_dir"
    for source in "${sources[@]}"
    do
        dest="$dest_dir/`basename \"${source%.*}\"`.app"

        if [ -f "$dest" ] || [ -d "$dest" ]
        then

            overwrite=false
            backup=false
            skip=false

            if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
            then
                user "File already exists: `basename \"$source\"`, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
                read -n 1 action

                case "$action" in
                    o )
                        overwrite=true;;
                    O )
                        overwrite_all=true;;
                    b )
                        backup=true;;
                    B )
                        backup_all=true;;
                    s )
                        skip=true;;
                    S )
                        skip_all=true;;
                    * )
                        ;;
                esac
            fi

            if [ "$overwrite" == "true" ] || [ "$overwrite_all" == "true" ]
            then
                rm -rf "$dest"
                success "removed $dest"
            fi

            if [ "$backup" == "true" ] || [ "$backup_all" == "true" ]
            then
                mv "$dest" "$dest"\.backup
                success "moved $dest to $dest.backup"
            fi

            if [ "$skip" == "false" ] && [ "$skip_all" == "false" ]
            then
                compile_osa "$source" "$dest"
            else
                success "skipped $source"
            fi

        else
            compile_osa "$source" "$dest"
        fi

    done
}

install_homebrew_casks
install_vim_powerline_fonts
install_keyremap4macbook_config
install_applescripts
