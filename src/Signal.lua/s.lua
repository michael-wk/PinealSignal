-- s signifies signal and is an individual signal object containing all callbacks etc

local s = {}
s.__index = s

function s.new(key: string, bindable: boolean)
    local signal = {
        Key = key,
        MiddlewareIn = nil,
        MiddlewareOut = nil,
    }

    local instance
    if bindable then
        instance = Instance.new("BindableEvent")        
    else
        instance = Instance.new("RemoteEvent")
    end

    signal.Instance = instance
    return setmetatable(signal, s)
end

return s