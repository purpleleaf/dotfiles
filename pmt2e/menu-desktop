#!/bin/sh

config_file=$(mktemp)
menu_file=$(mktemp)
trap "rm -f ${config_file} ${menu_file}" EXIT

cat <<'EOF' >${config_file}
stay_alive          = 0
tint2_look          = 1
position_mode		= ipc
menu_width          = 40
menu_border         = 0
item_height         = 20
font                = Sans 10
icon_size           = 0
color_norm_fg       = #eeeeee 100
color_sel_fg        = #eeeeee 100
EOF

cat <<'EOF' >${menu_file}
desktop 1, pmt2e --desktop 1
desktop 2, pmt2e --desktop 2
desktop 3, pmt2e --desktop 3
desktop 4, pmt2e --desktop 4
EOF

jgmenu --config-file=${config_file} --csv-file=${menu_file}
