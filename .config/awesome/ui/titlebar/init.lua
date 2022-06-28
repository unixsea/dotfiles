--Library
local awful = require "awful"
local wibox = require "wibox"

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
  -- buttons for the titlebar
  local buttons = {
    awful.button({}, 1, function()
      c:activate { context = "titlebar", action = "mouse_move" }
    end),
    awful.button({ "Shift" }, 1, function()
      c:activate { context = "titlebar", action = "mouse_resize" }
    end),
    awful.button({}, 3, function()
      c:activate { context = "titlebar", action = "mouse_resize" }
    end),
  }

  awful.titlebar(c, {
    size = 37.5,
    position = "left",
  }):setup {
    {
      layout = wibox.layout.fixed.vertical,
      spacing = 13,
    },
    widget = wibox.container.margin,
    top = 20,
    left = 13,
    right = 13,
  }
end)

