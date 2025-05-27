function pretty --description 'uses prettier over a list of files'
  for arg in $argv
    prettier --single-quote --trailing-comma=all --write $arg
  end
end