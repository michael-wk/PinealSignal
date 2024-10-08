-- f signifies function event

local f = {}
f.__index = f

function f.new(key: string, bindable:  boolean)
    local func = {Key = key, 
        Callbacks = {},
        MiddwareIn = nil,
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
        instance = Instance.new("BindableFunction")
    else
        instance = Instance.new("RemoteFunction")        
    end

    func.Instance = instance

    return setmetatable(func, f)
end

return f