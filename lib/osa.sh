# shellcheck shell=bash
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

    p6_return_void
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

    p6_return_void
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

    p6_macosx_osa_iterm_color_set "$host"
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

    local host_fg=$(p6_macosx_osa_fg_for_host "$host")
    local host_bg=$(p6_macosx_osa_bg_for_host "$host")
    local fg=$(p6_color_name_to_rgb "$host_fg")
    local bg=$(p6_color_name_to_rgb "$host_bg")
    local opacity=$(p6_color_opacity_factor "opacity")

    p6_macosx_osa_iterm_color "$host" "$fg" "$bg" "$opacity"

    p6_return_void
}

######################################################################
#<
#
# Function: str bg = p6_macosx_osa_bg_for_host(host)
#
#  Args:
#	host -
#
#  Returns:
#	str - bg
#
#  Environment:	 P6_DFZ_CONFIG_DIR
#>
######################################################################
p6_macosx_osa_bg_for_host() {
    local host="$1"

    # shellcheck disable=2086
    local bg=$(p6_file_display "$P6_DFZ_CONFIG_DIR/.p6hosts" | p6_filter_row_select_icase "^${host}[[:space:]]" | p6_filter_column_pluck 2)

    p6_return_str "$bg"
}

######################################################################
#<
#
# Function: str fg = p6_macosx_osa_fg_for_host(host)
#
#  Args:
#	host -
#
#  Returns:
#	str - fg
#
#  Environment:	 P6_DFZ_CONFIG_DIR
#>
######################################################################
p6_macosx_osa_fg_for_host() {
    local host="$1"

    # shellcheck disable=2086
    local fg=$(p6_file_display "$P6_DFZ_CONFIG_DIR/.p6hosts" | p6_filter_row_select_icase "^${host}[[:space:]]" | p6_filter_column_pluck 3)

    p6_return_str "$fg"
}
