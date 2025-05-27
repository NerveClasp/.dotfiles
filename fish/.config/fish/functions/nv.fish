function nv -d "Start default NeoVim"
  set -e XDG_CONFIG_HOME
  set -e XDG_DATA_HOME
  set -e XDG_CACHE_HOME
  nvim $argv
end
