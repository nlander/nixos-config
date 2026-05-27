---@module 'hl'


hl.bind("SUPER" .. " + " .. "T", hl.dsp.exec_cmd("kitty"))

hl.bind("SUPER" .. " + " .. "F", hl.dsp.exec_cmd("firefox"))

hl.bind("SUPER" .. " + " .. "V", hl.dsp.exec_cmd("gimp"))

hl.bind("ALT" .. " + " .. "TAB", hl.dsp.window.cycle_next())

hl.bind("ALT" .. " + " .. "SPACE", hl.dsp.window.fullscreen())

hl.bind("ALT" .. " + " .. "L", hl.dsp.focus({ direction = "right" }))

hl.bind("ALT" .. " + " .. "H", hl.dsp.focus({ direction = "left" }))

hl.bind("ALT + CONTROL" .. " + " .. "L", hl.dsp.window.move({ direction = "right" }))

hl.bind("ALT + CONTROL" .. " + " .. "H", hl.dsp.window.move({ direction = "left" }))

hl.bind("ALT + SHIFT" .. " + " .. "L", hl.dsp.window.move({ direction = "right" }, { follow = false }))

hl.bind("ALT + SHIFT" .. " + " .. "H", hl.dsp.window.move({ direction = "left" }, { follow = false }))

hl.monitor({
    output   = "HDMI-A-2",
    mode     = "1366x768@59.79",
    position = "0x0",
    scale    = 1,
})

hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@60.02",
    position = "1366x0",
    scale    = 1.5,
})

hl.window_rule({
    name  = "Firefox Extension",
    match = {
        class = "^(firefox)$",
        title = "^(Extension:)(.*)$",
    },
    float = true,
    stay_focused = true,
    border_size = 0,
})

hl.window_rule({
    name  = "Firefox Unnamed",
    match = {
        class = "^(firefox)$",
        title = "^$",
    },
    float = true,
    border_size = 0,
})
