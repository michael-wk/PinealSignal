local RunService = game:GetService("RunService")

local SignalObject = require(script.s)
local FunctionObject = require(script.f)
local Types = require(script.t)
local Configuration = require(script.configuration)



--[[#TODO:

- The Signal.Signals structure is redundant if it's just going to be using Keys with unique keys

- Remove this structure, have keys and just have it index there casual cool, have a reference to the
 1- signal object
 2- Instance 

]]

local Signal = {}

Signal.data = {
    Initialized = false
}

Signal.Keys = {}

Signal.Signals = {
    Server = {
        be = {},
        bf = {}
    },
    Client = {
        be = {},
        bf = {}
    },
    Shared = {
        re = {},
        rf = {}
    }
}

function Signal:Init()

    if RunService:IsServer() then -- server context

        self:_createDirectory()
        self:_createServerDirectory()

    end
end

function Signal:_createDirectory()
    
    local _serverRoot = Instance.new("Folder")
    _serverRoot.Name = "Signal"

    local _root = Instance.new("Folder")
    _root.Name = "Signal"

    -- server
    local _serverBE = Instance.new("Folder")
    _serverBE.Name = "be"

    local _serverBF = Instance.new("Folder")
    _serverBF.Name = "bf"


    -- shared
    local _shared = Instance.new("Folder")
    _shared.Name = "Shared"

    local _sharedRF = Instance.new("Folder")
    _sharedRF.Name = "rf"

    local _sharedRE = Instance.new("Folder")
    _sharedRE.Name = "re"

    -- client
    local _client = Instance.new("Folder")
    _client.Name = "Client"

    local _clientBE = Instance.new("Folder")
    _clientBE.Name = "be"

    local _clientBF = Instance.new("Folder")
    _clientBF.Name = "bf"

    --

    _root.Parent = game.ReplicatedStorage
    _serverRoot.Parent = game.ServerStorage

    _serverBE.Parent = _serverRoot
    _serverBF.Parent = _serverRoot
    _shared.Parent = _root
    _sharedRE.Parent = _shared
    _sharedRF.Parent = _shared

    _client.Parent = _root
    _clientBE.Parent = _client
end



function Signal.GetSignal(key: string)
    local typeResult, typeResultReason = Types.AffirmType(key, "string")
    
    assert(typeResult, typeResultReason)

    -- a) Iterate over ALL the values
    --
    -- GOOD: quick to do
    -- BAD: will be a little slower and go over areas it doesnt need to)



    -- c) Only have one of each key allowed across the whole system, store the directory for that 
    --
    -- GOOD: Will be fast and secure but also good to work with
    -- BAD: will bit a bit longer to do and mean i wrote a function for nothing


end

function Signal.RemoveSignal(key: string)
end

function Signal.NewSignal(key: string, bindable: boolean, config: Types.SignalConfig) : RemoteEvent | BindableEvent?
    local typeResult, typeResultReason = Types.AffirmTypes({key, bindable, config}, {"string", "boolean", "table"})
    
    local context = Signal._getSignalContext()
    local keyValidationResult, keyValidationResultReason = Signal._validateKey("event", bindable, context)

    assert(typeResult, typeResultReason)
    assert(keyValidationResult, keyValidationResultReason)


    Signal.Keys[key] = {}
    
    
    local signal = SignalObject.new(key, bindable)

    if not config then
        config = Configuration.DEFAULT_EVENT_CONFIGURATION
    end

    signal:SetConfiguration(config)
    
    if bindable then
        SignalObject[context].be[key] = signal
    else
        Signal.Shared.re[key] = signal
    end
end

function Signal.NewFunction(key: string, bindable: boolean, config: Types.SignalConfig) : RemoteFunction | BindableFunction?
end


function Signal:Bind(callback, action: string) : RBXScriptConnection
end

function Signal:Unbind(action: string)
end

function Signal:SetConfig(config: Types.SignalConfig )
end


--- Middleware
function Signal:SetMiddlewareIn(callback)

end

function Signal:SetMiddlewareOut(callback)

end


function Signal._getSignalContext(bindable)
    if not bindable then
        return "Shared"
    else
        if RunService:IsServer() then
            return "Server"
        else
            return "Client"
        end
    end
end


function Signal._validateKey()
    
    local function searchDirectory(table)
        for k,v in table do
            if k == key then
                return true
            end
        end
        return false
    end

end

-- function Signal._validateKey(key, _type, bindable, context)
    
--     local function searchDirectory(table)
--         for k,v in table do
--             if k == key then
--                 return true
--             end
--         end
--         return false
--     end
    
--     if _type == "event" then
--         if bindable then
--             return not searchDirectory(Signal.Signals[context].be)
--         else
--             return not searchDirectory(Signal.Signals.Shared.re)
--         end
--     else
--         if bindable then
--             return not searchDirectory(Signal.Signals[context].bf)
--         else
--             return not searchDirectory(Signal.Signals.Shared.rf)
--         end
--     end
-- end



return Signal