function night --description 'pre-spleep shutdown'
    if begin
        test (count $argv) -gt 0
    end
    shutdown -h 60*$argv[1]
else
    shutdown -h 120
end

