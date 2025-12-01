-- special dumped using larry dec/deobf (dsc.gg/larrydeobf)



local coreGuiService = game:GetService("CoreGui")
local playersService = game:GetService("Players")
local workspaceService = game:GetService("Workspace")
local utilityFunctions = {}
local visionHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/orialdev2/Vision-Hub/refs/heads/main/Wind"))()
local queueOnTeleportFunction = queue_on_teleport or syn and syn.queue_on_teleport or (fluxus and fluxus.queue_on_teleport or function()
end)
if getgenv().VisionHub_Connections then
    local pairsIterator, visionHubConnectionKey, connectionKey = pairs(getgenv().VisionHub_Connections)
    while true do
        local connectionId, visionHubConnection = pairsIterator(visionHubConnectionKey, connectionKey)
        if connectionId == nil then
            break
        end
        connectionKey = connectionId
        if visionHubConnection then
            pcall(function()
                visionHubConnection:Disconnect()
            end)
        end
        getgenv().VisionHub_Connections[connectionId] = nil
    end
end
getgenv().VisionHub_Connections = {}
local childrenIterator, childIndex, childKey = ipairs(coreGuiService:GetChildren())
while true do
    local childId, visionObject = childrenIterator(childIndex, childKey)
    if childId == nil then
        break
    end
    childKey = childId
    if visionObject.Name == "Vision Hub" or (visionObject.Name == "VisionESP" or (string.match(visionObject.Name, "^VisionBtn_") or visionObject.Name == "VisionTimerGUI")) then
        visionObject:Destroy()
    end
end
local playersIterator, playerIndex, playerKey = ipairs(playersService:GetPlayers())
while true do
    local playerId, player = playersIterator(playerIndex, playerKey)
    if playerId == nil then
        break
    end
    playerKey = playerId
    if player.Character then
        local highlightList = {}
        local visionHighlight = player.Character:FindFirstChild("VisionHighlight")
        local nameEsp = player.Character:FindFirstChild("Head")
        if nameEsp then
            nameEsp = player.Character.Head:FindFirstChild("NameESP")
        end
        __set_list(highlightList, 1, {
            visionHighlight,
            nameEsp
        })
        local highlightIterator, descendantIndex, highlightKey = ipairs(highlightList)
        while true do
            local highlightId, visionGui = highlightIterator(descendantIndex, highlightKey)
            if highlightId == nil then
                break
            end
            highlightKey = highlightId
            if visionGui then
                visionGui:Destroy()
            end
        end
    end
end
local descendantsIterator, descendantIndex2, descendantKey = ipairs(workspaceService:GetDescendants())
while true do
    local descendantId, visionInstance = descendantsIterator(descendantIndex2, descendantKey)
    if descendantId == nil then
        break
    end
    descendantKey = descendantId
    if visionInstance.Name == "VisionGunHighlight" or visionInstance.Name == "VisionGunLabel" then
        visionInstance:Destroy()
    end
end
local epixVelInstance = utilityFunctions and utilityFunctions.RootPart and utilityFunctions.RootPart:FindFirstChild("EpixVel")
if epixVelInstance then
    epixVelInstance:Destroy()
end
if getgenv().FPDH then
    workspaceService.FallenPartsDestroyHeight = getgenv().FPDH
end
local function addConnection(itemData)
    local visionHubConnections = getgenv().VisionHub_Connections
    for connectionIndex = # visionHubConnections, 1, - 1 do
        local connection = visionHubConnections[connectionIndex]
        if not (connection and connection.Connected) then
            table.remove(visionHubConnections, connectionIndex)
        end
    end
    table.insert(visionHubConnections, itemData)
    return itemData
end
local runService = game:GetService("RunService")
local teleportService = game:GetService("TeleportService")
local starterGuiService = game:GetService("StarterGui")
local replicatedStorageService = game:GetService("ReplicatedStorage")
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local lightingService = game:GetService("Lighting")
local soundService = game:GetService("SoundService")
local textChatService = game:GetService("TextChatService")
local localPlayer = playersService.LocalPlayer
local mouse = localPlayer:GetMouse()
local playerGui = localPlayer:FindFirstChildWhichIsA("PlayerGui")
local placeId = game.PlaceId
local jobId = game.JobId
local _ = writefile
local _ = readfile
local fireTouchInterestFunction = firetouchinterest or nil
utilityFunctions.Player = localPlayer
utilityFunctions.GetMouse = mouse
utilityFunctions.PlayerGui = playerGui
utilityFunctions.PlaceId = placeId
utilityFunctions.JobId = jobId
utilityFunctions.RunService = runService
utilityFunctions.UserInputService = userInputService
utilityFunctions.Lighting = lightingService
utilityFunctions.SoundService = soundService
utilityFunctions.Workspace = workspaceService
utilityFunctions.ReplicatedStorage = replicatedStorageService
utilityFunctions.HttpService = httpService
utilityFunctions.StarterGui = starterGuiService
utilityFunctions.TextChatService = textChatService
utilityFunctions.Config = {
    GodMode = false,
    AntiFling = false,
    AntiAfk = false,
    EnableWalkSpeed = false,
    WalkSpeed = 16,
    EnableJumpPower = false,
    JumpPower = 50,
    Noclip = false,
    InfiniteJump = false,
    AutoGrabGun = false,
    AutoKill = false,
    KnifeAura = false,
    AuraRadius = 10,
    EspPlayers = false,
    ShowNames = false,
    EspDroppedGun = false,
    EspTrap = false,
    RemoveTraps = false,
    SilentThrow = false,
    AutoShootMurderer = false,
    AutoQueue = true,
    QueueUrl = "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/orialdev/Vision-Hub/refs/heads/main/main.lua\"))()",
    NotifyMurderer = false,
    NotifySheriff = false,
    NotifyGunDropped = false,
    ButtonsLocked = false
}
utilityFunctions.PlayerData = {}
utilityFunctions.MobileButtons = {}
local function onCharacterAdded(character)
    utilityFunctions.Character = character
    if character then
        utilityFunctions.Humanoid = character:FindFirstChildOfClass("Humanoid") or character:WaitForChild("Humanoid", 5)
        utilityFunctions.Backpack = utilityFunctions.Player:FindFirstChild("Backpack")
        utilityFunctions.RootPart = character:FindFirstChild("HumanoidRootPart") or character.PrimaryPart
        utilityFunctions.Camera = workspaceService.CurrentCamera
    else
        utilityFunctions.Humanoid = nil
        utilityFunctions.RootPart = nil
    end
end
if utilityFunctions.Player then
    if utilityFunctions.Player.Character then
        onCharacterAdded(utilityFunctions.Player.Character)
    end
    addConnection(utilityFunctions.Player.CharacterAdded:Connect(function(unknownParameter)
        onCharacterAdded(unknownParameter)
    end))
    addConnection(utilityFunctions.Player.CharacterRemoving:Connect(function()
        onCharacterAdded(nil)
    end))
    addConnection(playersService.PlayerRemoving:Connect(function(playerToRemove)
        if playerToRemove and (playerToRemove.Name and utilityFunctions.PlayerData[playerToRemove.Name]) then
            utilityFunctions.PlayerData[playerToRemove.Name] = nil
        end
    end))
end
function utilityFunctions.GetService(serviceName)
    local success, service = pcall(function()
        return game:GetService(serviceName)
    end)
    return success and service and service or nil
end
local steppedConnection = nil
function utilityFunctions.ToggleAntiFling(antiFlingEnabled)
    utilityFunctions.Config.AntiFling = antiFlingEnabled
    if steppedConnection then
        steppedConnection:Disconnect()
        steppedConnection = nil
    end
    if antiFlingEnabled then
        steppedConnection = addConnection(runService.Stepped:Connect(function()
            if utilityFunctions.Character then
                local playersService = playersService
                local ipairsIterator, playerIndex2, playerIndex = ipairs(playersService:GetPlayers())
                while true do
                    local otherPlayer
                    playerIndex, otherPlayer = ipairsIterator(playerIndex2, playerIndex)
                    if playerIndex == nil then
                        break
                    end
                    if otherPlayer ~= utilityFunctions.Player and otherPlayer.Character then
                        local characterPartsIterator, characterChildIndex, partIndex = ipairs(otherPlayer.Character:GetChildren())
                        while true do
                            local characterPart
                            partIndex, characterPart = characterPartsIterator(characterChildIndex, partIndex)
                            if partIndex == nil then
                                break
                            end
                            if characterPart:IsA("BasePart") and characterPart.CanCollide then
                                characterPart.CanCollide = false
                                if characterPart.Name == "HumanoidRootPart" then
                                    characterPart.Velocity = Vector3.new(0, 0, 0)
                                    characterPart.RotVelocity = Vector3.new(0, 0, 0)
                                end
                            end
                        end
                    end
                end
            end
        end))
    end
end
function utilityFunctions.HandleQueueTeleport()
    if utilityFunctions.Config.AutoQueue and (utilityFunctions.Config.QueueUrl and (utilityFunctions.Config.QueueUrl ~= "" and queueOnTeleportFunction)) then
        queueOnTeleportFunction(utilityFunctions.Config.QueueUrl)
    end
end
function utilityFunctions.Rejoin()
    if teleportService then
        if utilityFunctions.Player then
            utilityFunctions.HandleQueueTeleport()
            pcall(function()
                teleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, utilityFunctions.Player)
            end)
        end
    else
        return
    end
end
function utilityFunctions.ServerHop()
    if teleportService and utilityFunctions.Player then
        utilityFunctions.HandleQueueTeleport()
        local serverListUrl = "https://games.roblox.com/larry1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
        local success2, serverListResponse = pcall(function()
            return httpService:JSONDecode(game:HttpGet(serverListUrl))
        end)
        if success2 and (serverListResponse and serverListResponse.data) then
            local serverListIpairsIterator, serverIndex, serverIndex = ipairs(serverListResponse.data)
            while true do
                local serverData
                serverIndex, serverData = serverListIpairsIterator(serverIndex, serverIndex)
                if serverIndex == nil then
                    break
                end
                if serverData.id ~= game.JobId and serverData.playing < serverData.maxPlayers then
                    teleportService:TeleportToPlaceInstance(game.PlaceId, serverData.id, utilityFunctions.Player)
                    return
                end
            end
        end
        teleportService:Teleport(game.PlaceId, utilityFunctions.Player)
    end
end
function getMap()
    local workspaceChildrenIpairsIterator, workspaceObjectIndex, workspaceObjectIndex = ipairs(workspace:GetChildren())
    while true do
        local potentialMap
        workspaceObjectIndex, potentialMap = workspaceChildrenIpairsIterator(workspaceObjectIndex, workspaceObjectIndex)
        if workspaceObjectIndex == nil then
            break
        end
        if potentialMap:FindFirstChild("CoinContainer") and potentialMap:FindFirstChild("Spawns") then
            return potentialMap
        end
    end
    return nil
