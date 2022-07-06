#!/usr/bin/env bash

# Only exported variables can be used within the timer's command.
export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

export PATH=$PATH:/home/ANT.AMAZON.COM/fraber/.nix-profile/bin

# Run xidlehook
xidlehook \
  --socket $HOME/.xidlehook.socket \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Dim the screen after 5 minutes, undim if user becomes active` \
  --timer 540 \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness .1' \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
  `# Undim & lock after 5 more seconds` \
  --timer 5 \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1; i3lock -c 000000' \
    '' \
