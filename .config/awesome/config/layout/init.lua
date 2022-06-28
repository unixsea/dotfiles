-- Library
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

-- Layout
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.floating,
        awful.layout.suit.tile,
        awful.layout.suit.tile.left,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top,
--        awful.layout.suit.fair,
--        awful.layout.suit.fair.horizontal,
--        awful.layout.suit.spiral,
--        awful.layout.suit.spiral.dwindle,
--        awful.layout.suit.max,
--        awful.layout.suit.max.fullscreen,
--        awful.layout.suit.magnifier,
--        awful.layout.suit.corner.nw,
    })
end)
