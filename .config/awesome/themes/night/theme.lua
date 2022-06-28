---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local gears = require("gears")
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.background = "#061115"
theme.foreground = "#D9D7D6"
theme.black      = "#1C252C"
theme.red        = "#DF5B61"
theme.green      = "#78B892"
theme.yellow     = "#DE8F78"
theme.blue       = "#6791C9"
theme.magenta    = "#BC83E3"
theme.cyan       = "#67AFC1"
theme.white      = "#D9D7D6"
theme.blacks     = "#484E5B"
theme.reds       = "#F16269"
theme.greens     = "#8CD7AA"
theme.yellows    = "#E9967E"
theme.blues      = "#79AAEB"
theme.magentas   = "#C488EC"
theme.cyans      = "#7ACFE4"
theme.whites     = "#E5E5E5"
theme.darker_bg = "#0A1419"
theme.lighter_bg = "#162026"
theme.transparent = "#00000000"

theme.font          = "Proxima Nova Bold 11"
theme.font_name     = "Proxima Nova "
theme.icon_font     = "Material Icons "
theme.icon_font2     = "Feather "

theme.bg_normal     = "#061115"
theme.bg_subtle     = "#0a171c"
theme.bg_focus      = "#1C252C"
theme.bg_cal        = "#78B892"
theme.bg_urgent     = "#DF5B61"
theme.bg_minimize   = "#484e5b"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#D9D7D6"
theme.fg_focus      = "#D9D7D6"
theme.fg_urgent     = "#D9D7D6"
theme.fg_minimize   = "#D9D7D6"

theme.useless_gap         = dpi(8)
theme.border_width        = dpi(0)
theme.border_color_normal = "#000000"
theme.border_color_active = "#535d6c"
theme.border_color_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

theme.titlebar_bg_focus  = theme.bg_subtle
theme.titlebar_bg_normal = theme.bg_normal

theme.taglist_fg_focus      = "#78B892"
theme.taglist_bg_focus      = "#061115"
theme.taglist_fg_occupied   = "#d9d7d6"   

-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]


-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.notification_icon = gears.surface.load_uncached(gfs.get_configuration_dir() .. "themes/night/hello.jpg")
theme.titlebar_close_button_normal = gears.surface.load_uncached(gfs.get_configuration_dir() .. "theme/night/close.svg")
theme.titlebar_close_button_focus  = gears.surface.load_uncached(gfs.get_configuration_dir() .. "themes/night/close.svg")

theme.titlebar_minimize_button_normal = gears.surface.load_uncached(gfs.get_configuration_dir() .. "themes/night/minimize.svg")
theme.titlebar_minimize_button_focus  = gears.surface.load_uncached(gfs.get_configuration_dir() .. "themes/night/minimize.svg")

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = gears.surface.load_uncached(gfs.get_configuration_dir() .. "themes/night/maximized.svg")
theme.titlebar_maximized_button_focus_inactive  = gears.surface.load_uncached(gfs.get_configuration_dir() .. "themes/night/maximized.svg")
theme.titlebar_maximized_button_normal_active = gears.surface.load_uncached(gfs.get_configuration_dir() .. "themes/night/maximized.svg")
theme.titlebar_maximized_button_focus_active  = gears.surface.load_uncached(gfs.get_configuration_dir() .. "themes/night/maximized.svg")

theme.wallpaper = gears.surface.load_uncached(gfs.get_configuration_dir() .. "themes/night/ww.jpg")

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' }
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
