local M = {}

-- Double right-click to Enter key mapping for Hammerspoon

local doubleClickTimer = nil
local doubleClickDelay = 0.3 -- Time window for double-click detection (in seconds)

-- Function to handle right mouse button events
local function handleRightClick()
    if doubleClickTimer then
        -- Second click detected within the time window - it's a double-click
        doubleClickTimer:stop()
        doubleClickTimer = nil

        -- Send Enter key
        hs.eventtap.keyStroke({}, "return")

        -- Optional: Show notification for debugging
        -- hs.alert.show("Double right-click detected!")

        return true -- Consume the event to prevent normal right-click menu
    else
        -- First click - start timer
        doubleClickTimer = hs.timer.doAfter(doubleClickDelay, function()
            doubleClickTimer = nil
            -- If we get here, it was a single click, so we let it through normally
        end)

        return false -- Don't consume the event, allow normal right-click behavior
    end
end

-- Declare rightClickTap at module level so it can be accessed by start() and stop()
local rightClickTap = nil

-- Add start function to the module
M.start = function()
    -- Create event tap for right mouse button down events
    rightClickTap = hs.eventtap.new({ hs.eventtap.event.types.rightMouseDown }, function(event)
        return handleRightClick()
    end)

    -- Check if event tap was created successfully
    if rightClickTap then
        -- Start the event tap
        local success = rightClickTap:start()
        if success then
            print("Double right-click event tap started successfully")
        else
            print("Failed to start event tap - check accessibility permissions")
            hs.alert.show("Failed to start event tap - check accessibility permissions")
        end
    else
        print("Failed to create event tap")
        hs.alert.show("Failed to create event tap")
    end
end


return M
