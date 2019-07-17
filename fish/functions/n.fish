function n --description 'npm shorthand helper'
    switch $argv
        case b
            npm run build
        case s
            npm start
        case i
            npm ci
    end
end