#!/bin/bash

wid=$(wmctrl -l | grep "ROG" | cut -d ' ' -f1)
echo "$wid"
if [[ -z "$wid" ]]; then
  rog-control-center;
else
  wmctrl -i -c "$wid"
fi

