# Load urxvt settings.
# It is kind of ugly to do it here, but it seems to be the most convenient to
# put it here, since this file is sourced when X is starting, and no other files
# really do have that property.
xrdb -merge "${HOME}/.config/urxvt/settings"

# Load Xresources colorscheme. Affects e.g. urxvt colors.
BASE16_COLORSCHEME=base16-materia
xrdb -merge "${HOME}/.config/urxvt/colors/base16/xresources/${BASE16_COLORSCHEME}.Xresources"

sxhkd &
exec bspwm
