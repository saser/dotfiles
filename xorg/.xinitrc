# Load urxvt settings.
# It is kind of ugly to do it here, but it seems to be the most convenient to
# put it here, since this file is sourced when X is starting, and no other files
# really do have that property.
xrdb -merge "${HOME}"/.config/urxvt/settings

sxhkd &
exec bspwm
