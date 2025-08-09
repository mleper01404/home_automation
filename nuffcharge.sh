#!/bin/bash

max_batt="$(acpi -i | grep 'full capacity')"
battery_percent=$(python3 -c "import sys; from nuffcharge_parse import find_max_battery; print(find_max_battery(sys.stdin.read()))" <<< $max_batt)
optimum_batt=$(($battery_percent - 10)) #max battery - 10 percent

acpi_batt="$(acpi -b| grep remaining)"
current_battery=$(python3 -c "import sys; from nuffcharge_parse import find_max_battery; print(find_max_battery(sys.stdin.read()))" <<< $acpi_batt)

echo "optimum battery: $optimum_batt"
#alert user if current batt is greater than max batt
if [ $(($current_battery)) -eq $optimum_batt ]; then
    echo "Your optimum battery is $optimum_batt Optimum charge achieved at $current_battery. Uplug laptop now."
elif [ $(($current_battery)) -gt $optimum_batt ]; then
    echo "Stop charging the laptop and unplug immediately. You will end up frying your battery"
fi
