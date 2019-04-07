# Load general Xresources settings.
xrdb -merge "${HOME}/.Xresources"

# Load urxvt settings.
# It is kind of ugly to do it here, but it seems to be the most convenient to
# put it here, since this file is sourced when X is starting, and no other files
# really do have that property.
xrdb -merge "${HOME}/.config/urxvt/settings"

# Load Xresources colorscheme. Affects e.g. polybar colors.
BASE16_COLORSCHEME=materia-256
xrdb -merge "${HOME}/.xcolors/base16/xresources/base16-${BASE16_COLORSCHEME}.Xresources"

# Sets the background image.
WALLPAPER="milky-way.jpg"
feh --bg-fill --no-fehbg "${HOME}/.wallpapers/${WALLPAPER}"

# Make sure the ~/.logs folder exists, so that we can log sxhkd command output to it.
LOGS_DIR="${HOME}/.logs"
if [ ! -e "${LOGS_DIR}" ]; then
    mkdir -p "${LOGS_DIR}/.logs"
fi
sxhkd -r "${LOGS_DIR}/sxhkd.log" &

# Finally, start the window manager.
exec bspwm
