function rv -d "Start my test nvim (learning purpose)"
    # set -x XDG_CONFIG_HOME ~/.config/romka_nvim/config
    # set -x XDG_DATA_HOME ~/.config/romka_nvim/data
    # set -x XDG_CACHE_HOME ~/.config/romka_nvim/cache
    set XDG_CONFIG_HOME ~/.config/romka_nvim/config
    set XDG_DATA_HOME ~/.config/romka_nvim/data
    set XDG_CACHE_HOME ~/.config/romka_nvim/cache
    echo $XDG_CONFIG_HOME
    /usr/bin/nvim $argv
end
