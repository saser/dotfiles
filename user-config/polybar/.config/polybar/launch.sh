#!/bin/sh

# Kill all running instances of the polybar, if any.
killall --quiet polybar

# Wait until the polybar processes have been shut down.
while pgrep --euid ${UID} --exact polybar >/dev/null; do
    sleep 1
done

# Launch the bar.
polybar top
