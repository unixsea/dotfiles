
-- Library
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local helpers = require("helpers")

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Text clock 
local time = wibox.widget {
  widget = wibox.container.background,
  bg = beautiful.bg_normal,
  buttons = {
    awful.button({}, 1, function()
      require"ui.popup.calender"()
    end),
  },
  {
    widget = wibox.container.margin,
    margins = 10,
    {
      widget = wibox.widget.textclock "%H:%M",
      font = beautiful.font_name .. " Bold 11",
      align = "center",
    },
  },
}

helpers.add_hover_cursor(time, "hand1")

local action_icon = require("ui.gooey").make_button {
  icon = "bell2",
  bg = beautiful.background,
  fg = beautiful.white,
  width = 34,
  margins = 6.9,
  hover = true,
  exec = function()
     F.action.toggle()
  end,
}

helpers.add_hover_cursor(action_icon, "hand1")
screen.connect_signal("request::desktop_decoration", function(s)
    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox {
        screen  = s,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc(-1) end),
            awful.button({ }, 5, function () awful.layout.inc( 1) end),
        }
    }

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = {
            awful.button({ }, 1, function(t) t:view_only() end),
            awful.button({ modkey }, 1, function(t)
                                            if client.focus then
                                                client.focus:move_to_tag(t)
                                            end
                                        end),
            awful.button({ }, 3, awful.tag.viewtoggle),
            awful.button({ modkey }, 3, function(t)
                                            if client.focus then
                                                client.focus:toggle_tag(t)
                                            end
                                        end),
            awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
            awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
        }
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = {
            awful.button({ }, 1, function (c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end),
            awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
            awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
            awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
        }
    }


    s.mywibar = awful.wibar({
		type = "dock",
		ontop = true,
		stretch = false,
		visible = true,
		height = dpi(39),
		width = s.geometry.width - dpi(0),
	--	shape = helpers.rrect(beautiful.border_radius),
		screen = s,
	})


	--awful.placement.top(s.mywibar, { margins = beautiful.useless_gap * 1 })

	s.mywibar:struts({
		top = dpi(40),
	})


	-- Remove wibar on full screen
	local function remove_wibar(c)
		if c.fullscreen or c.maximized then
			c.screen.mywibar.visible = false
		else
			c.screen.mywibar.visible = true
		end
	end

	-- Remove wibar on full screen
	local function add_wibar(c)
		if c.fullscreen or c.maximized then
			c.screen.mywibar.visible = true
		end
	end

	-- Hide bar when a splash widget is visible
	awesome.connect_signal("widgets::splash::visibility", function(vis)
		screen.primary.mywibar.visible = not vis
	end)

	client.connect_signal("property::fullscreen", remove_wibar)

	client.connect_signal("request::unmanage", add_wibar)



    -- Create the wibox
    s.mywibar:setup({
		{
			{
				layout = wibox.layout.align.horizontal,
				expand = "none",
				{
					
					s.mytaglist,
					margins = dpi(9),
                                        widget = wibox.container.margin,
				},
				time,
				{
					{
						margins = dpi(9.7),
						widget = wibox.container.margin,
					},
					action_icon,
					layout = wibox.layout.fixed.horizontal,
				},
			},
			left = dpi(15),
			right = dpi(15),
			widget = wibox.container.margin,
		},
		shape = helpers.rrect(beautiful.border_radius),
		widget = wibox.container.background,
	})
end)
