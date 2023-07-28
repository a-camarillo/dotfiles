# Script to be called by .config/sway/config to set up status bar

date=$(date +'%Y-%m-%d %l:%M:%S %p')

battery=$(cat /sys/class/power_supply/BAT0/capacity)

echo $battery% $date
