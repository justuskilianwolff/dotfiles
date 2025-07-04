-- Auto-mute MacBook speakers when switching to them

local lastOutputDeviceUID = nil

local function defaultOutputDeviceChanged()
    local device = hs.audiodevice.defaultOutputDevice()
    if not device then return end

    local deviceUID = device:uid()
    if deviceUID == lastOutputDeviceUID then return end

    local deviceName = device:name()
    local transportType = device:transportType()

    -- Check if it's MacBook speakers
    local isSpeaker = string.find(string.lower(deviceName), "speaker") or
        string.lower(tostring(transportType or "")) == "builtinspeaker"

    if isSpeaker then
        device:setMuted(true)
        print("Muted speakers:", deviceName)
    end

    lastOutputDeviceUID = deviceUID
end

hs.audiodevice.watcher.setCallback(defaultOutputDeviceChanged)
hs.audiodevice.watcher.start()

-- Initial check
defaultOutputDeviceChanged()
