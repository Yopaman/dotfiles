--[[

     Powerarrow Dark Awesome WM theme
     github.com/lcpz

--]]


local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")
local dpi   = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/theme"
theme.wallpaper                                 = os.getenv("HOME") .. "/.config/wallpaper/wallpaper.jpg"
theme.font                                      = "Roboto 14"
theme.icon_font                                 = "Roboto 17"
theme.icon_font_small                           = "Roboto 27"
theme.fg_normal                                 = "#CDD6f4"
theme.fg_focus                                  = "#CDD6f4"
theme.fg_urgent                                 = "#f2CDCD"
theme.bg_normal                                 = "#1E1E2E"
theme.bg_focus                                  = "#313244"
theme.bg_urgent                                 = "#F38BA8"
theme.border_width                              = dpi(5)
theme.border_normal                             = "#8E95B3"
theme.border_focus                              = "#CBA6F7"
theme.border_marked                             = "#EBA0AC"
theme.tasklist_bg_focus                         = theme.bg_focus
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal .. "cc"
theme.titlebar_bg_focus                         = theme.bg_normal .. "cc"
theme.titlebar_fg_focus                         = theme.fg_focus
theme.notification_bg                           = theme.bg_normal .. "cc"
theme.notification_fg                           = theme.fg_normal
theme.notification_opacity                      = 0.8
theme.notification_margin                       = 10
theme.notification_shape                        = gears.shape.rounded_rect
theme.menu_height                               = dpi(30)
theme.menu_width                                = dpi(200)
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.menu_icon                                 = ""
theme.taglist_bg_focus                          = theme.bg_normal
theme.taglist_fg_focus                          = theme.fg_focus
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_ac                                 = ""
theme.widget_battery                            = ""
theme.widget_battery_low                        = "" 
theme.widget_battery_empty                      = ""
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = "直"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note_on.png"
theme.widget_vol                                = "墳"
theme.widget_vol_low                            = "奔"
theme.widget_vol_no                             = "奄"
theme.widget_vol_mute                           = "婢"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = dpi(5)
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

local markup = lain.util.markup
local separators = lain.util.separators

local keyboardlayout = awful.widget.keyboardlayout:new()

-- Textclock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.watch(
    "date +'%a %d %b %R'", 60,
    function(widget, stdout)
        widget:set_markup(" " .. markup.font(theme.font, stdout))
    end
)

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { clock },
    notification_preset = {
        font = "Terminus 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. mem_now.used .. "MB "))
    end
})

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. cpu_now.usage .. "% "))
    end
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
    end
})

-- / fs
local fsicon = wibox.widget.imagebox(theme.widget_hdd)
--[[ commented because it needs Gio/Glib >= 2.54
theme.fs = lain.widget.fs({
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "Terminus 10" },
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. fs_now["/"].percentage .. "% "))
    end
})
--]]

-- Battery
local baticon = wibox.widget.textbox(theme.widget_battery)
baticon.font = theme.icon_font
local bat = lain.widget.bat({
    settings = function()
        if bat_now.status and bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                baticon.text = theme.widget_ac
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
                baticon.text = theme.widget_battery_empty
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
                baticon.text = theme.widget_battery_low
            else
                baticon.text = theme.widget_battery
            end
            widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
        else
            widget:set_markup(markup.font(theme.font, " AC "))
            baticon.text = theme.widget_ac
        end
    end
})

-- ALSA volume
local volicon = wibox.widget.textbox(theme.widget_vol)
volicon.font = theme.icon_font_small
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volicon.text = theme.widget_vol_mute
        elseif tonumber(volume_now.level) == 0 then
            volicon.text = theme.widget_vol_no
        elseif tonumber(volume_now.level) <= 50 then
            volicon.text = theme.widget_vol_low
        else
            volicon.text = theme.widget_vol
        end

        widget:set_markup(markup.font(theme.font, " " .. volume_now.level .. "% "))
    end
})
theme.volume.widget:buttons(awful.util.table.join(
                               awful.button({}, 4, function ()
                                     awful.util.spawn("amixer set Master 1%+")
                                     theme.volume.update()
                               end),
                               awful.button({}, 5, function ()
                                     awful.util.spawn("amixer set Master 1%-")
                                     theme.volume.update()
                               end)
))

-- Net
local neticon = wibox.widget.textbox(theme.widget_net)
neticon.font = theme.icon_font_small
local net = lain.widget.net({
    settings = function()
        widget:set_markup(markup.font(theme.font,
                          markup("#a6d189", " " .. string.format("%06.1f", net_now.received))
                          .. " " ..
                          markup("#85c1dc", " " .. string.format("%06.1f", net_now.sent) .. " ")))
    end
})

-- Separators
local spr     = wibox.widget.textbox(' ')
local arrl_dl = separators.arrow_left(theme.bg_focus, "alpha")
local arrl_ld = separators.arrow_left("alpha", theme.bg_focus)

-- Menu box
local menubutton = wibox.widget.textbox(theme.menu_icon)
menubutton.font = theme.icon_font_small
local menubox = wibox.container.margin(menubutton, 7,7)
menubutton:connect_signal("button::press", function()
  awful.util.mymainmenu:show()
end)

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        layout  = wibox.layout.fixed.horizontal,
        style = {
            fg_focus = "#ef9f76"
        },
        widget_template = {
            {
                {
                    id = 'txt_role', 
                    font = "Fira Code 20",
                    widget = wibox.widget.textbox
                },
                id = 'margin_role',
                top = dpi(7),
                bottom = dpi(7),
                left = dpi(8),
                right = dpi(8),
                widget = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background,
            create_callback = function(self, t, index, objects)
                if t.selected then
                    self:get_children_by_id("txt_role")[1].text = ""
                elseif #t:clients() == 0 then
                    self:get_children_by_id("txt_role")[1].text = ""
                else
                    self:get_children_by_id("txt_role")[1].text = ""
                end 
            end,
            update_callback = function(self, t, index, objects)
                if t.selected then
                    self:get_children_by_id("txt_role")[1].text = ""
                elseif #t:clients() == 0 then
                    self:get_children_by_id("txt_role")[1].text = ""
                else
                    self:get_children_by_id("txt_role")[1].text = ""
                end
            end
        },
        buttons = awful.util.taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter   = awful.widget.tasklist.filter.allscreen,
        style    = {
            shape = gears.shape.rounded_rect,
        },
        widget_template = {
            {
                {
                    id     = 'clienticon',
                    widget = awful.widget.clienticon,
                },
                margins = dpi(4),
                widget  = wibox.container.margin,
            },
            id              = 'background_role',
            widget          = wibox.container.background,
            create_callback = function(self, c, index, objects) --luacheck: no unused
                self:get_children_by_id('clienticon')[1].client = c
            end,
        },
        buttons  = awful.util.tasklist_buttons,
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(40), bg = theme.bg_normal, fg = theme.fg_normal, opacity = 0.8 })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.container.background(menubox, theme.bg_focus, gears.shape.rounded_rect),
            s.mytaglist,
            s.mypromptbox,
            s.mytasklist,
            spr,
        },
        spr, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            spr,
            volicon,
            theme.volume.widget,
            spr,
            baticon,
            bat.widget,
            spr,
            neticon,
            net.widget,
            spr,
            clock,
            spr,
            wibox.container.background(s.mylayoutbox),
        },
    }
end

return theme
