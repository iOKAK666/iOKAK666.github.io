local tpd = workspace._LOBBIES.Story._lobbytemplategreen1.Door
local tod = game.Players.LocalPlayer.Character.HumanoidRootPart
tod.CFrame = tpd.CFrame








local args = {
    [1] = "_lobbytemplategreen1",
    [2] = "namek_level_1",
    [3] = false,
    [4] = "Normal"
}

game:GetService("ReplicatedStorage"):WaitForChild("endpoints"):WaitForChild("client_to_server"):WaitForChild("request_lock_level"):InvokeServer(unpack(args))

local args = {
    [1] = "_lobbytemplategreen1"
}

game:GetService("ReplicatedStorage"):WaitForChild("endpoints"):WaitForChild("client_to_server"):WaitForChild("request_start_game"):InvokeServer(unpack(args))

