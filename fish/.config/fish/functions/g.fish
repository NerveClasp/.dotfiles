function g --description 'git helper'
    switch $argv[1]
        case push
            git push
        case pushu
            git push -u origin (git branch --show-current)
        case pf
            git push origin +(git branch | grep \* | cut -d ' ' -f2)
        case soft
            if begin
                    test (count $argv) -gt 1
                end
                git reset --soft HEAD^$argv[2]
            else
                git reset --soft HEAD^1
            end
        case hard
            if begin
                    test (count $argv) -gt 1
                end
                git reset --hard HEAD^$argv[2]
            else
                git reset --hard HEAD^1
            end
        case stash
            if begin
                    test (count $argv) -gt 1
                end
                git stash save '$argv[2]'
            else
                git stash save 'temp'
            end
        case pop
            git stash pop
        case rebase
            #https://www.freecodecamp.org/news/git-cheat-sheet-and-best-practices-c6ce5321f52/
            if begin
                    test (count $argv) -gt 1
                end
                git rebase -i HEAD~$argv[2]
            else
                git rebase -i HEAD~1
            end
        # case com
        #     git commit -m $argv[2]
        case ch
            git checkout $argv[2]
        case s
            git status
        case a
            git add .
        case log
            git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
            # git log --pretty=oneline
            # git log --graph --decorate=short
            # git log --graph --decorate
    end
end
