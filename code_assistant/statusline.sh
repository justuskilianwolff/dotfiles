#!/bin/bash
input=$(cat)

model=$(echo "$input" | jq --raw-output '.model.display_name')
used=$(echo "$input" | jq --raw-output '.context_window.used_percentage // empty')

printf '\033[01;36m%s\033[00m' "$model"

if [ -n "$used" ]; then
  used_int=$(printf "%.0f" "$used")
  if [ "$used_int" -lt 50 ]; then
    color='\033[01;32m'  # green
  elif [ "$used_int" -lt 75 ]; then
    color='\033[01;33m'  # yellow
  else
    color='\033[01;31m'  # red
  fi
  printf " | ${color}%d%%\033[00m" "$used_int"
fi
printf '\n'
