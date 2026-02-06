#!/bin/bash

if pgrep -x "hyprsunset" >/dev/null; then
  killall -9 hyprsunset
  notify-send "Night light" "Off" -u "low" -n avatar-default
else
  hyprsunset -t 4500 &>/dev/null &
  disown
  notify-send "Night light" "On" -u "low" -n avatar-default
fi
