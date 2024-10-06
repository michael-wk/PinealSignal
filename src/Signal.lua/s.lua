-- s signifies signal and is an individual signal object containing all callbacks etc

local Types = require(script.Parent.t)

local s = {}
s.__index = s

export type SignalType = {
    
}

function s.new(key: string, bindable: boolean)
    local signal = {
        Key = key,
        MiddlewareIn = nil,
        MiddlewareOut = nil,

        config = {
            QUEUE_PERIOD = nil,
            DEBUG_PRINTS = nil,
            MIDDLEWARE_IN = nil,
            MIDDLEWARE_OUT = nil
        }
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


function s:Fire()
    

    -- config check:


    --- for example:
    
    -- Fire()
    -- MiddlewareOut()
    -- *Fire event
    -- *Event recieved

    -- ** FOR EACH CALLBACK V
    -- MiddlewareIn()
    -- Callback

end

function s:SetConfiguration(configuration: Types.SignalConfig)

    --#TODO: Type affirmation

    for key, value in configuration do
        self.config[key] = value
    end

end

return s