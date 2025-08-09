
#
def find_max_battery(string_input):
    percent_end_idx = string_input.find('%') #finds the index of the percent; -2 to get the full substring
    percent_start_idx = percent_end_idx - 2
    battery_percent = string_input[percent_start_idx:percent_end_idx]
    return battery_percent

