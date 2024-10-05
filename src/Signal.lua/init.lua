local RunService = game:GetService("RunService")

local Signal = {}

Signal.data = {
    Initialized = false
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



function Signal:_createClientDirectory()
    
end

return Signal