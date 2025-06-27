--- Double Right-Click Interceptor Module
--- Intercepts double right-clicks and converts them to Return key presses
--- Single right-clicks are passed through normally after a delay
local M = {}

local tap = nil   -- Event tap for intercepting right mouse clicks
local timer = nil -- Timer for detecting double-click timing
local delay = 0.3 -- Double-click detection window in seconds

--- Handles right-click events and detects double-clicks
--- @param event table The mouse event
--- @return boolean true to suppress the original event
local function handleRightClick(event)
    if timer then
        timer:stop()
        timer = nil
        hs.eventtap.keyStroke({}, "return")
        return true
    end

    local location = hs.mouse.absolutePosition()
    timer = hs.timer.doAfter(delay, function()
        timer = nil
        if tap then tap:stop() end
        hs.eventtap.rightClick(location)
        hs.timer.doAfter(delay * 0.033, function() if tap then tap:start() end end)
    end)
    return true
end

--- Starts the double right-click interceptor
--- Creates and starts an event tap to monitor right mouse button events
--- Requires accessibility permissions to function properly
function M.start()
    tap = hs.eventtap.new({ hs.eventtap.event.types.rightMouseDown }, handleRightClick)
    if tap and tap:start() then
        print("Double right-click interceptor started")
    else
        hs.alert.show("Failed to start - check accessibility permissions")
    end
end

--- Stops the double right-click interceptor
--- Cleans up the event tap, timer, and all associated resources
function M.stop()
    if tap then
        tap:stop()
        tap = nil
    end
    if timer then
        timer:stop()
        timer = nil
    end
    print("Double right-click interceptor stopped")
end

return M