end
function utilityFunctions.TeleportToMap()
    local characterParent = not utilityFunctions.Character and utilityFunctions.RootPart
    if characterParent then
        characterParent = utilityFunctions.RootPart.Parent
    end
    if characterParent then
        local map = getMap()
        if map then
            local spawnsFolder = map:FindFirstChild("Spawns")
            if spawnsFolder then
                local spawnIpairsIterator, spawnIndex, spawnIndex2 = ipairs(spawnsFolder:GetChildren())
                local spawnPoints = {}
                while true do
                    local spawnPart
                    spawnIndex2, spawnPart = spawnIpairsIterator(spawnIndex, spawnIndex2)
                    if spawnIndex2 == nil then
                        break
                    end
                    if spawnPart:IsA("BasePart") then
                        table.insert(spawnPoints, spawnPart)
                    end
                end
                local randomSpawn
                if # spawnPoints <= 0 then
                    randomSpawn = nil
                else
                    randomSpawn = spawnPoints[math.random(1, # spawnPoints)]
                end
                local spawnLocation = randomSpawn or (spawnsFolder:FindFirstChild("Spawn") or spawnsFolder:FindFirstChild("PlayerSpawn"))
                if spawnLocation and spawnLocation:IsA("BasePart") then
                    characterParent:PivotTo(spawnLocation.CFrame * CFrame.new(0, 5, 0))
                end
            end
        else
            return
        end
    else
        return
    end
end
function getLobby()
    local workspaceChildrenIpairsIterator2, workspaceObjectIndex2, workspaceObjectIndex2 = ipairs(workspace:GetChildren())
    while true do
        local potentialLobby
        workspaceObjectIndex2, potentialLobby = workspaceChildrenIpairsIterator2(workspaceObjectIndex2, workspaceObjectIndex2)
        if workspaceObjectIndex2 == nil then
            break
        end
        if potentialLobby:FindFirstChild("Lobby") then
            return potentialLobby.Lobby
        end
        if potentialLobby.Name:lower() == "lobby" then
            return potentialLobby
        end
    end
    return nil
end
function utilityFunctions.TeleportToLobby()
    local characterParent2 = not utilityFunctions.Character and utilityFunctions.RootPart
    if characterParent2 then
        characterParent2 = utilityFunctions.RootPart.Parent
    end
    if characterParent2 then
        local lobby = getLobby()
        if lobby then
            local lobbySpawnsFolder = lobby:FindFirstChild("Spawns")
            if lobbySpawnsFolder then
                local iterator, index, child = ipairs(lobbySpawnsFolder:GetChildren())
                local lobbySpawnPoints = {}
                while true do
                    local part
                    child, part = iterator(index, child)
                    if child == nil then
                        break
                    end
                    if part:IsA("BasePart") then
                        table.insert(lobbySpawnPoints, part)
                    end
                end
                local spawnLocation
                if # lobbySpawnPoints <= 0 then
                    spawnLocation = nil
                else
                    spawnLocation = lobbySpawnPoints[math.random(1, # lobbySpawnPoints)]
                end
                local selectedSpawnLocation = spawnLocation or lobbySpawnsFolder:FindFirstChild("SpawnLocation")
                if selectedSpawnLocation and selectedSpawnLocation:IsA("BasePart") then
                    characterParent2:PivotTo(selectedSpawnLocation.CFrame * CFrame.new(0, 5, 0))
                end
            end
        else
            return
        end
    else
        return
    end
end
function getCoinContainer()
    local currentMap = getMap()
    if currentMap then
        return currentMap:FindFirstChild("CoinContainer")
    else
        return nil
    end
end
function utilityFunctions.GetPlayerByName(playerName)
    if not playerName then
        return nil
    end
    local playersService2 = playersService
    local iterator, playerIndex, index = ipairs(playersService2:GetPlayers())
    while true do
        local player
        index, player = iterator(playerIndex, index)
        if index == nil then
            break
        end
        if player.Name:lower() == playerName:lower() then
            return player
        end
    end
    return nil
end
function utilityFunctions.FindMurderer()
    local playersService = playersService
    local iterator, playerIndex, index = ipairs(playersService:GetPlayers())
    while true do
        local playerWithKnife
        index, playerWithKnife = iterator(playerIndex, index)
        if index == nil then
            break
        end
        if playerWithKnife:FindFirstChild("Backpack") and playerWithKnife.Backpack:FindFirstChild("Knife") then
            return playerWithKnife
        end
    end
    local playersService4 = playersService
    local iterator, playerIndex, index = ipairs(playersService4:GetPlayers())
    while true do
        local playerWithKnifeInCharacter
        index, playerWithKnifeInCharacter = iterator(playerIndex, index)
        if index == nil then
            break
        end
        if playerWithKnifeInCharacter.Character and playerWithKnifeInCharacter.Character:FindFirstChild("Knife") then
            return playerWithKnifeInCharacter
        end
    end
    if utilityFunctions.PlayerData then
        local iterator, playerUserId, playerData = pairs(utilityFunctions.PlayerData)
        while true do
            local murdererPlayer
            playerData, murdererPlayer = iterator(playerUserId, playerData)
            if playerData == nil then
                break
            end
            if murdererPlayer and (murdererPlayer.Role == "Murderer" or murdererPlayer.role == "Murderer") then
                local murdererCharacter = playersService:FindFirstChild(playerData)
                if murdererCharacter then
                    return murdererCharacter
                end
            end
        end
    end
    return nil
end
function utilityFunctions.FindSheriff()
    local playersService2 = playersService
    local iterator, playerIndex, index = ipairs(playersService2:GetPlayers())
    while true do
        local playerWithGunInBackpack
        index, playerWithGunInBackpack = iterator(playerIndex, index)
        if index == nil then
            break
        end
        if playerWithGunInBackpack:FindFirstChild("Backpack") and playerWithGunInBackpack.Backpack:FindFirstChild("Gun") then
            return playerWithGunInBackpack
        end
    end
    local playersService5 = playersService
    local iterator, playerIndex, index = ipairs(playersService5:GetPlayers())
    while true do
        local playerWithGunInCharacter
        index, playerWithGunInCharacter = iterator(playerIndex, index)
        if index == nil then
            break
        end
        if playerWithGunInCharacter.Character and playerWithGunInCharacter.Character:FindFirstChild("Gun") then
            return playerWithGunInCharacter
        end
    end
    if utilityFunctions.PlayerData then
        local iterator, playerUserId, playerData = pairs(utilityFunctions.PlayerData)
        while true do
            local sheriffPlayer
            playerData, sheriffPlayer = iterator(playerUserId, playerData)
            if playerData == nil then
                break
            end
            if sheriffPlayer and (sheriffPlayer.Role == "Sheriff" or sheriffPlayer.role == "Sheriff") then
                local sheriffCharacter = playersService:FindFirstChild(playerData)
                if sheriffCharacter then
                    return sheriffCharacter
                end
            end
        end
    end
    return nil
end
function utilityFunctions.FindSheriffThatsNotMe()
    local localPlayer = playersService.LocalPlayer
    local playersService3 = playersService
    local iterator, playerIndex, index = ipairs(playersService3:GetPlayers())
    while true do
        local otherPlayer
        index, otherPlayer = iterator(playerIndex, index)
        if index == nil then
            break
        end
        if otherPlayer ~= localPlayer and otherPlayer:FindFirstChild("Backpack") and otherPlayer.Backpack:FindFirstChild("Gun") then
            return otherPlayer
        end
    end
    local playersService6 = playersService
    local iterator, playerIndex, index = ipairs(playersService6:GetPlayers())
    while true do
        local playerWithGun
        index, playerWithGun = iterator(playerIndex, index)
        if index == nil then
            break
        end
        if playerWithGun ~= localPlayer and playerWithGun.Character and playerWithGun.Character:FindFirstChild("Gun") then
            return playerWithGun
        end
    end
    if utilityFunctions.PlayerData then
        local iterator, playerUserId, playerData = pairs(utilityFunctions.PlayerData)
        while true do
            local sheriffPlayer2
            playerData, sheriffPlayer2 = iterator(playerUserId, playerData)
            if playerData == nil then
                break
            end
            if sheriffPlayer2 and (sheriffPlayer2.Role == "Sheriff" or sheriffPlayer2.role == "Sheriff") then
                local playerObject = playersService:FindFirstChild(playerData)
                if playerObject and playerObject ~= localPlayer then
                    return playerObject
                end
            end
        end
    end
    return nil
end
local remotesFolderSuccess, remotesFolder = pcall(function()
    local remotes = utilityFunctions.ReplicatedStorage
    if remotes then
        remotes = utilityFunctions.ReplicatedStorage:WaitForChild("Remotes", 5)
    end
    return remotes
end)
local gameplayFolder = remotesFolderSuccess and remotesFolder and (remotesFolder:FindFirstChild("Gameplay") or remotesFolder:FindFirstChild("Gameplay", true))
if gameplayFolder then
    local playerDataChangedEvent = gameplayFolder:FindFirstChild("PlayerDataChanged")
    if playerDataChangedEvent and playerDataChangedEvent:IsA("RemoteEvent") then
        addConnection(playerDataChangedEvent.OnClientEvent:Connect(function(playerData)
            if type(playerData) == "table" then
                utilityFunctions.PlayerData = playerData
            end
        end))
    end
end
local getPlayerRemoteFunction
if utilityFunctions.ReplicatedStorage then
    getPlayerRemoteFunction = utilityFunctions.ReplicatedStorage:FindFirstChild("GetPlayerData", true)
else
    getPlayerRemoteFunction = nil
end
if getPlayerRemoteFunction and typeof(getPlayerRemoteFunction.InvokeServer) == "function" then
    pcall(function()
        local success, playerData = pcall(function()
            return getPlayerRemoteFunction:InvokeServer()
        end)
        if success and type(playerData) == "table" then
            utilityFunctions.PlayerData = playerData
        end
    end)
end
local function updateCameraFocus(player)
    if not (player and player.Character) then
        return
    end
    local character = localPlayer
    if character then
        character = localPlayer.Character
    end
    local humanoid
    if character then
        humanoid = character:FindFirstChildOfClass("Humanoid") or character:FindFirstChild("Humanoid")
    else
        humanoid = character
    end
    local rootPart
    if character then
        rootPart = character:FindFirstChild("HumanoidRootPart") or character.PrimaryPart
    else
        rootPart = character
    end
    local characterModel
    if player then
        characterModel = player.Character
    else
        characterModel = player
    end
    local headPart = nil
    local accessory = nil
    local accessoryHandle = nil
    local humanoid
    if characterModel and characterModel:FindFirstChildOfClass("Humanoid") then
        humanoid = characterModel:FindFirstChildOfClass("Humanoid")
    else
        humanoid = nil
    end
    local hasHumanoidRootPart = not humanoid or characterModel:FindFirstChild("HumanoidRootPart") or (characterModel.PrimaryPart or humanoid.RootPart)
    if characterModel and characterModel:FindFirstChild("Head") then
        headPart = characterModel.Head
    end
    if characterModel and characterModel:FindFirstChildOfClass("Accessory") then
        accessory = characterModel:FindFirstChildOfClass("Accessory")
    end
    if accessory and accessory:FindFirstChild("Handle") then
        accessoryHandle = accessory.Handle
    end
    if character and (humanoid and rootPart) then
        if rootPart.Velocity.Magnitude < 50 then
            getgenv().OldPos = rootPart.CFrame
        end
        local currentCamera = workspace.CurrentCamera
        if headPart then
            currentCamera.CameraSubject = headPart
        elseif headPart or not accessoryHandle then
            if humanoid and hasHumanoidRootPart then
                currentCamera.CameraSubject = humanoid
            end
        else
            currentCamera.CameraSubject = accessoryHandle
        end
        if not (characterModel and characterModel:FindFirstChildWhichIsA("BasePart")) then
            return
        end
        local function applyVelocity(part, yOffset, rotationOffset)
            rootPart.CFrame = CFrame.new(part.Position) * yOffset * rotationOffset
            pcall(function()
                if character and character.PrimaryPart then
                    character:SetPrimaryPartCFrame(CFrame.new(part.Position) * yOffset * rotationOffset)
                end
            end)
            rootPart.Velocity = Vector3.new(90000000, 900000000, 90000000)
            rootPart.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
        end
        local function applyForce(part)
            local startTime = tick()
            local timeoutDuration = 2
            local rotationAngle = 0
            while rootPart and humanoid do
                if part.Velocity.Magnitude >= 50 then
                    applyVelocity(part, CFrame.new(0, 1.5, humanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                    task.wait()
                    applyVelocity(part, CFrame.new(0, - 1.5, - humanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                    task.wait()
                    applyVelocity(part, CFrame.new(0, 1.5, humanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                    task.wait()
                    applyVelocity(part, CFrame.new(0, 1.5, hasHumanoidRootPart and hasHumanoidRootPart.Velocity.Magnitude / 1.25 or 0), CFrame.Angles(math.rad(90), 0, 0))
                    task.wait()
                    applyVelocity(part, CFrame.new(0, - 1.5, - (hasHumanoidRootPart and hasHumanoidRootPart.Velocity.Magnitude / 1.25 or 0)), CFrame.Angles(0, 0, 0))
                    task.wait()
                    applyVelocity(part, CFrame.new(0, 1.5, hasHumanoidRootPart and hasHumanoidRootPart.Velocity.Magnitude / 1.25 or 0), CFrame.Angles(math.rad(90), 0, 0))
                    task.wait()
                    applyVelocity(part, CFrame.new(0, - 1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                    task.wait()
                    applyVelocity(part, CFrame.new(0, - 1.5, 0), CFrame.Angles(0, 0, 0))
                    task.wait()
                    applyVelocity(part, CFrame.new(0, - 1.5, 0), CFrame.Angles(math.rad(- 90), 0, 0))
                    task.wait()
                    applyVelocity(part, CFrame.new(0, - 1.5, 0), CFrame.Angles(0, 0, 0))
                    task.wait()
                else
                    rotationAngle = rotationAngle + 100
                    applyVelocity(part, CFrame.new(0, 1.5, 0) + humanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(rotationAngle), 0, 0))
                    task.wait()
                    applyVelocity(part, CFrame.new(0, - 1.5, 0) + humanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(rotationAngle), 0, 0))
                    task.wait()
                    applyVelocity(part, CFrame.new(2.25, 1.5, - 2.25) + humanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(rotationAngle), 0, 0))
                    task.wait()
                    applyVelocity(part, CFrame.new(- 2.25, - 1.5, 2.25) + humanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(rotationAngle), 0, 0))
                    task.wait()
                    applyVelocity(part, CFrame.new(0, 1.5, 0) + humanoid.MoveDirection, CFrame.Angles(math.rad(rotationAngle), 0, 0))
                    task.wait()
                    applyVelocity(part, CFrame.new(0, - 1.5, 0) + humanoid.MoveDirection, CFrame.Angles(math.rad(rotationAngle), 0, 0))
                    task.wait()
                end
                if part.Velocity.Magnitude > 500 or (part.Parent ~= player.Character or (player.Parent ~= playersService or (player.Character ~= characterModel or humanoid and humanoid.Sit))) or (humanoid and humanoid.Health <= 0 or tick() > startTime + timeoutDuration) then
                    break
                end
            end
        end
        if not getgenv().FPDH then
            getgenv().FPDH = workspace.FallenPartsDestroyHeight
        end
        workspace.FallenPartsDestroyHeight = 0 / 0
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Name = "EpixVel"
        bodyVelocity.Parent = rootPart
        bodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
        bodyVelocity.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        if hasHumanoidRootPart and headPart then
            if (hasHumanoidRootPart.CFrame.p - headPart.CFrame.p).Magnitude <= 5 then
                applyForce(hasHumanoidRootPart)
            else
                applyForce(headPart)
            end
        elseif hasHumanoidRootPart and not headPart then
            applyForce(hasHumanoidRootPart)
        elseif hasHumanoidRootPart or not headPart then
            if not hasHumanoidRootPart and (not headPart and (accessory and accessoryHandle)) then
                applyForce(accessoryHandle)
            end
        else
            applyForce(headPart)
        end
        if bodyVelocity and bodyVelocity.Parent then
            bodyVelocity:Destroy()
        end
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        workspace.CurrentCamera.CameraSubject = humanoid
        while true do
            if getgenv().OldPos then
                rootPart.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)
                pcall(function()
                    if character and character.PrimaryPart then
                        character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
                    end
                end)
            end
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
            local iterator, childIndex, index = ipairs(character:GetChildren())
            while true do
                local child
                index, child = iterator(childIndex, index)
                if index == nil then
                    break
                end
                if child:IsA("BasePart") then
                    local zeroVector = Vector3.new()
                    child.RotVelocity = Vector3.new()
                    child.Velocity = zeroVector
                end
            end
            task.wait()
            if not getgenv().OldPos or (rootPart.Position - getgenv().OldPos.p).Magnitude < 25 then
                if getgenv().FPDH then
                    workspace.FallenPartsDestroyHeight = getgenv().FPDH
                end
            end
        end
    else
        return
    end
end
function utilityFunctions.getPredictedPosition(player)
    if not (player and player.Character) then
        return Vector3.new(0, 0, 0)
    end
    local rootPart = player.Character:FindFirstChild("HumanoidRootPart") or player.Character.PrimaryPart
    if not rootPart then
        return Vector3.new(0, 0, 0)
    end
    local velocity = rootPart.AssemblyLinearVelocity or (rootPart.Velocity or Vector3.new(0, 0, 0))
    local networkPing = 0
    pcall(function()
        if utilityFunctions.Player and typeof(utilityFunctions.Player.GetNetworkPing) == "function" then
            networkPing = utilityFunctions.Player:GetNetworkPing() or 0
        end
    end)
    if type(networkPing) ~= "number" then
        local numericValue = tonumber(networkPing)
        if numericValue then
            networkPing = numericValue
        else
            networkPing = 0
        end
    end
    if networkPing > 1 then
        networkPing = networkPing / 1000
    end
    local timeOffset = math.max(0, 2.8 * 0.01) + networkPing
    return rootPart.Position + velocity * timeOffset
end
function utilityFunctions.ShootMurdererOnce()
    local currentPlayer = utilityFunctions.Player
    if currentPlayer and currentPlayer.Character then
        if utilityFunctions.FindMurderer or utilityFunctions.FindSheriffThatsNotMe then
            local otherPlayer = utilityFunctions.FindMurderer() or utilityFunctions.FindSheriffThatsNotMe()
            if otherPlayer and otherPlayer.Character then
                local otherPlayerHumanoidRootPart = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
                local currentPlayerHumanoidRootPart = currentPlayer.Character:FindFirstChild("HumanoidRootPart")
                if otherPlayerHumanoidRootPart and currentPlayerHumanoidRootPart then
                    local raycastParams = RaycastParams.new()
                    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
                    raycastParams.FilterDescendantsInstances = {
                        currentPlayer.Character
                    }
                    local raycastDirection = otherPlayerHumanoidRootPart.Position - currentPlayerHumanoidRootPart.Position
                    local success, raycastResult, raycastResult = pcall(function()
                        return workspace:Raycast(currentPlayerHumanoidRootPart.Position, raycastDirection, raycastParams)
                    end)
                    local isDescendant = false
                    if success, raycastResult and raycastResult then
                        if raycastResult.Instance and otherPlayer.Character then
                            isDescendant = raycastResult.Instance:IsDescendantOf(otherPlayer.Character) and true or isDescendant
                        end
                    else
                        isDescendant = true
                    end
                    if isDescendant then
                        if not currentPlayer.Character:FindFirstChild("Gun") then
                            local gunTool = currentPlayer.Backpack
                            if gunTool then
                                gunTool = currentPlayer.Backpack:FindFirstChild("Gun")
                            end
                            if gunTool and currentPlayer.Character:FindFirstChildOfClass("Humanoid") then
                                pcall(function()
                                    currentPlayer.Character.Humanoid:EquipTool(gunTool)
                                end)
                            end
                        end
                        local currentGun = currentPlayer.Character
                        if currentGun then
                            currentGun = currentPlayer.Character:FindFirstChild("Gun")
                        end
                        if currentGun then
                            local knifeLocal = currentGun:FindFirstChild("KnifeLocal")
                            local createBeamRemoteFunction
                            if knifeLocal then
                                createBeamRemoteFunction = knifeLocal:FindFirstChild("CreateBeam")
                            else
                                createBeamRemoteFunction = knifeLocal
                            end
                            local createBeamRemoteFunction
                            if createBeamRemoteFunction then
                                createBeamRemoteFunction = createBeamRemoteFunction:FindFirstChild("RemoteFunction")
                            else
                                createBeamRemoteFunction = createBeamRemoteFunction
                            end
                            if currentGun and (knifeLocal and (createBeamRemoteFunction and (createBeamRemoteFunction and typeof(createBeamRemoteFunction.InvokeServer) == "function"))) then
                                local predictedPosition = utilityFunctions.getPredictedPosition(otherPlayer)
                                pcall(function()
                                    createBeamRemoteFunction:InvokeServer(1, predictedPosition, "AH2")
                                end)
                            end
                        end
                    else
                        return
                    end
                else
                    return
                end
            else
                return
            end
        else
            return
        end
    else
        return
    end
end
local autoShootConnection = nil
function utilityFunctions.ToggleAutoShootMurderer(autoShootEnabled)
    utilityFunctions.Config.AutoShootMurderer = autoShootEnabled
    if autoShootConnection then
        autoShootConnection:Disconnect()
        autoShootConnection = nil
    end
    if autoShootEnabled then
        autoShootConnection = addConnection(utilityFunctions.RunService.Heartbeat:Connect(function()
            pcall(function()
                if utilityFunctions.Config.AutoShootMurderer and utilityFunctions.FindSheriff() == utilityFunctions.Player then
                    utilityFunctions.ShootMurdererOnce()
                end
            end)
        end))
    end
end
function utilityFunctions.TeleportToPlayer(player)
    if utilityFunctions.RootPart then
        if player and (player.Character and player.Character.PrimaryPart) then
            return pcall(function()
                local characterPrimaryPartCFrame = player.Character.PrimaryPart.CFrame
                utilityFunctions.Character:SetPrimaryPartCFrame(characterPrimaryPartCFrame * CFrame.new(0, 3, 0))
            end)
        else
            return false
        end
    else
        return false
    end
end
local characterAddedConnection = nil
function utilityFunctions.EnableGodMode(godModeEnabled)
    utilityFunctions.Config.GodMode = godModeEnabled
    if characterAddedConnection then
        characterAddedConnection:Disconnect()
        characterAddedConnection = nil
    end
    if godModeEnabled then
        local function applyGodMode(humanoid)
            if humanoid then
                local healthChangedConnection = humanoid.HealthChanged:Connect(function(godModeEnabled)
                    if utilityFunctions.Config.GodMode and godModeEnabled < humanoid.MaxHealth then
                        humanoid.Health = humanoid.MaxHealth
                    end
                end)
                task.spawn(function()
                    while utilityFunctions.Config.GodMode and (humanoid and humanoid.Parent) do
                        if humanoid.Health < humanoid.MaxHealth then
                            humanoid.Health = humanoid.MaxHealth
                        end
                        if humanoid:GetState() == Enum.HumanoidStateType.Dead then
                            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                            humanoid.Health = humanoid.MaxHealth
                        end
                        task.wait(0.2)
                    end
                    if healthChangedConnection then
                        healthChangedConnection:Disconnect()
                    end
                end)
            end
        end
        if utilityFunctions.Humanoid then
            applyGodMode(utilityFunctions.Humanoid)
        end
        characterAddedConnection = addConnection(utilityFunctions.Player.CharacterAdded:Connect(function(characterModel)
            local humanoid = characterModel:WaitForChild("Humanoid", 5)
            if humanoid then
                task.wait(0.5)
                applyGodMode(humanoid)
            end
        end))
    end
end
local walkSpeedConnection = nil
local defaultWalkSpeed = 16
function utilityFunctions.EnableWalkSpeed(enableWalkSpeed)
    utilityFunctions.Config.EnableWalkSpeed = enableWalkSpeed
    if enableWalkSpeed then
        if walkSpeedConnection then
            walkSpeedConnection:Disconnect()
        end
        walkSpeedConnection = addConnection(runService.Heartbeat:Connect(function()
            if utilityFunctions.Humanoid and utilityFunctions.Humanoid.WalkSpeed ~= utilityFunctions.Config.WalkSpeed then
                utilityFunctions.Humanoid.WalkSpeed = utilityFunctions.Config.WalkSpeed
            end
        end))
    else
        if walkSpeedConnection then
            walkSpeedConnection:Disconnect()
            walkSpeedConnection = nil
        end
        if utilityFunctions.Humanoid then
            utilityFunctions.Humanoid.WalkSpeed = defaultWalkSpeed
        end
    end
end
function utilityFunctions.SetWalkSpeed(walkSpeed)
    utilityFunctions.Config.WalkSpeed = math.clamp(walkSpeed, 16, 200)
    if utilityFunctions.Config.EnableWalkSpeed and utilityFunctions.Humanoid then
        utilityFunctions.Humanoid.WalkSpeed = utilityFunctions.Config.WalkSpeed
    end
end
local jumpPowerConnection = nil
local defaultJumpPower = 50
function utilityFunctions.EnableJumpPower(enableJumpPower)
    utilityFunctions.Config.EnableJumpPower = enableJumpPower
    if enableJumpPower then
        if jumpPowerConnection then
            jumpPowerConnection:Disconnect()
        end
        jumpPowerConnection = addConnection(runService.Heartbeat:Connect(function()
            if utilityFunctions.Humanoid and utilityFunctions.Humanoid.JumpPower ~= utilityFunctions.Config.JumpPower then
                utilityFunctions.Humanoid.JumpPower = utilityFunctions.Config.JumpPower
            end
        end))
    else
        if jumpPowerConnection then
            jumpPowerConnection:Disconnect()
            jumpPowerConnection = nil
        end
        if utilityFunctions.Humanoid then
            utilityFunctions.Humanoid.JumpPower = defaultJumpPower
        end
    end
end
function utilityFunctions.SetJumpPower(jumpPower)
    utilityFunctions.Config.JumpPower = math.clamp(jumpPower, 50, 300)
    if utilityFunctions.Config.EnableJumpPower and utilityFunctions.Humanoid then
        utilityFunctions.Humanoid.JumpPower = utilityFunctions.Config.JumpPower
    end
end
local heartbeatConnection = nil
local canCollideStates = {}
function utilityFunctions.EnableNoclip(enableNoClip)
    utilityFunctions.Config.Noclip = enableNoClip
    if enableNoClip then
        if utilityFunctions.Character then
            local ipairsIterator, characterDescendantsState, characterDescendantsIndex = ipairs(utilityFunctions.Character:GetDescendants())
            while true do
                local characterDescendant
                characterDescendantsIndex, characterDescendant = ipairsIterator(characterDescendantsState, characterDescendantsIndex)
                if characterDescendantsIndex == nil then
                    break
                end
                if characterDescendant:IsA("BasePart") then
                    canCollideStates[characterDescendant] = characterDescendant.CanCollide
                    characterDescendant.CanCollide = false
                end
            end
        end
        if heartbeatConnection then
            heartbeatConnection:Disconnect()
        end
        heartbeatConnection = addConnection(runService.Stepped:Connect(function()
            if utilityFunctions.Character then
                local ipairsIterator2, characterDescendantsState2, characterDescendantsIndex2 = ipairs(utilityFunctions.Character:GetDescendants())
                while true do
                    local descendant
                    characterDescendantsIndex2, descendant = ipairsIterator2(characterDescendantsState2, characterDescendantsIndex2)
                    if characterDescendantsIndex2 == nil then
                        break
                    end
                    if descendant:IsA("BasePart") then
                        descendant.CanCollide = false
                    end
                end
            end
        end))
    else
        if heartbeatConnection then
            heartbeatConnection:Disconnect()
            heartbeatConnection = nil
        end
        local pairsIterator, basePartIterator, part = pairs(canCollideStates)
        while true do
            local originalCanCollide
            part, originalCanCollide = pairsIterator(basePartIterator, part)
            if part == nil then
                break
            end
            if part and part.Parent then
                part.CanCollide = originalCanCollide
            end
        end
        canCollideStates = {}
    end
end
local jumpRequestConnection = nil
function utilityFunctions.InfiniteJump(enableInfiniteJump)
    utilityFunctions.Config.InfiniteJump = enableInfiniteJump
    if enableInfiniteJump then
        if jumpRequestConnection then
            jumpRequestConnection:Disconnect()
        end
        jumpRequestConnection = addConnection(userInputService.JumpRequest:Connect(function()
            if utilityFunctions.Humanoid then
                utilityFunctions.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end))
    elseif jumpRequestConnection then
        jumpRequestConnection:Disconnect()
        jumpRequestConnection = nil
    end
end
local grabGunHeartbeatConnection = nil
function utilityFunctions.GrabGun()
    local rootPart = utilityFunctions.RootPart
    if rootPart and rootPart.Parent then
        local mapModel = getMap()
        if mapModel then
            local gunDropPart = mapModel:FindFirstChild("GunDrop")
            if gunDropPart and gunDropPart:IsA("BasePart") then
                pcall(function()
                    fireTouchInterestFunction(gunDropPart, rootPart, 1)
                    fireTouchInterestFunction(gunDropPart, rootPart, 0)
                end)
            end
        end
    else
        return
    end
end
function utilityFunctions.ToggleAutoGrabGun(autoGrabGunEnabled)
    utilityFunctions.Config.AutoGrabGun = autoGrabGunEnabled
    if grabGunHeartbeatConnection then
        grabGunHeartbeatConnection:Disconnect()
        grabGunHeartbeatConnection = nil
    end
    if autoGrabGunEnabled then
        grabGunHeartbeatConnection = addConnection(runService.Heartbeat:Connect(utilityFunctions.GrabGun))
    end
end
function utilityFunctions.KillAll()
    if utilityFunctions.Backpack and (utilityFunctions.Character and utilityFunctions.Humanoid) then
        local knifeTool = utilityFunctions.Backpack:FindFirstChild("Knife") or utilityFunctions.Character:FindFirstChild("Knife")
        local humanoid = utilityFunctions.Humanoid
        if knifeTool then
            if knifeTool.Parent == utilityFunctions.Backpack then
                humanoid:EquipTool(knifeTool)
                task.wait(0.1)
                knifeTool = utilityFunctions.Character:FindFirstChild("Knife")
            end
            if knifeTool then
                local knifeHandlePart = knifeTool:FindFirstChild("Handle")
                local stabRemoteEvent = knifeTool:FindFirstChild("Stab")
                if knifeTool:IsA("Tool") then
                    knifeTool.Parent = utilityFunctions.Character
                    local playersService7 = playersService
                    local ipairsIterator, playerIterator, playerIndex = ipairs(playersService7:GetPlayers())
                    while true do
                        local playerObject
                        playerIndex, playerObject = ipairsIterator(playerIterator, playerIndex)
                        if playerIndex == nil then
                            break
                        end
                        local otherPlayerRootPart = playerObject.Character
                        if otherPlayerRootPart then
                            otherPlayerRootPart = playerObject.Character:FindFirstChild("HumanoidRootPart") or playerObject.Character.PrimaryPart
                        end
                        if playerObject ~= utilityFunctions.Player and (otherPlayerRootPart and knifeHandlePart) then
                            fireTouchInterestFunction(knifeHandlePart, otherPlayerRootPart, 1)
                            fireTouchInterestFunction(knifeHandlePart, otherPlayerRootPart, 0)
                            if stabRemoteEvent and typeof(stabRemoteEvent.FireServer) == "function" then
                                stabRemoteEvent:FireServer(otherPlayerRootPart.Position)
                            end
                            task.wait(0.1)
                        end
                    end
                end
            end
        else
            return
        end
    else
        return
    end
end
local autoKillHeartbeatConnection = nil
function utilityFunctions.ToggleAutoKillAll(autoKillEnabled)
    utilityFunctions.Config.AutoKill = autoKillEnabled
    if autoKillHeartbeatConnection then
        autoKillHeartbeatConnection:Disconnect()
        autoKillHeartbeatConnection = nil
    end
    if autoKillEnabled then
        autoKillHeartbeatConnection = addConnection(runService.Heartbeat:Connect(function()
            if utilityFunctions.Config.AutoKill and (utilityFunctions.Backpack and utilityFunctions.Character) then
                local knifeTool = utilityFunctions.Backpack:FindFirstChild("Knife") or utilityFunctions.Character:FindFirstChild("Knife")
                if knifeTool and knifeTool:IsA("Tool") then
                    utilityFunctions.KillAll()
                end
            end
        end))
    end
end
local killAuraHeartbeatConnection = nil
function utilityFunctions.KillAura(killAuraEnabled)
    utilityFunctions.Config.KillAura = killAuraEnabled
    if killAuraHeartbeatConnection then
        killAuraHeartbeatConnection:Disconnect()
        killAuraHeartbeatConnection = nil
    end
    if killAuraEnabled then
        killAuraHeartbeatConnection = addConnection(runService.Heartbeat:Connect(function()
            local knifeToolLocal = utilityFunctions.Character
            if knifeToolLocal then
                knifeToolLocal = utilityFunctions.Character:FindFirstChild("Knife")
            end
            if not (knifeToolLocal and knifeToolLocal:IsA("Tool")) then
                return
            end
            local knifeHandlePartLocal = knifeToolLocal:FindFirstChild("Handle")
            local stabRemoteEvent = knifeToolLocal:FindFirstChild("Stab")
            local rootPartLocal = utilityFunctions.RootPart
            local characterLocal = utilityFunctions.Character
            if not (knifeHandlePartLocal and (rootPartLocal and characterLocal)) then
                return
            end
            if knifeToolLocal.Parent ~= characterLocal then
                return
            end
            local auraRadius = math.max(1, tonumber(utilityFunctions.Config.AuraRadius) or 10)
            local playersService8 = playersService
            local ipairsIteratorLocal, playerIterator, playerIndexLocal = ipairs(playersService8:GetPlayers())
            while true do
                local otherPlayerObject
                playerIndexLocal, otherPlayerObject = ipairsIteratorLocal(playerIterator, playerIndexLocal)
                if playerIndexLocal == nil then
                    break
                end
                if otherPlayerObject ~= utilityFunctions.Player and otherPlayerObject.Character and (otherPlayerObject.Character:FindFirstChildOfClass("Humanoid") and otherPlayerObject.Character.Humanoid.Health > 0) then
                    local otherPlayerRootPartLocal = otherPlayerObject.Character:FindFirstChild("HumanoidRootPart") or otherPlayerObject.Character.PrimaryPart
                    if otherPlayerRootPartLocal and (otherPlayerRootPartLocal.Position - rootPartLocal.Position).Magnitude <= auraRadius then
                        fireTouchInterestFunction(knifeHandlePartLocal, otherPlayerRootPartLocal, 1)
                        fireTouchInterestFunction(knifeHandlePartLocal, otherPlayerRootPartLocal, 0)
                        if stabRemoteEvent and typeof(stabRemoteEvent.FireServer) == "function" then
                            stabRemoteEvent:FireServer(otherPlayerRootPartLocal.Position)
                        end
                        break
                    end
                end
            end
        end))
    end
end
utilityFunctions.Config.NotifyGunDropped = false
local descendantAddedConnection = nil
local droppedGun = nil
local function notifyGunDropped(newDroppedGun)
    if newDroppedGun and newDroppedGun.Parent then
        if droppedGun ~= newDroppedGun then
            droppedGun = newDroppedGun
            pcall(function()
                if visionHub and typeof(visionHub.Notify) == "function" then
                    visionHub:Notify({
                        Title = "Gun Dropped",
                        Content = "A gun has been dropped in the map.",
                        Icon = "crosshair",
                        Duration = 5,
                        TitleColor = Color3.fromHex("#00BFFF"),
                        ContentColor = Color3.fromHex("#E6F7FF"),
                        IconColor = Color3.fromHex("#89F7FF"),
                        BackgroundColor = Color3.fromHex("#030407"),
                        ProgressBarColor = Color3.fromHex("#00BFFF"),
                        CloseButtonColor = Color3.fromHex("#00BFFF")
                    })
                end
            end)
        end
    else
        return
    end
end
local function findGunDropPart()
    local mapModel = getMap()
    if mapModel then
        local gunDropPart = mapModel:FindFirstChild("GunDrop", true)
        if gunDropPart and gunDropPart:IsA("BasePart") then
            return gunDropPart
        else
            return nil
        end
    else
        return nil
    end
end
function utilityFunctions.ToggleNotifyGunDropped(notifyGunDroppedEnabled)
    utilityFunctions.Config.NotifyGunDropped = notifyGunDroppedEnabled
    if descendantAddedConnection then
        descendantAddedConnection:Disconnect()
        descendantAddedConnection = nil
    end
    droppedGun = nil
    if notifyGunDroppedEnabled then
        pcall(function()
            local foundGunDropPart = findGunDropPart()
            if foundGunDropPart then
                notifyGunDropped(foundGunDropPart)
            end
        end)
        descendantAddedConnection = addConnection(workspaceService.DescendantAdded:Connect(function(potentialGunDrop)
            if utilityFunctions.Config.NotifyGunDropped then
                if potentialGunDrop and potentialGunDrop.Parent then
                    if potentialGunDrop.Name == "GunDrop" and potentialGunDrop:IsA("BasePart") then
                        notifyGunDropped(potentialGunDrop)
                    end
                end
            else
                return
            end
        end))
        task.spawn(function()
            while utilityFunctions.Config.NotifyGunDropped do
                pcall(function()
                    if droppedGun and not droppedGun.Parent then
                        droppedGun = nil
                    end
                end)
                task.wait(1)
            end
        end)
    end
end
function utilityFunctions.PlayEmote(emoteId)
    local remotesFolder = replicatedStorageService:FindFirstChild("Remotes")
    if remotesFolder and remotesFolder:FindFirstChild("PlayEmote") then
        remotesFolder.PlayEmote:Fire(emoteId)
    elseif replicatedStorageService:FindFirstChild("PlayEmote", true) then
        replicatedStorageService:FindFirstChild("PlayEmote", true):Fire(emoteId)
    end
end
local silentThrowTask = nil
function utilityFunctions.ExecuteThrowAtNearest()
    local knifeToolEquip = not utilityFunctions.Backpack:FindFirstChild("Knife") and utilityFunctions.Character
    if knifeToolEquip then
        knifeToolEquip = utilityFunctions.Character:FindFirstChild("Knife")
    end
    if knifeToolEquip and (knifeToolEquip.Parent == utilityFunctions.Backpack and utilityFunctions.Humanoid) then
        utilityFunctions.Humanoid:EquipTool(knifeToolEquip)
        task.wait(0.1)
        knifeToolEquip = utilityFunctions.Character:FindFirstChild("Knife")
    end
    if knifeToolEquip and knifeToolEquip:FindFirstChild("Throw") then
        local rootPartPosition = utilityFunctions.RootPart.Position
        local playersService9 = playersService
        local ipairsIteratorAttack, playerIterator, playerIndex = ipairs(playersService9:GetPlayers())
        local closestDistance = 1000
        local closestHumanoidRootPart = nil
        while true do
            local currentPlayer
            playerIndex, currentPlayer = ipairsIteratorAttack(playerIterator, playerIndex)
            if playerIndex == nil then
                break
            end
            if currentPlayer ~= utilityFunctions.Player and currentPlayer.Character and currentPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local humanoid = currentPlayer.Character:FindFirstChild("Humanoid")
                if humanoid and humanoid.Health > 0 then
                    local humanoidRootPart = currentPlayer.Character.HumanoidRootPart
                    local distanceToRootPart = (rootPartPosition - humanoidRootPart.Position).Magnitude
                    if distanceToRootPart < closestDistance then
                        closestHumanoidRootPart = humanoidRootPart
                        closestDistance = distanceToRootPart
                    end
                end
            end
        end
        if closestHumanoidRootPart then
            local predictedPosition = closestHumanoidRootPart.Position + closestHumanoidRootPart.AssemblyLinearVelocity * 0.05 * (closestDistance / 100)
            local throwCFrame = CFrame.new(rootPartPosition, predictedPosition)
            knifeToolEquip.Throw:FireServer(throwCFrame, predictedPosition)
        end
    end
end
function utilityFunctions.ToggleSilentThrow(enableSilentThrow)
    utilityFunctions.Config.SilentThrow = enableSilentThrow
    if silentThrowTask then
        task.cancel(silentThrowTask)
        silentThrowTask = nil
    end
    if enableSilentThrow then
        silentThrowTask = task.spawn(function()
            while utilityFunctions.Config.SilentThrow do
                if utilityFunctions.FindMurderer() == utilityFunctions.Player then
                    utilityFunctions.ExecuteThrowAtNearest()
                end
                task.wait(0.8)
            end
        end)
    end
end
function utilityFunctions.ChatRoles()
    local murdererPlayer = utilityFunctions.FindMurderer()
    local sheriffPlayer = utilityFunctions.FindSheriff()
    local visionHubMessage = "Vision Hub >> Murderer: " .. (murdererPlayer and murdererPlayer.Name or "Unknown") .. " | Sheriff: " .. (sheriffPlayer and sheriffPlayer.Name or "Unknown")
    if textChatService.ChatVersion ~= Enum.ChatVersion.TextChatService then
        local defaultChatSystemChatEvents = replicatedStorageService:FindFirstChild("DefaultChatSystemChatEvents")
        if defaultChatSystemChatEvents and defaultChatSystemChatEvents:FindFirstChild("SayMessageRequest") then
            defaultChatSystemChatEvents.SayMessageRequest:FireServer(visionHubMessage, "Normal")
        end
    else
        local textChannelsFolder = textChatService:FindFirstChild("TextChannels")
        if textChannelsFolder and textChannelsFolder:FindFirstChild("RBXGeneral") then
            textChannelsFolder.RBXGeneral:SendAsync(visionHubMessage)
        end
    end
end
local timerTask = nil
local visionTimerGui = nil
local function formatTime(seconds)
    if not seconds or seconds == - 1 then
        return ""
    end
    local minutes = math.floor(seconds / 60)
    local remainingSeconds = seconds % 60
    return string.format("%dm %ds", minutes, remainingSeconds)
end
function utilityFunctions.ToggleRoundTimer(roundTimerEnabled)
    utilityFunctions.Config.RoundTimer = roundTimerEnabled
    if visionTimerGui then
        visionTimerGui:Destroy()
        visionTimerGui = nil
    end
    if timerTask then
        pcall(task.cancel, timerTask)
        timerTask = nil
    end
    if roundTimerEnabled then
        visionTimerGui = Instance.new("ScreenGui")
        visionTimerGui.Name = "VisionTimerGUI"
        visionTimerGui.ResetOnSpawn = false
        visionTimerGui.IgnoreGuiInset = true
        visionTimerGui.Parent = coreGuiService
        local timerTextLabel = Instance.new("TextLabel")
        timerTextLabel.Size = UDim2.fromOffset(200, 50)
        timerTextLabel.Position = UDim2.fromScale(0.5, 0.15)
        timerTextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        timerTextLabel.BackgroundTransparency = 1
        timerTextLabel.Font = Enum.Font.GothamBold
        timerTextLabel.TextScaled = true
        timerTextLabel.TextColor3 = Color3.fromHex("#E6F7FF")
        timerTextLabel.TextStrokeColor3 = Color3.fromHex("#000000")
        timerTextLabel.TextStrokeTransparency = 0
        timerTextLabel.Text = "Loading..."
        timerTextLabel.Parent = visionTimerGui
        timerTask = task.spawn(function()
            while visionTimerGui and visionTimerGui.Parent do
                local success, remainingTime = pcall(function()
                    return game.ReplicatedStorage.Remotes.Extras.GetTimer:InvokeServer()
                end)
                if success then
                    timerTextLabel.Text = formatTime(remainingTime)
                else
                    timerTextLabel.Text = "\239\191\189\239\191\189"
                end
                task.wait(0.5)
            end
        end)
    end
end
local timerTask = nil
local murdererNotified = false
local sheriffNotified = false
local function notifyRoles()
    while true do
        local success, serverTimerValue = pcall(function()
            return game.ReplicatedStorage.Remotes.Extras.GetTimer:InvokeServer()
        end)
        if success and (type(serverTimerValue) ~= "number" or serverTimerValue > 1) then
            if success and (type(serverTimerValue) == "number" and 1 < serverTimerValue) then
                local murdererToNotify = utilityFunctions.Config.NotifyMurderer and (not murdererNotified and utilityFunctions.FindMurderer())
                if murdererToNotify then
                    murdererNotified = true
                    pcall(function()
                        visionHub:Notify({
                            Title = "Murderer Detected!",
                            Content = murdererToNotify.Name,
                            Icon = "rbxthumb://type=AvatarHeadShot&id=" .. murdererToNotify.UserId .. "&w=150&h=150",
                            Duration = 8,
                            TitleColor = Color3.fromRGB(255, 0, 0),
                            IconColor = Color3.fromRGB(255, 255, 255),
                            BackgroundColor = Color3.fromHex("#030407"),
                            CloseButtonColor = Color3.fromHex("#00BFFF")
                        })
                    end)
                end
                local sheriffToNotify = utilityFunctions.Config.NotifySheriff and (not sheriffNotified and utilityFunctions.FindSheriff())
                if sheriffToNotify then
                    sheriffNotified = true
                    pcall(function()
                        visionHub:Notify({
                            Title = "Sheriff Detected!",
                            Content = sheriffToNotify.Name,
                            Icon = "rbxthumb://type=AvatarHeadShot&id=" .. sheriffToNotify.UserId .. "&w=150&h=150",
                            Duration = 8,
                            TitleColor = Color3.fromRGB(0, 0, 255),
                            IconColor = Color3.fromRGB(255, 255, 255),
                            BackgroundColor = Color3.fromHex("#030407"),
                            CloseButtonColor = Color3.fromHex("#00BFFF")
                        })
                    end)
                end
            end
        else
            murdererNotified = false
            sheriffNotified = false
        end
        task.wait(1)
    end
end
function utilityFunctions.UpdateRoleNotify()
    if timerTask then
        task.cancel(timerTask)
        timerTask = nil
    end
    if utilityFunctions.Config.NotifyMurderer or utilityFunctions.Config.NotifySheriff then
        timerTask = task.spawn(notifyRoles)
    end
end
function utilityFunctions.CreateGuiButton(buttonName, buttonConfig, buttonCallback)
    if utilityFunctions.MobileButtons[buttonName] then
        if utilityFunctions.MobileButtons[buttonName].Parent then
            utilityFunctions.MobileButtons[buttonName]:Destroy()
        end
        utilityFunctions.MobileButtons[buttonName] = nil
    end
    if buttonConfig.Enabled then
        local visionButtonGui = Instance.new("ScreenGui")
        visionButtonGui.Name = "VisionBtn_" .. buttonName
        visionButtonGui.Parent = coreGuiService
        visionButtonGui.ResetOnSpawn = false
        visionButtonGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        utilityFunctions.MobileButtons[buttonName] = visionButtonGui
        local pairsIterator, iterator, iteratorState = pairs(utilityFunctions.MobileButtons)
        local buttonIndex = 0
        while true do
            local buttonNameIterator, buttonInstance = pairsIterator(iterator, iteratorState)
            if buttonNameIterator == nil then
                break
            end
            iteratorState = buttonNameIterator
            if buttonInstance and buttonInstance.Parent then
                buttonIndex = buttonIndex + 1
            end
        end
        local button
        if buttonConfig.Type ~= "Text" then
            button = Instance.new("ImageButton")
            button.Image = buttonConfig.Icon or ""
            button.ImageColor3 = buttonConfig.ImageColor or Color3.fromHex("#E6F7FF")
        else
            button = Instance.new("TextButton")
            button.Text = buttonConfig.Text or buttonName
            button.TextColor3 = buttonConfig.TextColor or Color3.new(1, 1, 1)
            button.TextScaled = true
            button.Font = Enum.Font.GothamBold
        end
        button.Name = "ActionBtn"
        button.Size = UDim2.fromOffset(60, 60)
        local buttonYPosition = 0.45 + buttonIndex * 0.08
        local clampedButtonYPosition = buttonYPosition > 0.8 and 0.45 or buttonYPosition
        button.Position = UDim2.new(0.9, - 20, clampedButtonYPosition, 0)
        button.BackgroundColor3 = Color3.fromHex("#09202B")
        button.BackgroundTransparency = 0.3
        button.AutoButtonColor = true
        button.Parent = visionButtonGui
        local uiCorner = Instance.new("UICorner")
        uiCorner.CornerRadius = UDim.new(1, 0)
        uiCorner.Parent = button
        local buttonUIStroke = Instance.new("UIStroke")
        buttonUIStroke.Color = Color3.fromHex("#00BFFF")
        buttonUIStroke.Thickness = 2.5
        buttonUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        buttonUIStroke.Parent = button
        local isDragging = false
        local mousePosition = nil
        local buttonPosition = nil
        local isDragging = false
        button.InputBegan:Connect(function(inputObject)
            if inputObject.UserInputType == Enum.UserInputType.MouseButton1 or inputObject.UserInputType == Enum.UserInputType.Touch then
                isDragging = true
                isDragging = false
                mousePosition = inputObject.Position
                buttonPosition = button.Position
            end
        end)
        button.InputChanged:Connect(function(currentInputObject)
            if (currentInputObject.UserInputType == Enum.UserInputType.MouseMovement or currentInputObject.UserInputType == Enum.UserInputType.Touch) and isDragging then
                if utilityFunctions.Config.ButtonsLocked then
                    return
                end
                local mouseDelta = currentInputObject.Position - mousePosition
                if mouseDelta.Magnitude > 3 then
                    isDragging = true
                end
                local viewportSize = workspace.CurrentCamera.ViewportSize
                local _ = buttonPosition.X.Scale * viewportSize.X + buttonPosition.X.Offset
                local _ = buttonPosition.Y.Scale * viewportSize.Y + buttonPosition.Y.Offset
                button.Position = UDim2.new(buttonPosition.X.Scale, buttonPosition.X.Offset + mouseDelta.X, buttonPosition.Y.Scale, buttonPosition.Y.Offset + mouseDelta.Y)
            end
        end)
        button.InputEnded:Connect(function(inputObject)
            if inputObject.UserInputType == Enum.UserInputType.MouseButton1 or inputObject.UserInputType == Enum.UserInputType.Touch then
                isDragging = false
                if (not isDragging or utilityFunctions.Config.ButtonsLocked) and buttonCallback then
                    local textColor = buttonUIStroke.Color
                    buttonUIStroke.Color = Color3.new(1, 1, 1)
                    task.spawn(buttonCallback)
                    task.delay(0.15, function()
                        if buttonUIStroke and buttonUIStroke.Parent then
                            buttonUIStroke.Color = textColor
                        end
                    end)
                end
            end
        end)
    end
end
visionHub:AddTheme({
    Name = "Default",
    Accent = Color3.fromHex("#00BFFF"),
    Dialog = Color3.fromHex("#071021"),
    Outline = Color3.fromHex("#BFEFFF"),
    Text = Color3.fromHex("#E6F7FF"),
    Placeholder = Color3.fromHex("#6F8892"),
    Background = Color3.fromHex("#030407"),
    Button = Color3.fromHex("#09202B"),
    Icon = Color3.fromHex("#89F7FF")
})
local visionHubWindow = visionHub:CreateWindow({
    Title = "Vision Hub",
    Author = "by orialdev",
    Folder = "VisionHub",
    Theme = "Default",
    Icon = "https://raw.githubusercontent.com/orialdev2/Vision-Hub/refs/heads/main/Vision_Logo1.png",
    IconSize = 50,
    NewElements = true,
    OpenButton = {
        Title = "Vision Hub",
        CornerRadius = UDim.new(1, 0),
        StrokeThickness = 3,
        Enabled = true,
        Draggable = true,
        OnlyMobile = true,
        Color = ColorSequence.new(Color3.fromHex("#00BFFF"), Color3.fromHex("#89F7FF"))
    }
})
visionHubWindow.ConfigManager:CreateConfig("Default")
local visionHubGui = visionHubWindow
local homeTab = visionHubWindow.Tab(visionHubGui, {
    Title = "Home",
    Icon = "house"
})
local visionHubGui = visionHubWindow
local movementTab = visionHubWindow.Tab(visionHubGui, {
    Title = "Movement",
    Icon = "footprints"
})
local visionHubGui = visionHubWindow
local combatTab = visionHubWindow.Tab(visionHubGui, {
    Title = "Combat",
    Icon = "swords"
})
local visionHubGui = visionHubWindow
local visualsTab = visionHubWindow.Tab(visionHubGui, {
    Title = "Visuals",
    Icon = "eye"
})
local visionHubGui = visionHubWindow
local buttonsTab = visionHubWindow.Tab(visionHubGui, {
    Title = "Buttons",
    Icon = "square-mouse-pointer"
})
local visionHubGui = visionHubWindow
local teleportsTab = visionHubWindow.Tab(visionHubGui, {
    Title = "Teleports",
    Icon = "map-pin"
})
local visionHubGui = visionHubWindow
local miscTab = visionHubWindow.Tab(visionHubGui, {
    Title = "Misc",
    Icon = "box"
})
local visionHubGui = visionHubWindow
local farmingTab = visionHubWindow.Tab(visionHubGui, {
    Title = "Farming",
    Icon = "dollar-sign"
})
local visionHubGui = visionHubWindow
local settingsTab = visionHubWindow.Tab(visionHubGui, {
    Title = "Settings",
    Icon = "settings"
})
homeTab:Paragraph({
    Title = "Welcome to Vision Hub!",
    Desc = "Thanks for using Vision Hub, Join our Discord for support and updates.",
    Thumbnail = "https://raw.githubusercontent.com/orialdev2/Vision-Hub/refs/heads/main/Vision.png",
    ThumbnailSize = 160,
    Buttons = {
        {
            Title = "Join Discord",
            Icon = "geist:logo-discord",
            Callback = function()
                if setclipboard then
                    setclipboard("https://discord.gg/TZHgrMUKGJ")
                    visionHubWindow:Dialog({
                        Title = "Discord Link Copied",
                        Icon = "geist:logo-discord",
                        Content = "The Discord invite link has been copied to your clipboard.",
                        Buttons = {
                            {
                                Title = "OK",
                                Icon = "check"
                            }
                        }
                    })
                end
            end
        }
    }
})
homeTab:Space()
homeTab:Code({
    Title = "Changelog 1.8.0",
    Code = "\r\n[VisionHub]\r\n+ 1.8.0 released!\r\n\r\n+ Fully rewritten codebase\r\n+ Fixed several bugs and stability issues\r\n+ UI reorganized with buttons for all features\r\n\r\n+ Added Save/Load Config\r\n+ Added Auto Knife Throw\r\n+ Added Throw Knife\r\n\r\n- Removed Fly\r\n\r\n+ Reworked and optimized ESP Players (lag and instability fixed)\r\n+ Reworked Grab Gun and Auto Grab Gun\r\n+ Reworked and optimized God Mode\r\n+ Reworked and optimized Anti-Fling (lag and instability fixed)\r\n+ Reworked and optimized Noclip (lag and instability fixed)\r\n+ Reworked Knife Aura\r\n+ Reworked and optimized Kill All and Auto Kill All (lag and instability fixed)\r\n+ Optimized Auto Shoot Murderer\r\n+ Optimized Fling\r\n\r\n+ Complete ESP redesign\r\n\r\n+ Fully rewritten code\r\n+ Fixed bugs, crashes, and instability\r\n+ More features coming soon\r\n    "
})
homeTab:Space()
homeTab:Label({
    Title = "Did you find any error?",
    Desc = "-- For any bugs or errors, contact us on Discord. --"
})
local movementSection = movementTab:Section({
    Title = "Movement",
    Desc = "Modify your character\'s movement",
    Icon = "footprints",
    TextXAlignment = "Center",
    Opened = true
})
movementSection:Toggle({
    Title = "Enable WalkSpeed",
    Desc = "Allow custom WalkSpeed",
    Flag = "EnableWalkspeedToggle",
    Callback = utilityFunctions.EnableWalkSpeed
})
movementSection:Slider({
    Title = "WalkSpeed",
    Desc = "Set your WalkSpeed",
    Flag = "WalkspeedSlider",
    Value = {
        Min = 16,
        Max = 200,
        Default = utilityFunctions.Config.WalkSpeed
    },
    Callback = utilityFunctions.SetWalkSpeed
})
movementSection:Space()
movementSection:Toggle({
    Title = "Enable JumpPower",
    Desc = "Allow custom JumpPower",
    Flag = "EnableJumppowerToggle",
    Callback = utilityFunctions.EnableJumpPower
})
movementSection:Slider({
    Title = "Jump Power",
    Desc = "Set your JumpPower",
    Flag = "JumppowerSlider",
    Value = {
        Min = 50,
        Max = 300,
        Default = utilityFunctions.Config.JumpPower
    },
    Callback = utilityFunctions.SetJumpPower
})
movementSection:Space()
movementSection:Toggle({
    Title = "Enable Noclip",
    Desc = "Walk through walls",
    Flag = "NoclipToggle",
    Callback = utilityFunctions.EnableNoclip
})
movementSection:Toggle({
    Title = "Infinite Jump",
    Desc = "Jump infinitely",
    Flag = "InfiniteJumpToggle",
    Callback = utilityFunctions.InfiniteJump
})
movementSection:Button({
    Title = "Reset Character",
    Desc = "Respawn your character",
    Icon = "refresh-cw",
    Callback = function()
        if utilityFunctions.Character then
            utilityFunctions.Character:BreakJoints()
        end
    end
})
local combatMultiSection = combatTab:MultiSection({
    Title = "Combat",
    Subtitle = "Enhance your combat abilities",
    TextXAlignment = "Center",
    Icon = "swords",
    Sections = {
        {
            "General",
            "backpack"
        },
        {
            "Murderer",
            "skull"
        },
        {
            "Sheriff",
            "shield"
        }
    }
})
combatMultiSection.General:ButtonKeybind({
    Title = "Grab Gun",
    Desc = "Picks up gun from the map",
    Key = "G",
    Flag = "GrabGunKeybind",
    Icon = "hand",
    Callback = utilityFunctions.GrabGun
})
combatMultiSection.General:Toggle({
    Title = "Auto Grab Gun",
    Desc = "Automatically grab gun from the map",
    Flag = "AutoGrabGunToggle",
    Callback = utilityFunctions.ToggleAutoGrabGun
})
combatMultiSection.General:Space()
combatMultiSection.General:Toggle({
    Title = "God Mode",
    Desc = "Grants an extra life",
    Flag = "GodModeToggle",
    Callback = function(godModeEnabled)
        utilityFunctions.EnableGodMode(godModeEnabled)
    end
})
combatMultiSection.General:Toggle({
    Title = "Anti-Fling",
    Desc = "Prevents players from flinging you",
    Flag = "AntiFlingToggle",
    Callback = utilityFunctions.ToggleAntiFling
})
combatMultiSection.Murderer:ButtonKeybind({
    Title = "Kill All",
    Desc = "Kill all players in the round",
    Key = "K",
    Flag = "KillAllKeybind",
    Icon = "skull",
    Callback = utilityFunctions.KillAll
})
combatMultiSection.Murderer:Toggle({
    Title = "Auto Kill All",
    Desc = "Automatically kill players",
    Flag = "AutoKillToggle",
    Callback = function(autoKillAllEnabled)
        utilityFunctions.ToggleAutoKillAll(autoKillAllEnabled)
    end
})
combatMultiSection.Murderer:Space()
combatMultiSection.Murderer:Toggle({
    Title = "Knife Aura",
    Desc = "Kill players within a certain radius",
    Flag = "KillAuraToggle",
    Callback = function(killAuraEnabled)
        utilityFunctions.KillAura(killAuraEnabled)
    end
})
combatMultiSection.Murderer:Slider({
    Title = "Knife Aura Radius",
    Desc = "Sets the detection radius",
    Flag = "AuraRadiusSlider",
    Value = {
        Min = 5,
        Max = 100,
        Default = utilityFunctions.Config.AuraRadius
    },
    Callback = function(auraRadius)
        utilityFunctions.Config.AuraRadius = auraRadius
    end
})
combatMultiSection.Murderer:Space()
combatMultiSection.Murderer:Toggle({
    Title = "Auto Knife Throw",
    Desc = "Automatically throws a knife at the nearest player",
    Flag = "ThrowKnifeFlag",
    Callback = function(silentThrowEnabled)
        utilityFunctions.ToggleSilentThrow(silentThrowEnabled)
    end
})
combatMultiSection.Murderer:ButtonKeybind({
    Title = "Throw Knife",
    Desc = "Throws the knife at the nearest player",
    Icon = "crosshair",
    Key = "Q",
    Callback = function()
        utilityFunctions.ExecuteThrowAtNearest()
    end
})
combatMultiSection.Sheriff:Toggle({
    Title = "Auto Shoot Murderer",
    Desc = "Automatically shoots the murderer",
    Flag = "AutoShootMurderer",
    Callback = function(autoShootMurdererEnabled)
        utilityFunctions.ToggleAutoShootMurderer(autoShootMurdererEnabled)
    end
})
combatMultiSection.Sheriff:ButtonKeybind({
    Title = "Shoot Murderer",
    Desc = "Press to shoot murderer",
    Icon = "crosshair",
    Key = "E",
    Callback = function()
        utilityFunctions.ShootMurdererOnce()
    end
})
if not coreGuiService:FindFirstChild("VisionESP") then
    local visionEspFolder = Instance.new("Folder")
    visionEspFolder.Name = "VisionESP"
    visionEspFolder.Parent = coreGuiService
end
local function createNameEsp(adorneePart)
    local nameBillboardGui = Instance.new("BillboardGui")
    nameBillboardGui.Name = "NameESP"
    nameBillboardGui.Adornee = adorneePart
    nameBillboardGui.Size = UDim2.new(0, 200, 0, 50)
    nameBillboardGui.StudsOffset = Vector3.new(0, 3, 0)
    nameBillboardGui.AlwaysOnTop = true
    local visionEspTextLabel = Instance.new("TextLabel")
    visionEspTextLabel.BackgroundTransparency = 1
    visionEspTextLabel.Size = UDim2.new(1, 0, 1, 0)
    visionEspTextLabel.TextSize = 16
    visionEspTextLabel.TextScaled = false
    visionEspTextLabel.Font = Enum.Font.SourceSansBold
    visionEspTextLabel.TextColor3 = Color3.new(1, 1, 1)
    visionEspTextLabel.TextStrokeTransparency = 0
    visionEspTextLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    visionEspTextLabel.Parent = nameBillboardGui
    return nameBillboardGui
end
local function updatePlayerHighlights()
    local playersService = playersService
    local ipairsIterator, playerIteratorState, playerIndex = ipairs(playersService:GetPlayers())
    while true do
        local player
        playerIndex, player = ipairsIterator(playerIteratorState, playerIndex)
        if playerIndex == nil then
            break
        end
        if player ~= utilityFunctions.Player and player.Character then
            local roleColor = Color3.fromRGB(0, 255, 0)
            local isMurderer = utilityFunctions.FindMurderer() == player
            local isSheriff = utilityFunctions.FindSheriff() == player
            local playerRole
            if utilityFunctions.PlayerData[player.Name] and utilityFunctions.PlayerData[player.Name].Role == "Hero" then
                roleColor = Color3.fromRGB(255, 255, 0)
                playerRole = "Hero"
            else
                playerRole = "Innocent"
            end
            if isMurderer then
                roleColor = Color3.fromRGB(255, 0, 0)
                playerRole = "Murderer"
            elseif isSheriff then
                roleColor = Color3.fromRGB(0, 0, 255)
                playerRole = "Sheriff"
            end
            local character = player.Character
            if utilityFunctions.Config.EspPlayers then
                if not character:FindFirstChild("VisionHighlight") then
                    local visionHighlight = Instance.new("Highlight")
                    visionHighlight.Name = "VisionHighlight"
                    visionHighlight.FillTransparency = 0.85
                    visionHighlight.OutlineTransparency = 0
                    visionHighlight.Parent = character
                end
                local existingHighlight = character:FindFirstChild("VisionHighlight")
                if existingHighlight then
                    existingHighlight.FillColor = roleColor
                    existingHighlight.OutlineColor = roleColor
                    existingHighlight.Enabled = true
                end
            elseif character:FindFirstChild("VisionHighlight") then
                character.VisionHighlight:Destroy()
            end
            if utilityFunctions.Config.ShowNames then
                local head = character:FindFirstChild("Head")
                if head then
                    if not head:FindFirstChild("NameESP") then
                        createNameEsp(head).Parent = head
                    end
                    local nameTextLabel = head:FindFirstChild("NameESP")
                    if nameTextLabel then
                        nameTextLabel = nameTextLabel:FindFirstChild("TextLabel")
                    end
                    local localPlayerRootPart = utilityFunctions.RootPart
                    local otherPlayerRootPart = character:FindFirstChild("HumanoidRootPart") or character.PrimaryPart
                    local distanceString = not (localPlayerRootPart and otherPlayerRootPart) and "Unknown" or math.floor((localPlayerRootPart.Position - otherPlayerRootPart.Position).Magnitude)
                    if nameTextLabel then
                        nameTextLabel.Text = string.format("%s\n[%s] [%s]", player.Name, playerRole, tostring(distanceString))
                        nameTextLabel.TextColor3 = roleColor
                    end
                end
            elseif character:FindFirstChild("Head") and character.Head:FindFirstChild("NameESP") then
                character.Head.NameESP:Destroy()
            end
        end
    end
end
local renderSteppedConnection = nil
local function updatePlayerHighlights(enableEsp)
    if enableEsp then
        if not renderSteppedConnection then
            renderSteppedConnection = addConnection(runService.RenderStepped:Connect(updatePlayerHighlights))
        end
    elseif not (utilityFunctions.Config.EspPlayers or utilityFunctions.Config.ShowNames) then
        if renderSteppedConnection then
            renderSteppedConnection:Disconnect()
            renderSteppedConnection = nil
        end
        local playerList = playersService
        local ipairsIterator2, playerIteratorState2, playerIndex2 = ipairs(playerList:GetPlayers())
        while true do
            local playerInstance
            playerIndex2, playerInstance = ipairsIterator2(playerIteratorState2, playerIndex2)
            if playerIndex2 == nil then
                break
            end
            if playerInstance.Character then
                if playerInstance.Character:FindFirstChild("VisionHighlight") then
                    playerInstance.Character.VisionHighlight:Destroy()
                end
                if playerInstance.Character:FindFirstChild("Head") and playerInstance.Character.Head:FindFirstChild("NameESP") then
                    playerInstance.Character.Head.NameESP:Destroy()
                end
            end
        end
    end
end
local gunDropDescendantAddedConnection = nil
local function removeGunEsp()
    local workspaceService = workspaceService
    local ipairsIterator, gunDropIteratorState, descendantIndex = ipairs(workspaceService:GetDescendants())
    while true do
        local descendantInstance
        descendantIndex, descendantInstance = ipairsIterator(gunDropIteratorState, descendantIndex)
        if descendantIndex == nil then
            break
        end
        if descendantInstance.Name == "GunDrop" then
            if descendantInstance:FindFirstChild("VisionGunHighlight") then
                descendantInstance.VisionGunHighlight:Destroy()
            end
            if descendantInstance:FindFirstChild("VisionGunLabel") then
                descendantInstance.VisionGunLabel:Destroy()
            end
        end
    end
end
local function applyGunHighlight(part)
    if part and part:IsA("BasePart") then
        if part:FindFirstChild("VisionGunHighlight") then
            part.VisionGunHighlight:Destroy()
        end
        if part:FindFirstChild("VisionGunLabel") then
            part.VisionGunLabel:Destroy()
        end
        local visionGunHighlight = Instance.new("Highlight")
        visionGunHighlight.Name = "VisionGunHighlight"
        visionGunHighlight.Adornee = part
        visionGunHighlight.FillColor = Color3.fromRGB(0, 255, 255)
        visionGunHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        visionGunHighlight.FillTransparency = 0.5
        visionGunHighlight.OutlineTransparency = 0
        visionGunHighlight.Parent = part
        local visionGunLabelGui = Instance.new("BillboardGui")
        visionGunLabelGui.Name = "VisionGunLabel"
        visionGunLabelGui.Adornee = part
        visionGunLabelGui.Size = UDim2.new(0, 150, 0, 50)
        visionGunLabelGui.StudsOffset = Vector3.new(0, 2, 0)
        visionGunLabelGui.AlwaysOnTop = true
        local droppedGunTextLabel = Instance.new("TextLabel")
        droppedGunTextLabel.BackgroundTransparency = 1
        droppedGunTextLabel.Size = UDim2.new(1, 0, 1, 0)
        droppedGunTextLabel.TextSize = 14
        droppedGunTextLabel.Font = Enum.Font.GothamBold
        droppedGunTextLabel.Text = "DROPPED GUN"
        droppedGunTextLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
        droppedGunTextLabel.TextStrokeTransparency = 0
        droppedGunTextLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
        droppedGunTextLabel.Parent = visionGunLabelGui
        visionGunLabelGui.Parent = part
    end
end
function utilityFunctions.ToggleGunESP(espDroppedGunEnabled)
    utilityFunctions.Config.EspDroppedGun = espDroppedGunEnabled
    if gunDropDescendantAddedConnection then
        gunDropDescendantAddedConnection:Disconnect()
        gunDropDescendantAddedConnection = nil
    end
    if espDroppedGunEnabled then
        local workspaceService2 = workspaceService
        local ipairsIterator2, descendantIteratorState, descendantIndex2 = ipairs(workspaceService2:GetDescendants())
        while true do
            local descendant
            descendantIndex2, descendant = ipairsIterator2(descendantIteratorState, descendantIndex2)
            if descendantIndex2 == nil then
                break
            end
            if descendant.Name == "GunDrop" then
                applyGunHighlight(descendant)
            end
        end
        gunDropDescendantAddedConnection = addConnection(workspaceService.DescendantAdded:Connect(function(droppedGunPart)
            if droppedGunPart.Name == "GunDrop" then
                task.wait()
                applyGunHighlight(droppedGunPart)
            end
        end))
    else
        removeGunEsp()
    end
end
local visualsSection = visualsTab:MultiSection({
    Title = "Visuals",
    Subtitle = "Enhance your in-game vision",
    TextXAlignment = "Center",
    Icon = "eye",
    Sections = {
        {
            "ESP",
            "eye"
        },
        {
            "Notify",
            "bell"
        }
    }
})
visualsSection.ESP:Toggle({
    Title = "ESP Players",
    Desc = "Highlight players in round",
    Flag = "EspToggle",
    Callback = function(espPlayersEnabled)
        utilityFunctions.Config.EspPlayers = espPlayersEnabled
        updatePlayerHighlights(espPlayersEnabled or utilityFunctions.Config.ShowNames)
    end
})
visualsSection.ESP:Toggle({
    Title = "Show Informations",
    Desc = "Show name, role and distance",
    Flag = "ShowNamesToggle",
    Callback = function(showNamesEnabled)
        utilityFunctions.Config.ShowNames = showNamesEnabled
        updatePlayerHighlights(showNamesEnabled or utilityFunctions.Config.EspPlayers)
    end
})
visualsSection.ESP:Toggle({
    Title = "ESP Dropped Gun",
    Desc = "Highlights gun and shows text when dropped",
    Flag = "EspGunToggle",
    Callback = function(enableGunEsp)
        utilityFunctions.ToggleGunESP(enableGunEsp)
    end
})
visualsSection.ESP:Space()
visualsSection.ESP:Toggle({
    Title = "Round Timer",
    Desc = "Displays the round timer",
    Flag = "RoundTimerToggle",
    Callback = function(enableRoundTimer)
        utilityFunctions.ToggleRoundTimer(enableRoundTimer)
    end
})
visualsSection.Notify:Toggle({
    Title = "Notify Gun Dropped",
    Desc = "Get notified when a gun is dropped",
    Flag = "NotifyGunDroppedToggle",
    Callback = function(enableNotifyGunDropped)
        utilityFunctions.ToggleNotifyGunDropped(enableNotifyGunDropped)
    end
})
visualsSection.Notify:Toggle({
    Title = "Notify Murderer",
    Desc = "Alert and show picture when Murderer spawns",
    Flag = "NotifyMurdererToggle",
    Callback = function(notifyMurderer)
        utilityFunctions.Config.NotifyMurderer = notifyMurderer
        utilityFunctions.UpdateRoleNotify()
    end
})
visualsSection.Notify:Toggle({
    Title = "Notify Sheriff",
    Desc = "Alert and show picture when Sheriff spawns",
    Flag = "NotifySheriffToggle",
    Callback = function(notifySheriff)
        utilityFunctions.Config.NotifySheriff = notifySheriff
        utilityFunctions.UpdateRoleNotify()
    end
})
local buttonsSection = buttonsTab:Section({
    Title = "Buttons",
    Subtitle = "Customize your action Buttons",
    Opened = true,
    TextXAlignment = "Center",
    Icon = "square-mouse-pointer"
})
buttonsSection:Toggle({
    Title = "Lock Buttons",
    Desc = "Lock mobile button positions.",
    Flag = "lock_buttons",
    Callback = function(buttonsLocked)
        utilityFunctions.Config.ButtonsLocked = buttonsLocked
    end
})
buttonsSection:Space()
buttonsSection:Toggle({
    Title = "Show Shoot Button",
    Desc = "Adds shoot image button.",
    Flag = "show_shoot_button",
    Callback = function(shootEnabled)
        utilityFunctions.CreateGuiButton("Shoot", {
            Enabled = shootEnabled,
            Type = "Image",
            Icon = "rbxassetid://139650104834071"
        }, utilityFunctions.ShootMurdererOnce)
    end
})
buttonsSection:Space()
buttonsSection:Toggle({
    Title = "Fling Murderer Button",
    Desc = "Fling the murderer.",
    Flag = "show_fmurderer_button",
    Callback = function(flingMurdererButtonEnabled)
        utilityFunctions.CreateGuiButton("FlingMurderer", {
            Enabled = flingMurdererButtonEnabled,
            Type = "Text",
            Text = "Fling Murderer",
            TextColor = Color3.fromRGB(255, 255, 255)
        }, function()
            local murdererPlayer = utilityFunctions.FindMurderer()
            if murdererPlayer and murdererPlayer.Character then
                updateCameraFocus(murdererPlayer)
            end
        end)
    end
})
buttonsSection:Toggle({
    Title = "Fling Sheriff Button",
    Desc = "Fling the sheriff.",
    Flag = "show_fsheriff_button",
    Callback = function(flingSheriffButtonEnabled)
        utilityFunctions.CreateGuiButton("FlingSheriff", {
            Enabled = flingSheriffButtonEnabled,
            Type = "Text",
            Text = "Fling Sheriff",
            TextColor = Color3.fromRGB(255, 255, 255)
        }, function()
            local sheriffPlayer = utilityFunctions.FindSheriff()
            if sheriffPlayer and sheriffPlayer.Character then
                updateCameraFocus(sheriffPlayer)
            end
        end)
    end
})
buttonsSection:Toggle({
    Title = "Fling Hero Button",
    Desc = "Fling the Hero player.",
    Flag = "show_fhero_button",
    Callback = function(flingHeroEnabled)
        utilityFunctions.CreateGuiButton("FlingHero", {
            Enabled = flingHeroEnabled,
            Type = "Text",
            Text = "Fling Hero",
            TextColor = Color3.fromRGB(255, 255, 255)
        }, function()
            if utilityFunctions.PlayerData then
                local pairsIterator, playerDataKey, playerName = pairs(utilityFunctions.PlayerData)
                while true do
                    local playerData
                    playerName, playerData = pairsIterator(playerDataKey, playerName)
                    if playerName == nil then
                        break
                    end
                    if playerData and (playerData.Role == "Hero" or playerData.role == "Hero") then
                        local playerInstance = playersService:FindFirstChild(playerName)
                        if playerInstance and playerInstance.Character then
                            updateCameraFocus(playerInstance)
                            return
                        end
                    end
                end
            end
        end)
    end
})
buttonsSection:Space()
buttonsSection:Toggle({
    Title = "Show Kill Button",
    Desc = "Adds Kill All button.",
    Flag = "show_kill_button",
    Callback = function(killAllEnabled)
        utilityFunctions.CreateGuiButton("Kill", {
            Enabled = killAllEnabled,
            Type = "Text",
            Text = "Kill All",
            TextColor = Color3.fromRGB(255, 255, 255)
        }, utilityFunctions.KillAll)
    end
})
buttonsSection:Toggle({
    Title = "Show Throw Knife Button",
    Desc = "Throw a knife at nearest.",
    Flag = "show_throw_knife_button",
    Callback = function(throwKnifeEnabled)
        utilityFunctions.CreateGuiButton("ThrowKnife", {
            Enabled = throwKnifeEnabled,
            Type = "Text",
            Text = "Throw Knife"
        }, utilityFunctions.ExecuteThrowAtNearest)
    end
})
buttonsSection:Space()
buttonsSection:Toggle({
    Title = "Show Grab Gun Button",
    Desc = "Grab or pick up a gun.",
    Flag = "show_grab_gun_button",
    Callback = function(grabGunEnabled)
        utilityFunctions.CreateGuiButton("GrabGun", {
            Enabled = grabGunEnabled,
            Type = "Text",
            Text = "Grab Gun"
        }, utilityFunctions.GrabGun)
    end
})
buttonsSection:Space()
buttonsSection:Toggle({
    Title = "Show Teleport Map Button",
    Desc = "Teleport to current map.",
    Flag = "show_teleport_button",
    Callback = function(isTeleportButtonEnabled)
        utilityFunctions.CreateGuiButton("Teleport", {
            Enabled = isTeleportButtonEnabled,
            Type = "Text",
            Text = "Teleport to Map"
        }, utilityFunctions.TeleportToMap)
    end
})
buttonsSection:Toggle({
    Title = "Show Teleport Lobby Button",
    Desc = "Teleport back to lobby.",
    Flag = "show_teleport_lobby_button",
    Callback = function(isTeleportLobbyButtonEnabled)
        utilityFunctions.CreateGuiButton("TeleportLobby", {
            Enabled = isTeleportLobbyButtonEnabled,
            Type = "Text",
            Text = "Teleport to Lobby"
        }, utilityFunctions.TeleportToLobby)
    end
})
local teleportsSection = teleportsTab:MultiSection({
    Title = "Teleports",
    Subtitle = "Player and world teleports",
    TextXAlignment = "Center",
    Icon = "map-pin",
    Sections = {
        {
            "Players",
            "user"
        },
        {
            "Roles",
            "crown"
        },
        {
            "Locations",
            "map-pin"
        }
    }
})
local selectedPlayer = nil
local selectPlayerDropdown = teleportsSection.Players:Dropdown({
    Title = "Select Player",
    Desc = "Choose a player to teleport to",
    Callback = function(playerNameData)
        selectedPlayer = utilityFunctions.GetPlayerByName(playerNameData.Title)
    end
})
local function refreshPlayerList()
    local playersService = playersService
    local ipairsIterator3, playerIndex, playerIndex = ipairs(playersService:GetPlayers())
    local playerList = {}
    while true do
        local player
        playerIndex, player = ipairsIterator3(playerIndex, playerIndex)
        if playerIndex == nil then
            break
        end
        if player ~= utilityFunctions.Player then
            table.insert(playerList, {
                Title = player.Name,
                Icon = "rbxthumb://type=AvatarHeadShot&id=" .. player.UserId .. "&w=150&h=150"
            })
        end
    end
    selectPlayerDropdown:Refresh(playerList)
end
refreshPlayerList()
addConnection(playersService.PlayerAdded:Connect(refreshPlayerList))
addConnection(playersService.PlayerRemoving:Connect(refreshPlayerList))
teleportsSection.Players:Button({
    Title = "Teleport to Player",
    Desc = "Teleport to the selected player",
    Icon = "arrow-right",
    Callback = function()
        if selectedPlayer then
            utilityFunctions.TeleportToPlayer(selectedPlayer)
        end
    end
})
teleportsSection.Roles:Button({
    Title = "Teleport to Murderer",
    Desc = "Teleport to the murderer",
    Icon = "skull",
    Callback = function()
        local murdererPlayer = utilityFunctions.FindMurderer()
        if murdererPlayer then
            utilityFunctions.TeleportToPlayer(murdererPlayer)
        end
    end
})
teleportsSection.Roles:Button({
    Title = "Teleport to Sheriff",
    Desc = "Teleport to the sheriff",
    Icon = "shield",
    Callback = function()
        local sheriffPlayer = utilityFunctions.FindSheriff()
        if sheriffPlayer then
            utilityFunctions.TeleportToPlayer(sheriffPlayer)
        end
    end
})
teleportsSection.Roles:Button({
    Title = "Teleport to Hero",
    Desc = "Teleport to the hero",
    Icon = "star",
    Callback = function()
        if utilityFunctions.PlayerData then
            local pairsIterator2, playerDataKey, playerDataValue = pairs(utilityFunctions.PlayerData)
            while true do
                local playerData
                playerDataValue, playerData = pairsIterator2(playerDataKey, playerDataValue)
                if playerDataValue == nil then
                    break
                end
                if playerData and (playerData.Role == "Hero" or playerData.role == "Hero") then
                    local playerInstance = playersService:FindFirstChild(playerDataValue)
                    if playerInstance then
                        utilityFunctions.TeleportToPlayer(playerInstance)
                        return
                    end
                end
            end
        end
    end
})
teleportsSection.Locations:Button({
    Title = "Lobby",
    Desc = "Return to the main lobby",
    Icon = "house",
    Callback = utilityFunctions.TeleportToLobby
})
teleportsSection.Locations:Button({
    Title = "Teleport to Map",
    Desc = "Teleports you to the current Map",
    Icon = "map",
    Callback = utilityFunctions.TeleportToMap
})
local miscellaneousSection = miscTab:MultiSection({
    Title = "Miscellaneous",
    Icon = "box",
    Subtitle = "Various fun features",
    TextXAlignment = "Center",
    Sections = {
        {
            "Fling",
            "wind"
        },
        {
            "Emotes",
            "smile"
        },
        {
            "Chat",
            "message-square"
        }
    }
})
local selectedPlayer = nil
local flingPlayerDropdown = miscellaneousSection.Fling:Dropdown({
    Title = "Select Player",
    Desc = "Choose a player",
    Callback = function(playerTitleData)
        selectedPlayer = playersService:FindFirstChild(playerTitleData.Title)
    end
})
local function updatePlayerList()
    local playersService2 = playersService
    local playerIterator, playerIndex2, playerIndex = ipairs(playersService2:GetPlayers())
    local playerList = {}
    while true do
        local player
        playerIndex, player = playerIterator(playerIndex2, playerIndex)
        if playerIndex == nil then
            break
        end
        if player ~= utilityFunctions.Player then
            table.insert(playerList, {
                Title = player.Name,
                Icon = "rbxthumb://type=AvatarHeadShot&id=" .. player.UserId .. "&w=150&h=150"
            })
        end
    end
    flingPlayerDropdown:Refresh(playerList)
end
updatePlayerList()
addConnection(playersService.PlayerAdded:Connect(updatePlayerList))
addConnection(playersService.PlayerRemoving:Connect(updatePlayerList))
miscellaneousSection.Fling:Button({
    Title = "Fling Player",
    Desc = "Fling the selected player into the air",
    Icon = "wind",
    Callback = function()
        if selectedPlayer and selectedPlayer.Character then
            updateCameraFocus(selectedPlayer)
        end
    end
})
miscellaneousSection.Fling:Button({
    Title = "Fling All Players",
    Desc = "Fling all players in the game",
    Icon = "wind",
    Callback = function()
        local playersService3 = playersService
        local allPlayersIterator, playerIndex3, allPlayersIndex = ipairs(playersService3:GetPlayers())
        while true do
            local currentPlayer
            allPlayersIndex, currentPlayer = allPlayersIterator(playerIndex3, allPlayersIndex)
            if allPlayersIndex == nil then
                break
            end
            if currentPlayer ~= utilityFunctions.Player and currentPlayer.Character then
                updateCameraFocus(currentPlayer)
            end
        end
    end
})
miscellaneousSection.Fling:Space()
miscellaneousSection.Fling:Button({
    Title = "Fling Murderer",
    Desc = "Fling the murderer into the air",
    Icon = "skull",
    Callback = function()
        local murderer = utilityFunctions.FindMurderer()
        if murderer and murderer.Character then
            updateCameraFocus(murderer)
        end
    end
})
miscellaneousSection.Fling:Button({
    Title = "Fling Sheriff",
    Desc = "Fling the sheriff into the air",
    Icon = "shield",
    Callback = function()
        local sheriff = utilityFunctions.FindSheriff()
        if sheriff and sheriff.Character then
            updateCameraFocus(sheriff)
        end
    end
})
miscellaneousSection.Fling:Button({
    Title = "Fling Hero",
    Desc = "Fling the hero into the air",
    Icon = "star",
    Callback = function()
        if utilityFunctions.PlayerData then
            local playerDataKey2, playerDataValue2, playerDataValue3 = pairs(utilityFunctions.PlayerData)
            while true do
                local playerData2
                playerDataValue3, playerData2 = playerDataKey2(playerDataValue2, playerDataValue3)
                if playerDataValue3 == nil then
                    break
                end
                if playerData2 and (playerData2.Role == "Hero" or playerData2.role == "Hero") then
                    local playerInstance2 = playersService:FindFirstChild(playerDataValue3)
                    if playerInstance2 and playerInstance2.Character then
                        updateCameraFocus(playerInstance2)
                        return
                    end
                end
            end
        end
    end
})
local selectedEmote = nil
miscellaneousSection.Emotes:Dropdown({
    Title = "Select Emote",
    Desc = "Choose an emote to play",
    Flag = "EmoteSelectDropdown",
    Values = {
        "sit",
        "zombie",
        "ninja",
        "zen",
        "floss",
        "dab"
    },
    Callback = function(unknownValue)
        selectedEmote = unknownValue
    end
})
miscellaneousSection.Emotes:Button({
    Title = "Play Emote",
    Desc = "Plays the selected emote",
    Icon = "play",
    Callback = function()
        if selectedEmote then
            utilityFunctions.PlayEmote(selectedEmote)
        end
    end
})
miscellaneousSection.Chat:Button({
    Title = "Expose Roles in Chat",
    Desc = "Says Murderer/Sheriff name in chat",
    Icon = "message-circle",
    Callback = utilityFunctions.ChatRoles
})
local settingsSection = settingsTab:MultiSection({
    Title = "Settings",
    Subtitle = "Configure your preferences",
    TextXAlignment = "Center",
    Icon = "settings",
    Sections = {
        {
            "Config",
            "save"
        },
        {
            "Theme",
            "paintbrush"
        }
    }
})
settingsTab:Space()
settingsSection.Config:Button({
    Title = "Save Config",
    Desc = "Saves your current settings",
    Icon = "save",
    Callback = function()
        visionHubWindow.CurrentConfig:Save()
        visionHub:Notify({
            Title = "Success",
            Content = "Configuration saved!",
            Icon = "save",
            Duration = 5,
            TitleColor = Color3.fromHex("#00BFFF"),
            ContentColor = Color3.fromHex("#E6F7FF"),
            IconColor = Color3.fromHex("#89F7FF"),
            BackgroundColor = Color3.fromHex("#030407"),
            ProgressBarColor = Color3.fromHex("#00BFFF"),
            CloseButtonColor = Color3.fromHex("#00BFFF")
        })
    end
})
settingsSection.Config:Button({
    Title = "Load Config",
    Desc = "Loads your previously saved settings",
    Icon = "folder-open",
    Callback = function()
        visionHubWindow.CurrentConfig:Load()
        visionHub:Notify({
            Title = "Success",
            Content = "Configuration loaded!",
            Icon = "loader",
            Duration = 5,
            TitleColor = Color3.fromHex("#00BFFF"),
            ContentColor = Color3.fromHex("#E6F7FF"),
            IconColor = Color3.fromHex("#89F7FF"),
            BackgroundColor = Color3.fromHex("#030407"),
            ProgressBarColor = Color3.fromHex("#00BFFF"),
            CloseButtonColor = Color3.fromHex("#00BFFF")
        })
    end
})
settingsSection.Theme:Keybind({
    Title = "Toggle Keybind",
    Desc = "Keybind to open/close the UI",
    Flag = "UiToggleKeybind",
    Value = "RightControl",
    Callback = function(toggleKeyCode)
        visionHubWindow:SetToggleKey(Enum.KeyCode[toggleKeyCode])
    end
})
settingsSection.Theme:Toggle({
    Title = "Transparency",
    Desc = "Make the interface semi-transparent",
    Flag = "UiTransparencyToggle",
    Value = false,
    Callback = function(transparencyValue)
        visionHubWindow:ToggleTransparency(transparencyValue)
    end
})
local serverSection = settingsTab:Section({
    Title = "Server",
    Desc = "Server related actions",
    Icon = "server",
    TextXAlignment = "Center",
    Opened = true
})
serverSection:Button({
    Title = "Rejoin Server",
    Desc = "Rejoins the current server",
    Icon = "refresh-cw",
    Callback = function()
        local dialogModule = visionHubWindow
        local dialogFunction = dialogModule.Dialog
        local rejoinConfirmationDialogConfig = {
            Title = "Confirm Rejoin",
            Content = "Are you sure you want to rejoin the server?",
            Buttons = {
                {
                    Title = "Cancel",
                    Variant = "Secondary"
                },
                {
                    Title = "Rejoin",
                    Icon = "check",
                    Callback = utilityFunctions.Rejoin
                }
            }
        }
        dialogFunction(dialogModule, rejoinConfirmationDialogConfig)
    end
})
serverSection:Button({
    Title = "Server Hop",
    Desc = "Joins a different server",
    Icon = "shuffle",
    Callback = function()
        local dialogModule2 = visionHubWindow
        local dialogFunction2 = dialogModule2.Dialog
        local serverHopConfirmationDialogConfig = {
            Title = "Confirm Server Hop",
            Content = "Are you sure you want to server hop?",
            Buttons = {
                {
                    Title = "Cancel",
                    Variant = "Secondary"
                },
                {
                    Title = "Server Hop",
                    Icon = "check",
                    Callback = utilityFunctions.ServerHop
                }
            }
        }
        dialogFunction2(dialogModule2, serverHopConfirmationDialogConfig)
    end
})
serverSection:Space()
serverSection:Toggle({
    Title = "Queue on Teleport",
    Desc = "Executes the script automatically when queuing",
    Flag = "AutoQueueToggle",
    Value = utilityFunctions.Config.AutoQueue,
    Callback = function(autoQueueEnabled)
        utilityFunctions.Config.AutoQueue = autoQueueEnabled
    end
})
farmingTab:Section({
    Title = "Farming",
    Desc = "Automate gameplay for rewards",
    Icon = "dollar-sign",
    TextXAlignment = "Center"
}):Label({
    Title = "Are you doing here?",
    Desc = "Farming features are not yet implemented.",
    Icon = "alert-circle"
})
local selectedTab = visionHubWindow
visionHubWindow.SelectTab(selectedTab, 1)
return utilityFunctions