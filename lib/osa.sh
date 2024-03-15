######################################################################
#<
#
# Function: p6_macosx_osa_iterm_color_default()
#
#>
######################################################################
p6_macosx_osa_iterm_color_default() {

    local black=$(p6_color_name_to_rgb "black")
    local white=$(p6_color_name_to_rgb "white")
    local opacity=$(p6_color_opacity_factor "opacity")

    p6_macosx_osa_iterm_color "localhost" "$white" "$black" "$opacity"
}

######################################################################
#<
#
# Function: p6_macosx_osa_iterm_color(host, fg, bg, alpha)
#
#  Args:
#	host -
#	fg -
#	bg -
#	alpha -
#
#  Environment:	 EOF
#>
######################################################################
p6_macosx_osa_iterm_color() {
    local host="$1"
    local fg="$2"
    local bg="$3"
    local alpha="$4"

    local fg_r=$(p6_color_hex_to_d16b "$fg" 'r')
    local fg_g=$(p6_color_hex_to_d16b "$fg" 'g')
    local fg_b=$(p6_color_hex_to_d16b "$fg" 'b')

    local bg_r=$(p6_color_hex_to_d16b "$bg" 'r')
    local bg_g=$(p6_color_hex_to_d16b "$bg" 'g')
    local bg_b=$(p6_color_hex_to_d16b "$bg" 'b')

    /usr/bin/osascript <<EOF
tell application "iTerm"
   tell current session of current window
      set name to "$host"
      set foreground color to {$fg_r, $fg_g, $fg_b, $alpha}
      set background color to {$bg_r, $bg_g, $bg_b, $alpha}
      set transparency to "$opacity"
   end tell
end tell
EOF
}

######################################################################
#<
#
# Function: p6_macosx_osa_iterm_color_run(host, code)
#
#  Args:
#	host -
#	code -
#
#>
######################################################################
p6_macosx_osa_iterm_color_run() {
    local host="$1"
    local code="$2"

    p6_macosx_osa_iterm_color_set "$mock_host"
    p6_run_code "$code"
    p6_macosx_osa_iterm_color_default

    p6_return_void
}

######################################################################
#<
#
# Function: p6_macosx_osa_iterm_color_set(host)
#
#  Args:
#	host -
#
#>
######################################################################
p6_macosx_osa_iterm_color_set() {
    local host="$1"

    local host_fg
    local host_bg
    local fg
    local bg
    local opacity

    host_fg=$(p6_macosx_osa_fg_for_host "$mock_host")
    host_bg=$(p6_macosx_osa_bg_for_host "$mock_host")
    fg=$(p6_color_name_to_rgb "$host_fg")
    bg=$(p6_color_name_to_rgb "$host_bg")
    opacity=$(p6_color_opacity_factor "opacity")

    p6_macosx_osa_iterm_color "$host" "$fg" "$bg" "$opacity"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_macosx_osa_bg_for_host(host)
#
#  Args:
#	host -
#
#  Environment:	 P6_DFZ_CONFIG_DIR
#>
######################################################################
p6_macosx_osa_bg_for_host() {
    local host="$1"

    p6_file_display $P6_DFZ_CONFIG_DIR/.p6hosts | awk -v k=$host 'tolower($1) ~ tolower(k) { print $2 }'
}

######################################################################
#<
#
# Function: p6_macosx_osa_fg_for_host(host)
#
#  Args:
#	host -
#
#  Environment:	 P6_DFZ_CONFIG_DIR
#>
######################################################################
p6_macosx_osa_fg_for_host() {
    local host="$1"

    p6_file_display $P6_DFZ_CONFIG_DIR/.p6hosts | awk -v k=$host 'tolower($1) ~ tolower(k) { print $3 }'
}
