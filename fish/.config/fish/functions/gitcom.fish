function gitcom --description 'pass a string as a commit message'
#  set branch_name git branch --show-current
#  set task_number git branch --show-current | grep -o '\(SB-\d\+,\?\)\+'
#  set task_kind "(git branch --show-current | cut -d'/' -f1)"
#  echo $task_kind
  #echo ($task_kind)'('($task_number)'):' $argv
  git commit -S -m $argv
end
