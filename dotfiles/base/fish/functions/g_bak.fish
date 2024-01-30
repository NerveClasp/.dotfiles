function g --description 'git helper'
    switch $argv[1]
        case push
            git push
        case pushu
            git push -u origin (git branch --show-current)
            #git push -u
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
        case pf
            git push origin +(git branch | grep \* | cut -d ' ' -f2)
        case rebase
            #https://www.freecodecamp.org/news/git-cheat-sheet-and-best-practices-c6ce5321f52/
            if begin
                    test (count $argv) -gt 1
                end
                git rebase -i HEAD~$argv[2]
            else
                git rebase -i HEAD~1
            end
        # case pull
        #     if begin
        #             test (count $argv) -gt 1
        #         end
        #         git pull origin $argv[2]
        #     else
        #         set original_branch (git show-branch | grep '*' | grep -v (git rev-parse --abbrev-ref HEAD) | head -n1 | sed 's/.*\\[\\(.*\\)\\].*/\\1/' | sed 's/[\\^~].*//' #)
        #         git pull origin $original_branch
        #     end
        case com
            git commit -m $argv[2]
        case ch
            git checkout $argv[2]
        case s
            git status
        case a
            git add .
        case log
            git log --graph --decorate
        case clean-merged
            set original_branch (git show-branch | grep '*' | grep -v (git rev-parse --abbrev-ref HEAD) | head -n1 | sed 's/.*\\[\\(.*\\)\\].*/\\1/' | sed 's/[\\^~].*//' #)
            git branch --merged $original_branch | grep -v '^[ *]*$original_branch$' | xargs git branch -d
            git remote prune origin
        end
    end
end
end
