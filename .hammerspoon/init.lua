local hyper = {"ctrl", "alt", "cmd","shift"}
local log = hs.logger.new('hspoon','debug')
local spotlightSearchEnabled = hs.application.enableSpotlightForNameSearches(true)
hs.window.animationDuration = 0

-- hyper+v shows window hints --
hs.hotkey.bind(hyper, "v", function()
    hs.hints.windowHints()
end)

-- hyper+r reloads hammerspoon config --
hs.hotkey.bind(hyper, "r", function()
    hs.reload()
end)
hs.alert.show("Config reloaded")

-- window management
hs.loadSpoon("MiroWindowsManager")
spoon.MiroWindowsManager:bindHotkeys({
    left = {hyper, "h"},
    down = {hyper, "j"},
    up = {hyper, "k"},
    right = {hyper, "l"},
    fullscreen = {hyper, "f"}
})  

-- hyper+return centers focused window on screen --
hs.hotkey.bind(hyper, "return", function()
    local win = hs.window.focusedWindow()
    win:centerOnScreen()
end)

-- hyper+` throws focused window to next screen --
hs.hotkey.bind(hyper, "`", function()
    screen_count = #hs.screen.allScreens()
    if screen_count > 1 then
        local win = hs.window.focusedWindow()
        local screen = win:screen():next()
        cell = hs.grid.get(win, screen)
        win:moveToScreen(screen)
    else
        -- If we only have a single screen we just center window
        local win = hs.window.focusedWindow()
        win:centerOnScreen()
    end
end)