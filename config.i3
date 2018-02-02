# i3 config file (v4)
#
# Please see http://i3wm.org/docs/userguide.html for a complete reference!

set $mod Mod1

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
# font pango:monospace 8

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
font pango:DejaVu Sans Mono 10

# Before i3 v4.8, we used to recommend this one as the default:
# font -misc-fixed-medium-r-normal--13-120-75-75-C-70-iso10646-1
# The font above is very space-efficient, that is, it looks good, sharp and
# clear in small sizes. However, its unicode glyph coverage is limited, the old
# X core fonts rendering does not support right-to-left and this being a bitmap
# font, it doesn’t scale on retina/hidpi displays.

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec i3-sensible-terminal

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
# bindsym $mod+d exec dmenu_run
# There also is the (new) i3-dmenu-desktop which only displays applications
# shipping a .desktop file. It is a wrapper around dmenu, so you need that
# installed.
# bindsym $mod+d exec --no-startup-id i3-dmenu-desktop

# Program launcher
# Start drun rofi
bindsym $mod+d exec rofi -modi drun -show drun -lines 3 -eh 2 -fullscreen -padding 200 -opacity "85" -bw 0 -bg "#132122" -fg "#1f7590" -font "System San Francisco Display 18"

# Start drun sudo rofi
bindsym $mod+Shift+d exec --no-startup-id "rofi -modi drun -show drun -lines 3 -eh 2 -fullscreen -padding 200 -opacity '85' -bw 0 -bg '#132122' -fg '#d63c36' -hlbg '#d63c36' -font 'System San Francisco Display 18' -run-command 'gksudo {cmd}'"

# Start run rofi
bindsym $mod+Control+d exec rofi -show run -lines 3 -eh 2 -fullscreen -padding 200 -opacity "85" -bw 0 -bg "#132122" -fg "#37d69c" -hlfg "#000000" -hlbg "#37d69c" -font "System San Francisco Display 18"

# Follow mouse
focus_follows_mouse no

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+o split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# switch to workspace
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace 1
bindsym $mod+Shift+2 move container to workspace 2
bindsym $mod+Shift+3 move container to workspace 3
bindsym $mod+Shift+4 move container to workspace 4
bindsym $mod+Shift+5 move container to workspace 5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+0 move container to workspace 10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym h resize shrink width 10 px or 10 ppt
        bindsym j resize grow height 10 px or 10 ppt
        bindsym k resize shrink height 10 px or 10 ppt
        bindsym l resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        status_command i3status
        tray_padding 3
        tray_output primary

        position top

        font pango:DejaVu Sans Mono 10

        colors {
                background #222222
                statusline #eeeeee
                separator  #666666
                #                  border  backgr. text
                focused_workspace  #4c7899 #35cc8a #000000
                active_workspace   #333333 #5f676a #ffffff
                inactive_workspace #333333 #222222 #888888
                urgent_workspace   #2f343a #900000 #ffffff
        }
}

# Color class           border  bg      text    indicator
client.focused          #1A1A1A #8C8587 #1A1A1A #8C8587
client.focused_inactive #1A1A1A #1A1A1A #1A1A1A #1A1A1A
client.unfocused        #1A1A1A #1A1A1A #77438F #1A1A1A
client.urgent           #3B89B5 #3B89B5 #a5a5a5 #1A1A1A
client.background       #1A1A1A

# Common apps
bindsym $mod+i exec --no-startup-id google-chrome
bindsym $mod+m exec --no-startup-id google-chrome https://mail.google.com/mail/
bindsym $mod+Shift+m exec --no-startup-id google-chrome https://outlook.office365.com/owa/?realm=eurotech.com&exsvurl=1&ll-cc=1040&modurl=0
bindsym $mod+n exec nautilus -w ~/Scrivania

# Powermode
set $power_mode "(p)oweroff, (r)eboot, (l)ock, (q)uit, (h)ibernate, (s)leep"
bindsym $mod+Escape      mode $power_mode
mode $power_mode {

        bindsym p        exec systemctl poweroff
        bindsym r        exec systemctl reboot
        bindsym l        exec "dm-tool lock", mode "default"
        bindsym q        exec --no-startup-id i3-msg exit, mode "default"
        bindsym h        exec systemctl hibernate, mode "default"
        bindsym s        exec systemctl suspend, mode "default"

        bindsym Return    mode "default"
        bindsym Escape    mode "default"
}

#Startup application
exec --no-startup-id dropbox start
exec --no-startup-id nm-applet
exec --no-startup-id numlockx on
exec --no-startup-id feh --bg-scale /home/mattia/Immagini/Wallpapers/DAE.png
