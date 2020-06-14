function backlight --description 'set backlight brightness'
    if begin
            test (count $argv) -gt 0
        end
        echo $argv[1] > /sys/class/backlight/intel_backlight/brightness
    else
        echo 3 > /sys/class/backlight/intel_backlight/brightness
    end
end