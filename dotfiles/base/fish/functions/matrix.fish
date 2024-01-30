function matrix --description 'let it matrix'
    env LC_ALL=C tr -c "[:digit:]" " " </dev/urandom | dd cbs=$COLUMNS conv=unblock | env GREP_COLOR="1;32" grep --color "[^ ]"
end