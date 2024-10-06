local RunService = game:GetService("RunService")

local signal = require(script.s)
local func = require(script.f)

local Types = require(script.t)

local Signal = {}

Signal.data = {
    Initialized = false
}


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
end

function Signal.RemoveSignal(key: string)
end

function Signal.NewSignal(key: string, bindable: boolean, config: Types.SignalConfig)

end

function Signal.NewFunction(key: string, bindable: boolean, config: Types.SignalConfig)

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
    


return Signal