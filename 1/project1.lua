local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "X HUB" .. Fluent.Version,
    SubTitle = "by X HUB Team",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

local Tab = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "" })
}

Fluent:Notify({
	Title = "X HUB",
	Content = "by X HUB Team",
	SubContent = "https://discord.gg/VkG5e8eTSM", -- Optional
	Duration = 5 -- Set to nil to make the notification not disappear
})


local Toggles = Tab.Main:AddToggle("MyToggle", {Title = "Auto Click", Default = false })

Toggles:OnChanged(function(a)
	_G.click = a --true/false
    pcall(function()
        while _G.click do wait()
		    game:GetService("ReplicatedStorage"):WaitForChild("Tap"):InvokeServer(_G.click)
	    end
	end)
end)

---------------------------------------------------------------------------------------------
local Toggles = Tab.Main:AddToggle("MyToggle1", {Title = "Auto gem", Default = false })

Toggles:OnChanged(function(a)
	_G.gem = a --true/false
    pcall(function()
        while _G.gem do wait()
		    for i, v in pairs(game:GetService("Workspace").Gems:GetChildren()) do
		        if v:IsA("BasePart") then
		            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
				end
			end
	    end
	end)
end)
---------------------------------------------------------------------------------------------






