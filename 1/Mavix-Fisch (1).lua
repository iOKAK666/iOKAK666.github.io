if game.PlaceId == 16732694052 then

    --ใส่สคริป

        local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/Karaca00/Atom-HUb/refs/heads/main/Fluent%20UI%20Library.lua"))()

        local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Karaca00/Atom-HUb/refs/heads/main/InterfaceManager.lua"))()

        local plr = game.Players.LocalPlayer.Character



do  local ui =  game:GetService("CoreGui"):FindFirstChild("UILibrary")  if ui then ui:Destroy() end end
do  local ui =  game:GetService("Lighting"):FindFirstChild("Blur")  if ui then ui:Destroy() end end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local tween = game:service"TweenService"
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local function tablefound(ta, object)
  for i,v in pairs(ta) do
    if v == object then
      return true
    end
  end
  return false
end

local ActualTypes = {RoundFrame = "ImageLabel", Shadow = "ImageLabel", Circle = "ImageLabel", CircleButton = "ImageButton", Frame = "Frame", Label = "TextLabel", Button = "TextButton", SmoothButton = "ImageButton", Box = "TextBox", ScrollingFrame = "ScrollingFrame", Menu = "ImageButton", NavBar = "ImageButton"}

local Properties = {
  RoundFrame = {
    BackgroundTransparency = 1,
    Image = "http://www.roblox.com/asset/?id=5554237731",
    ScaleType = Enum.ScaleType.Slice,
    SliceCenter = Rect.new(3,3,297,297)
  },
  SmoothButton = {
    AutoButtonColor = false,
    BackgroundTransparency = 1,
    Image = "http://www.roblox.com/asset/?id=5554237731",
    ScaleType = Enum.ScaleType.Slice,
    SliceCenter = Rect.new(3,3,297,297)
  },
  Shadow = {
    Name = "Shadow",
    BackgroundTransparency = 1,
    Image = "http://www.roblox.com/asset/?id=5554236805",
    ScaleType = Enum.ScaleType.Slice,
    SliceCenter = Rect.new(23,23,277,277),
    Size = UDim2.fromScale(1,1) + UDim2.fromOffset(30,30),
    Position = UDim2.fromOffset(-15,-15)
  },
  Circle = {
    BackgroundTransparency = 1,
    Image = "http://www.roblox.com/asset/?id=5554831670"
  },
  CircleButton = {
    BackgroundTransparency = 1,
    AutoButtonColor = false,
    Image = "http://www.roblox.com/asset/?id=5554831670"
  },
  Frame = {
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    Size = UDim2.fromScale(1,1)
  },
  Label = {
    BackgroundTransparency = 1,
    Position = UDim2.fromOffset(5,0),
    Size = UDim2.fromScale(1,1) - UDim2.fromOffset(5,0),
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left
  },
  Button = {
    BackgroundTransparency = 1,
    Position = UDim2.fromOffset(5,0),
    Size = UDim2.fromScale(1,1) - UDim2.fromOffset(5,0),
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left
  },
  Box = {
    BackgroundTransparency = 1,
    Position = UDim2.fromOffset(5,0),
    Size = UDim2.fromScale(1,1) - UDim2.fromOffset(5,0),
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left
  },
  ScrollingFrame = {
    BackgroundTransparency = 1,
    ScrollBarThickness = 0,
    CanvasSize = UDim2.fromScale(0,0),
    Size = UDim2.fromScale(1,1)
  },
  Menu = {
    Name = "More",
    AutoButtonColor = false,
    BackgroundTransparency = 1,
    Image = "http://www.roblox.com/asset/?id=5555108481",
    Size = UDim2.fromOffset(20,20),
    Position = UDim2.fromScale(1,0.5) - UDim2.fromOffset(25,10)
  },
  NavBar = {
    Name = "SheetToggle",
    Image = "http://www.roblox.com/asset/?id=5576439039",
    BackgroundTransparency = 1,
    Size = UDim2.fromOffset(20,20),
    Position = UDim2.fromOffset(5,5),
    AutoButtonColor = false
  }
}
local Types = {"RoundFrame", "Shadow", "Circle", "CircleButton", "Frame", "Label", "Button", "SmoothButton", "Box", "ScrollingFrame", "Menu", "NavBar"}
function FindType(String)
  for _, Type in next, Types do
    if Type:sub(1, #String):lower() == String:lower() then
      return Type
    end
  end
  return false
end

local Objects = {}

function Objects.new(Type)
  local TargetType = FindType(Type)
  if TargetType then
    local NewImage = Instance.new(ActualTypes[TargetType])
    if Properties[TargetType] then
      for Property, Value in next, Properties[TargetType] do
        NewImage[Property] = Value
      end
    end
    return NewImage
  else
    return Instance.new(Type)
  end
end

local function GetXY(GuiObject)
  local Max, May = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
  local Px, Py = math.clamp(Mouse.X - GuiObject.AbsolutePosition.X, 0, Max), math.clamp(Mouse.Y - GuiObject.AbsolutePosition.Y, 0, May)
  return Px/Max, Py/May
end

local function CircleAnim(GuiObject, EndColour, StartColour)
  local PX, PY = GetXY(GuiObject)
  local Circle = Objects.new("Shadow")
  Circle.Size = UDim2.fromScale(0,0)
  Circle.Position = UDim2.fromScale(PX,PY)
  Circle.ImageColor3 = StartColour or GuiObject.ImageColor3
  Circle.ZIndex = 200
  Circle.Parent = GuiObject
  local Size = GuiObject.AbsoluteSize.X
  TweenService:Create(Circle, TweenInfo.new(0.5), {Position = UDim2.fromScale(PX,PY) - UDim2.fromOffset(Size/2,Size/2), ImageTransparency = 1, ImageColor3 = EndColour, Size = UDim2.fromOffset(Size,Size)}):Play()
  spawn(function()
    wait(0.5)
    Circle:Destroy()
  end)
end

local UILibrary = Instance.new("ScreenGui")
local Load = Instance.new("Frame")
local UICornerLoad = Instance.new("UICorner")
local LoadButton = Instance.new("ImageButton")

UILibrary.Name = "MavixHub"
UILibrary.Parent = game:GetService("CoreGui")
UILibrary.IgnoreGuiInset = true
UILibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Load.Name = "Load"
Load.Parent = UILibrary
Load.Active = true
Load.AnchorPoint = Vector2.new(0.5, 0.5)
Load.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Load.BackgroundTransparency = 1
Load.BorderSizePixel = 0
Load.Position = UDim2.new(0.5, 0, 1, 0)
Load.Size = UDim2.new(0, 100, 0, 100)
Load.BackgroundTransparency = 1

local uitoggled = false
UserInputService.InputBegan:Connect(
function(io, p)
  if io.KeyCode == Enum.KeyCode.RightControl then
    if uitoggled == false then
      uitoggled = true
      UILibrary.Enabled = false
    else
      UILibrary.Enabled = true
      uitoggled = false
    end
  end
end)

UICornerLoad.CornerRadius = UDim.new(0, 30)
UICornerLoad.Name = "UICornerLoad"
UICornerLoad.Parent = Load

LoadButton.Name = "LoadButton"
LoadButton.Parent = Load
LoadButton.AnchorPoint = Vector2.new(0.5, 0.5)
LoadButton.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadButton.BackgroundTransparency = 1.000
LoadButton.Size = UDim2.new(0, 70, 0, 70)
LoadButton.Image = "http://www.roblox.com/asset/?id=91722326134472"
LoadButton.ImageTransparency = 1

local ClickFrame = Instance.new("Frame")
ClickFrame.Name = "ClickFrame"
ClickFrame.Parent = Load
ClickFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ClickFrame.BackgroundTransparency = 1.000
ClickFrame.Position = UDim2.new(0, 0, 7.62939436e-08, 0)
ClickFrame.Size = UDim2.new(0, 0, 0, 0)

local SoundClick = Instance.new("Sound")
SoundClick.Name = "Sound Effect"
SoundClick.Parent = Load
SoundClick.SoundId = "rbxassetid://130785805"
SoundClick.Volume = 1

local Blur = Instance.new("BlurEffect")
Blur.Size = 0
Blur.Parent = game.Lighting

if game.Workspace.Camera.FieldOfView == 50 then
  return game.Workspace.Camera.FieldOfView == 70
end

local LoadText = Instance.new("Frame")
local UIListLayoutLoadText = Instance.new("UIListLayout")
local TitleLoad = Instance.new("TextLabel")

LoadText.Name = "LoadText"
LoadText.Parent = Load
LoadText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadText.BackgroundTransparency = 1.000
LoadText.Size = UDim2.new(0, 500, 0, 50)
LoadText.ClipsDescendants = true

UIListLayoutLoadText.Name = "UIListLayoutLoadText"
UIListLayoutLoadText.Parent = LoadText
UIListLayoutLoadText.FillDirection = Enum.FillDirection.Horizontal
UIListLayoutLoadText.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayoutLoadText.SortOrder = Enum.SortOrder.LayoutOrder

TitleLoad.Name = "TitleLoad"
TitleLoad.Parent = LoadText
TitleLoad.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleLoad.BackgroundTransparency = 1.000
TitleLoad.Size = UDim2.new(0, 200, 0, 50)
TitleLoad.Font = Enum.Font.Gotham
TitleLoad.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLoad.TextSize = 14.000
TitleLoad.TextTransparency = 1

local Scrollbar = Instance.new("Frame")
local LoadScrollbar = Instance.new("ImageButton")
local Icon = Instance.new("Frame")
local LoadIcon = Instance.new("ImageButton")

Scrollbar.Name = "Scrollbar"
Scrollbar.Parent = Load
Scrollbar.Active = true
Scrollbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Scrollbar.BackgroundTransparency = 1.000
Scrollbar.ClipsDescendants = true
Scrollbar.Position = UDim2.new(0.899999976, 0, -0.0199999232, 0)
Scrollbar.Size = UDim2.new(0, 50, 0, 50)

LoadScrollbar.Name = "LoadScrollbar"
LoadScrollbar.Parent = Scrollbar
LoadScrollbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadScrollbar.AnchorPoint = Vector2.new(0.5,0.5)
LoadScrollbar.BackgroundTransparency = 1.000
LoadScrollbar.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadScrollbar.Size = UDim2.new(0, 30, 0, 30)
LoadScrollbar.Image = "http://www.roblox.com/asset/?id=6031097225"
LoadScrollbar.ImageTransparency = 1
LoadScrollbar.Visible = false

Icon.Name = "Icon"
Icon.Parent = Load
Icon.Active = true
Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.BackgroundTransparency = 1
Icon.ClipsDescendants = true
Icon.Position = UDim2.new(0, 0, -0.02, 0)
Icon.Size = UDim2.new(0, 50, 0, 50)

LoadIcon.Name = "LoadIcon"
LoadIcon.Parent = Icon
LoadIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadIcon.AnchorPoint = Vector2.new(0.5, 0.5)
LoadIcon.BackgroundTransparency = 1
LoadIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadIcon.Size = UDim2.new(0, 40, 0, 40)
LoadIcon.Image = "http://www.roblox.com/asset/?id=91722326134472"
LoadIcon.ImageTransparency = 1
LoadIcon.Visible = false

local osday = Instance.new("TextLabel")
osday.Name = "osday"
osday.Parent = ClickFrame
osday.Active = true
osday.AnchorPoint = Vector2.new(0.5, 0.5)
osday.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
osday.BackgroundTransparency = 1.000
osday.Position = UDim2.new(0.5, 0, 0.699999988, 0)
osday.Size = UDim2.new(0, 384, 0, 30)
osday.Font = Enum.Font.GothamBold
osday.TextTransparency = 1
osday.TextColor3 = Color3.fromRGB(255, 255, 255)
osday.TextSize = 14.000

task.spawn(function()
  while task.wait() do
    pcall(function()
      osday.Text = os.date("%I:%M:%S".." | ".."%B %d, %Y")
    end)
  end
end)

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = ClickFrame
Title.Active = true
Title.AnchorPoint = Vector2.new(0.5, 0.5)
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.5, 0, 0.280000001, 0)
Title.Size = UDim2.new(0, 384, 0, 30)
Title.Font = Enum.Font.GothamBold
Title.Text = "Mavix Hub | Fisch "
Title.TextTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 0, 255)
Title.TextSize = 14.000

function LoadFunction()
  TweenService:Create(game.Workspace.Camera, TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {FieldOfView = 50}):Play()
  TweenService:Create(Blur, TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {Size = 20}):Play()
  TweenService:Create(Load, TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
  TweenService:Create(Load, TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {BackgroundTransparency = 0}):Play()
  wait(.5)
  TweenService:Create(LoadButton, TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {ImageTransparency = 0}):Play()
  LoadButton.MouseEnter:Connect(function() 
    TweenService:Create(LoadButton, TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 80, 0, 80)}):Play()
  end)
  LoadButton.MouseLeave:Connect(function()
    TweenService:Create(LoadButton, TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 70, 0, 70)}):Play()
  end)
  local LoadFocus = false
  LoadButton.MouseButton1Down:Connect(function()
    if LoadFocus == false then
      LoadFocus = true
      TweenService:Create(LoadButton, TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {Rotation = 180}):Play()
      SoundClick:Play()
      wait(.05)
      TweenService:Create(LoadButton, TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {Rotation = 180}):Play()
      TweenService:Create(LoadButton, TweenInfo.new(.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {ImageTransparency = 1}):Play()
      wait(.5)
      LoadButton:Destroy()
      wait(.5)
      TweenService:Create(Load, TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {Position = UDim2.new(0.5, 0, 0.075, 0)}):Play()
      TweenService:Create(Blur, TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {Size = 0}):Play()
      TweenService:Create(game.Workspace.Camera, TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {FieldOfView = 70}):Play()
      wait(.5)
      TweenService:Create(Load, TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 500, 0, 50)}):Play()
      repeat wait()
        TweenService:Create(TitleLoad, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {TextTransparency = 0.2}):Play()
        TitleLoad.Text = "กำลังโหลด . . ."
        wait(0.5)
        TweenService:Create(TitleLoad, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {TextTransparency = 1}):Play()
        wait(0.5)
        TweenService:Create(TitleLoad, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {TextTransparency = 0.2}):Play()
        TitleLoad.Text = "เวอร์ชัน : เบต้า"
        wait(0.5)
        TweenService:Create(TitleLoad, TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {TextTransparency = 1}):Play()
        wait(0.5)
        TweenService:Create(TitleLoad, TweenInfo.new(.45, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {TextTransparency = 0.2}):Play()
        TitleLoad.Text = "MavixHub | ฟรีพรีเมี่ยม"
        TitleLoad.Font = Enum.Font.GothamBold
        TitleLoad.TextTransparency = 0
        wait(1.5)
        TweenService:Create(TitleLoad, TweenInfo.new(.45, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {TextTransparency = 1}):Play()
      until Load.Size == UDim2.new(0, 500, 0, 50)
      TweenService:Create(ClickFrame, TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 500, 0, 50)}):Play()
      TweenService:Create(Load, TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.05}):Play()
      LoadScrollbar.Visible = true
      LoadIcon.Visible = true
      wait(.5)
      TweenService:Create(LoadScrollbar,TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{ImageTransparency = 0}):Play()
      TweenService:Create(LoadIcon,TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{ImageTransparency = 0}):Play()
      repeat wait() until LoadScrollbar.ImageTransparency == 0 and LoadIcon.ImageTransparency == 0
      wait(.5)
      TweenService:Create(osday,TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{TextTransparency = 0}):Play()
      wait(.5)
      TweenService:Create(Title,TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{TextTransparency = 0}):Play()
    end
  end)
end

LoadFunction()
LoadScrollbarFocus = false

LoadScrollbar.MouseLeave:Connect(function()
  if LoadScrollbarFocus == false then
    TweenService:Create(LoadScrollbar,TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
  end
end)

LoadScrollbar.MouseEnter:Connect(function()
  if LoadScrollbarFocus == false then
    TweenService:Create(LoadScrollbar,TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{ImageColor3 = Color3.fromRGB(255, 0, 127)}):Play()
  end
end)

LoadScrollbar.MouseButton1Click:Connect(function()
  game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
  game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.LeftControl, false, game)
end)

local Window = Fluent:CreateWindow({

	Title = "Fisch",

	SubTitle = "MavixHub",

	TabWidth = 160,

	Size = UDim2.fromOffset(420, 280),

	Acrylic = false, 

	Theme = "Light",

	MinimizeKey = Enum.KeyCode.LeftControl

})



do 

	Config = {



	}

	_G.Config = Config

	AllFuncs = {}

	Threads = getgenv().Threads

	Players = game.Players

	LocalPlayer = game.Players.LocalPlayer

	Client = game.Players.LocalPlayer





	-- \\ Module GetService // --



	ReplicatedStorage = game:GetService('ReplicatedStorage')

	RunService = game:GetService("RunService")

	VirtualInputManager = game:GetService('VirtualInputManager')

	CollectionService = game:GetService("CollectionService")

	CoreGui = game:GetService("CoreGui")

	HttpService = game:GetService("HttpService")

	TeleportService = game:GetService("TeleportService")

	VirtualUser = game:GetService("VirtualUser")

	VirtualInputManager = game:GetService("VirtualInputManager")

	UserInputService = game:GetService("UserInputService")





	-- \\ Atom Module // --

	

	PlayerGui = LocalPlayer.PlayerGui

	Backpack = LocalPlayer.Backpack

	request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request



	Char = Client.Character

	Character = Client.Character

	if not Threads then getgenv().Threads = {} end



	repeat 

		LocalPlayer = Players.LocalPlayer

		wait()

	until LocalPlayer

end



function Notify(Des, Time, title)

	Fluent:Notify({

		Title= title or "MavixHub",

		Content = Des,

		Duration = Time or 3

	})

end



_G['Atom Hub Table'] = {

	isWindows = UserInputService:GetPlatform() == Enum.Platform.Windows,

	TypeOs = (table.find({Enum.Platform.Windows}, game:GetService('UserInputService'):GetPlatform()) ~= nil and 'Pc') or 'Mb',

	SizeUi = (not isWindows and UDim2.fromOffset(600,300)) or UDim2.fromOffset(560,600),

	AutoSize = true,

	TweenUiSize = true,

	SpeedTweenUi = 0.25,

	StyleTweenUi = Enum.EasingStyle.Quad,

	Mutiply = 1.80,

	SizeX = 550,

	SafePercent = 20,



	AnimationUiToggle = true,

}



_G['Atom Hub Table'].SizeUi = (not _G['Atom Hub Table'].isWindows and UDim2.fromOffset(600,300)) or UDim2.fromOffset(560,600)

if not _G['Atom Hub Table'].isWindows then

	if game.CoreGui:FindFirstChild('UIBUTTON') then

		game.CoreGui:FindFirstChild('UIBUTTON'):Destroy()

	end



	local TweenService = game:GetService("TweenService")

	local UserInputService = game:GetService("UserInputService")

	local UIBUTTON = Instance.new("ScreenGui")

	local Frame = Instance.new("Frame")

	local ImageButton = Instance.new("ImageButton")

	local UICorner = Instance.new("UICorner")

	local UICorner_2 = Instance.new("UICorner")



	



	UICorner_2.CornerRadius = UDim.new(0, 10)

	UICorner_2.Parent = Frame



	local UIS = game:GetService('UserInputService')

	local frame = Frame

	local dragToggle = nil

	local dragSpeed = 0.25

	local dragStart = nil

	local startPos = nil

	frame.InputBegan:Connect(function(input)

		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 

			dragToggle = true

			dragStart = input.Position

			startPos = frame.Position

			input.Changed:Connect(function()

				if input.UserInputState == Enum.UserInputState.End then

					dragToggle = false

				end

			end)

		end

	end)



	UIS.InputChanged:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then

			if dragToggle then

				Frame.Transparency = 1

				updateInput(input)

			else

				Frame.Transparency = 1

			end

		end

	end)

end



local Tap = {

	General = Window:AddTab({Title = "Main", Icon = "box"}),

	Player = Window:AddTab({ Title = "Player", Icon = "user"}),

	Shop = Window:AddTab({ Title = "Shop", Icon = "shopping-bag"}),

	Teleport = Window:AddTab({Title = "Teleport", Icon = "map"}),

	Settings = Window:AddTab({Title = "Settings", Icon = "settings"})

}



Toggle = function(Section, NameIndex, Description, ConfigName, Function, ...)

	local Misc = {...}

	ConfigName = ConfigName or NameIndex

	local defaultState = Config[ConfigName] or false



	local CreateToggle = Section:AddToggle((NameIndex or NameIndex.."-toggle"), {

		Title = NameIndex or "null",

		Default = defaultState,

		Description = Description or "",

	})



	CreateToggle:OnChanged(function(v)

		Config[ConfigName] = v

         

		if Function then

			Function(v)

		else

			if AllFuncs[ConfigName] then

				local threadRunning = task.spawn(AllFuncs[ConfigName])



				if not v and threadRunning then

					task.cancel(threadRunning)

				end

			end

		end

	end)



	return CreateToggle

end



Slider = function(section,Name,min,max,Rounding,...)

	local SettingName,func = ...

	if not func and type(SettingName) == "function" then func = SettingName end

	if not SettingName then SettingName = Name end

	local default = Config[SettingName]

	local CreateSlider = section:AddSlider((Name or Name.."-slider"), {

		Title =Name or "null",

		Min = min or 0,

		Max = max or 1,

		Default = (Config[SettingName] or default) or min,

		Rounding = (Rounding == true and 1) or 0,

	})



	CreateSlider:OnChanged(function(v)

         

		Config[SettingName] = v

	end)

	task.wait()

	return CreateSlider

end



TextBox = function(section,Name,tooltip,PlaceHolder,Numberic,...)

	local SettingName,func = ...

	if not func and type(SettingName) == "function" then func = SettingName end

	if not SettingName then SettingName = Name end

	local CreateInput =section:AddInput((Name or Name.."-input"), {

		Title =Name or "Null",

		Placeholder = PlaceHolder or "Put text here!",

		Numeric = Numberic or false,

		Finished = true,

		Description = tooltip or "",

		Default = Config[SettingName],

	})



	CreateInput:OnChanged(function(value)

		Config[SettingName] = value

		 

	end)

	task.wait()

	return CreateInput

end



Dropdown = function(section, Name, default, list, multi, ...)

	local SettingName, func = ...

	if not func and type(SettingName) == "function" then func = SettingName end

	SettingName = SettingName or Name



	if multi then

		default = (default or Config[SettingName]) or {}

		if type(Config[SettingName]) == "string" then

			Config[SettingName] = {Config[SettingName]}

		end

	else

		default = (default or Config[SettingName]) or ""

	end



	local CreateDropdown = section:AddDropdown((Name or Name.."-dropdown"), {

		Title = Name or "Null",

		Values = list or {"None"},

		Multi = multi or false,

		Default = default

	})



	CreateDropdown:OnChanged(function(v)

		if multi and type(v) == 'table' then

			Config[SettingName] = {}

			for _, selectedValue in pairs(v) do

				table.insert(Config[SettingName], selectedValue)

			end

		else

			Config[SettingName] = v

		end

         

		if func then

			func(v)

		end

	end)



	return CreateDropdown

end





AllFuncs['Farm Fish'] = function()

	local RodName = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.rod.Value

	while Config['Farm Fish'] and task.wait() do

		if Backpack:FindFirstChild(RodName) then

			LocalPlayer.Character.Humanoid:EquipTool(Backpack:FindFirstChild(RodName))

		end

		if LocalPlayer.Character:FindFirstChild(RodName) and LocalPlayer.Character:FindFirstChild(RodName):FindFirstChild("bobber") then

			local XyzClone = game:GetService("ReplicatedStorage").resources.items.items.GPS.GPS.gpsMain.xyz:Clone()

			XyzClone.Parent = game.Players.LocalPlayer.PlayerGui:WaitForChild("hud"):WaitForChild("safezone"):WaitForChild("backpack")

			XyzClone.Name = "Lure"

			XyzClone.Text = "<font color='#ff4949'>Lure </font>: 0%"

			repeat

				pcall(function()

					PlayerGui:FindFirstChild("shakeui").safezone:FindFirstChild("button").Size = UDim2.new(1001, 0, 1001, 0)

					game:GetService("VirtualUser"):Button1Down(Vector2.new(1, 1))

					game:GetService("VirtualUser"):Button1Up(Vector2.new(1, 1))

				end)

				XyzClone.Text = "<font color='#ff4949'>Lure </font>: "..tostring(ExportValue(tostring(LocalPlayer.Character:FindFirstChild(RodName).values.lure.Value), 2)).."%"

				RunService.Heartbeat:Wait()

			until not LocalPlayer.Character:FindFirstChild(RodName) or LocalPlayer.Character:FindFirstChild(RodName).values.bite.Value or not Config['Farm Fish']

			XyzClone.Text = "<font color='#ff4949'>FISHING!</font>"

			delay(1.5, function()

				XyzClone:Destroy()

			end)

			repeat

				ReplicatedStorage.events.reelfinished:FireServer(1000000000000000000000000, true)

				task.wait(.5)

			until not LocalPlayer.Character:FindFirstChild(RodName) or not LocalPlayer.Character:FindFirstChild(RodName).values.bite.Value or not Config['Farm Fish']

		else

			LocalPlayer.Character:FindFirstChild(RodName).events.cast:FireServer(1000000000000000000000000)

			task.wait(2)

		end

	end

end



AllFuncs['To Pos Stand'] = function()

	while Config['To Pos Stand'] and task.wait() do

		if not Config['SelectPositionStand'] then

			Config['To Pos Stand'] = false

			return

		end

		pcall(function()

			LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = Config['SelectPositionStand']

		end)

	end

end



AllFuncs['Toggle Walk Speed'] = function()

	while Config['Toggle Walk Speed'] and task.wait() do

		pcall(function()

			LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = Config['Set Walk Speed']

		end)

	end

	if not Config['Toggle Walk Speed'] then

		pcall(function()

			LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = 16

		end)

	end

end



AllFuncs['Toggle Jump Power'] = function()

	while Config['Toggle Jump Power'] and task.wait() do

		pcall(function()

			LocalPlayer.Character:FindFirstChild("Humanoid").JumpPower = Config['Set Jump Power']

		end)

	end

	if not Config['Toggle Jump Power'] then

		pcall(function()

			LocalPlayer.Character:FindFirstChild("Humanoid").JumpPower = 50

		end)

	end

end



AllFuncs['Toggle Noclip'] = function()

	while Config['Toggle Noclip'] and task.wait() do

		local charParts = LocalPlayer.Character:GetDescendants()

		for i,v in pairs(charParts) do

			if v:IsA("BasePart") and LocalPlayer.Character then

				if v.CanCollide then

					v.CanCollide = false

				end

			end

		end

	end

	if not Config['Toggle Noclip'] then

		local charParts = LocalPlayer.Character:GetDescendants()

		for i,v in pairs(charParts) do

			if v:IsA("BasePart") and LocalPlayer.Character then

				v.CanCollide = true

			end

		end

	end

end



GetPlayerProfile = function()

	local Respone = game:HttpGet("https://thumbnails.roblox.com/v1/users/avatar-bust?userIds="..LocalPlayer.UserId.."&size=420x420&format=Png&isCircular=false")

	return HttpService:JSONDecode(Respone)['data'][1]['imageUrl']

end



comma_value = function(Value)

	local Calculated = Value

	while true do

		local Text, Amount = string.gsub(Calculated, "^(-?%d+)(%d%d%d)", "%1,%2")

		Calculated = Text

		if Amount == 0 then break end

	end

	return Calculated

end



function GetPosition()

	if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then

		return {

			Vector3.new(0,0,0),

			Vector3.new(0,0,0),

			Vector3.new(0,0,0)

		}

	end

	return {

		game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X,

		game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y,

		game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z

	}

end



function ExportValue(arg1, arg2)

	return tonumber(string.format("%."..(arg2 or 1)..'f', arg1))

end



Main = Tap.General:AddSection('Farming') do

	SelectPosition = Main:AddParagraph({        

		Title = "Position : N/A"

	})

	Toggle(Main, "Auto Farm Fish","", "Farm Fish")

	Toggle(Main, "Teleport To Save Position","", "To Pos Stand")

	Main:AddButton({

		Title = "Save Position",

		Callback = function()

			Config['SelectPositionStand'] = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame

			SelectPosition:SetTitle("Position : "..tostring(math.floor(LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X)).." X "..tostring(math.floor(LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y)).." Y "..tostring(math.floor(LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)).." Z")

		end

	})

end



local seller = Tap.General:AddSection("Seller")

local backpst = seller:AddToggle("Toggle", {Title = "Return To Original Position", Default = true})

local tpback = true



backpst:OnChanged(function(Value)

    tpback = Value

end)



seller:AddButton({

    Title = "Sell",

    Description = "Sell In Hand",

    Callback = function()

        local player = game.Players.LocalPlayer

        local character = player.Character or player.CharacterAdded:Wait()

        local previousPosition = character.HumanoidRootPart.Position

        local targetPosition = Vector3.new(466, 153, 228)

        character:SetPrimaryPartCFrame(CFrame.new(targetPosition)) 

        local merchant = workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marc Merchant"):WaitForChild("merchant"):WaitForChild("sell")

        merchant:InvokeServer()

        wait(0)

        if tpback == true then

            character:SetPrimaryPartCFrame(CFrame.new(previousPosition))

        end

    end

})



seller:AddButton({

    Title = "Sell All",

    Description = "Sell In Your Backpack",

    Callback = function()

        local player = game.Players.LocalPlayer

        local character = player.Character or player.CharacterAdded:Wait()

        local previousPosition = character.HumanoidRootPart.Position

        local targetPosition = Vector3.new(466, 153, 228)

        character:SetPrimaryPartCFrame(CFrame.new(targetPosition)) 

        local merchant = workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marc Merchant"):WaitForChild("merchant"):WaitForChild("sellall")

        merchant:InvokeServer()

        wait(0)

        if tpback == true then

            character:SetPrimaryPartCFrame(CFrame.new(previousPosition))

        end

    end

})



Modify = Tap.Player:AddSection('Player Modify') do

	Slider(Modify, "Walk Speed", 16, 500, false, "Set Walk Speed")

	Slider(Modify, "Jump Power", 50, 500, false, "Set Jump Power")

	Toggle(Modify, "Walk Speed", "", "Toggle Walk Speed")

	Toggle(Modify, "Jump Power", "", "Toggle Jump Power")

end



Modify:AddButton({

    Title = "Reset Character",

    Description = "Click To Die",

    Callback = function()

        plr:WaitForChild("Humanoid").Health = 0

    end

})



MiscPlayer = Tap.Player:AddSection('Misc') do

	DayOnlyLoop = nil

	BypassGpsLoop = nil

	Toggle(MiscPlayer, "Bypass Radar", "", "Bypass Radar", function(Value)

		for _, v in pairs(game:GetService("CollectionService"):GetTagged("radarTag")) do

			if v:IsA("BillboardGui") or v:IsA("SurfaceGui") then

				v.Enabled = Value

			end

		end

	end)

	Toggle(MiscPlayer, "Bypass Gps", "", "Bypass Gps", function(Value)

		if Value then

			local XyzClone = game:GetService("ReplicatedStorage").resources.items.items.GPS.GPS.gpsMain.xyz:Clone()

			XyzClone.Parent = game.Players.LocalPlayer.PlayerGui:WaitForChild("hud"):WaitForChild("safezone"):WaitForChild("backpack")

			local Pos = GetPosition()

			local StringInput = string.format("%s,%s,%s", ExportValue(Pos[1]), ExportValue(Pos[2]), ExportValue(Pos[3]))

			XyzClone.Text = "<font color='#ff4949'>X</font><font color = '#a3ff81'>Y</font><font color = '#626aff'>Z</font>: "..StringInput



			BypassGpsLoop = game:GetService("RunService").Heartbeat:Connect(function() -- Line 26

				local Pos = GetPosition()

				StringInput = string.format("%s,%s,%s", ExportValue(Pos[1]), ExportValue(Pos[2]), ExportValue(Pos[3]))

				XyzClone.Text = "<font color='#ff4949'>X</font><font color = '#a3ff81'>Y</font><font color = '#626aff'>Z</font>: "..StringInput

			end)

		else

			if PlayerGui.hud.safezone.backpack:FindFirstChild("xyz") then

				PlayerGui.hud.safezone.backpack:FindFirstChild("xyz"):Destroy()

			end

			if BypassGpsLoop then

				BypassGpsLoop:Disconnect()

				BypassGpsLoop = nil

			end

		end

	end)

	Toggle(MiscPlayer, "Infinite Oxygen", "", "Infinite Oxygen", function(Value)

		LocalPlayer.Character.client.oxygen.Disabled = Value

	end)

	Toggle(MiscPlayer, "Weather Clear", "", "Weather Clear", function(Value)

		local OldWEA = ReplicatedStorage.world.weather.Value

		if Value then

			ReplicatedStorage.world.weather.Value = 'Clear' 

		else

			ReplicatedStorage.world.weather.Value = OldWEA

		end

	end)

	Toggle(MiscPlayer, "Noclip", "", "Toggle Noclip")

	Toggle(MiscPlayer, "Walk On Water", "", "Toggle Walk On Water", function(Value)

		for i,v in pairs(workspace.zones.fishing:GetChildren()) do

			if v.Name == "Ocean" then

				v.CanCollide = Value

			end

		end

	end)

	Toggle(MiscPlayer, "Remove Fog", "", "Remove Fog", function(Value)

		if Value then

			if game:GetService("Lighting"):FindFirstChild("Sky") then

				game:GetService("Lighting"):FindFirstChild("Sky").Parent = game:GetService("Lighting").bloom

			end

		else

			if game:GetService("Lighting").bloom:FindFirstChild("Sky") then

				game:GetService("Lighting").bloom:FindFirstChild("Sky").Parent = game:GetService("Lighting")

			end

		end

	end)

	Toggle(MiscPlayer, "Day Only", "", "Day Only", function(Value)

		if Value then

			DayOnlyLoop = RunService.Heartbeat:Connect(function()

				game:GetService("Lighting").TimeOfDay = "12:00:00"

			end)

		else

			if DayOnlyLoop then

				DayOnlyLoop:Disconnect()

				DayOnlyLoop = nil

			end

		end

	end)

	

	MiscPlayer:AddButton({

		Title = "Rejoin Server",

		Description = "",

		Callback = function()

			TeleportService:TeleportToPlaceInstance(game.placeId, game.jobId, game.Players.LocalPlayer);

		end,

	})

end



Shopit = Tap.Shop:AddSection("Items Shop")

local backpsp = Shopit:AddToggle("Toggle", {Title = "Return To Original Position", Default = true})

local tpslback = true



backpsp:OnChanged(function(Value)

    tpslback = Value

end)



Shopit:AddButton({

    Title = "Buy Enchant Relic",

    Description = "View [11,000C$]",

    Callback = function()

        local player = game.Players.LocalPlayer

        local character = player.Character or player.CharacterAdded:Wait()

        local previousPosition = character.HumanoidRootPart.Position

        local targetPosition = Vector3.new(-930, 227, -994)

        character:SetPrimaryPartCFrame(CFrame.new(targetPosition)) 

        local merlin = workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin"):WaitForChild("Merlin"):WaitForChild("power")

        merlin:InvokeServer()

        wait(0)

        if tpslback == true then

            character:SetPrimaryPartCFrame(CFrame.new(previousPosition))

        end

    end

})

Shopit:AddButton({

    Title = "Buy Lucky",

    Description = "View [5,000C$]",

    Callback = function()

        local player = game.Players.LocalPlayer

        local character = player.Character or player.CharacterAdded:Wait()

        local previousPosition = character.HumanoidRootPart.Position

        local targetPosition = Vector3.new(-930, 227, -994)

        character:SetPrimaryPartCFrame(CFrame.new(targetPosition)) 

        local merlin = workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin"):WaitForChild("Merlin"):WaitForChild("luck")

        merlin:InvokeServer()

        wait(0)

        if tpslback == true then

            character:SetPrimaryPartCFrame(CFrame.new(previousPosition))

        end

    end

})

Shopit:AddButton({

    Title = "Appraiser Enchant Relic",

    Description = "View [450C$]",

    Callback = function()

        local player = game.Players.LocalPlayer

        local character = player.Character or player.CharacterAdded:Wait()

        local previousPosition = character.HumanoidRootPart.Position

        local targetPosition = Vector3.new(441, 153, 210)

        character:SetPrimaryPartCFrame(CFrame.new(targetPosition)) 

        local appraiser = workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise")

        appraiser:InvokeServer()

        wait(0)

        if tpslback == true then

            character:SetPrimaryPartCFrame(CFrame.new(previousPosition))

        end

    end

})



local shoprod = Tap.Shop:AddSection("Rods Shop")

local rodsl = nil

local ddsr = shoprod:AddDropdown("Rods", {

    Title = "Select A Rods",

    Values = {"Flimsy Rod", "Buddy Bond Rod", "Training Rod", "Plastic Rod", "Carbon Rod", "Long Rod", "Fast Rod", "Lucky Rod", "Steady Rod", "Fortune Rod", "Rapid Rod", "Magma Rod", "Fungal Rod", "Nocturnal Rod", "Aurora Rod", "Rod of the Depths", "Magnet Rod", "Kings Rod", "Destiny Rod", "Reinforced Rod", "Trident Rod", "Scurvy Rod"},

    Multi = false,

    default = 1,

})



ddsr:OnChanged(function(Value)

    rodsl = Value

end)



shoprod:AddButton({

    Title = "Click To Teleport",

    Description = "Teleport To A Rod",

    Callback = function()

        if rodsl == "Flimsy Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(470.3,150.6,231.5)

		    return

	    end

        if rodsl == "Buddy Bond Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(413.6,146.5,261.7)

		    return

	    end

        if rodsl == "Training Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(457.3,150.5,232)

		    return

	    end

        if rodsl == "Plastic Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(453.5,150.5,231.1)

		    return

	    end

        if rodsl == "Carbon Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(454.3,153.5,225.1)

		    return

	    end

        if rodsl == "Long Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(482.9,174.5,147.5)

		    return

	    end

        if rodsl == "Fast Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(448.3,150.5,220.7)

		    return

	    end

        if rodsl == "Lucky Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(445.8,150.5,223.4)

		    return

	    end

        if rodsl == "Steady Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(-1511.4,141.9,761)

		    return

	    end

        if rodsl == "Fortune Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(-1521.7,144.2,772.2)

		    return

	    end

        if rodsl == "Rapid Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(-1509.4,141.9,761.9)

		    return

	    end

        if rodsl == "Magma Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(-1848.8,165.7,162.6)

		    return

	    end

        if rodsl == "Fungal Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(2599.3,132.4,-728.1)

		    return

	    end

        if rodsl == "Nocturnal Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(-145.2,-512.2,1137.1)

		    return

	    end

        if rodsl == "Aurora Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(-144.6,-515.2,1131.9)

		    return

	    end

        if rodsl == "Rod of the Depths" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(1705.7,-902.5,1444.7)

		    return

	    end

        if rodsl == "Magnet Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(-196.3,132.5,1931)

		    return

	    end

        if rodsl == "Kings Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(1375.9,-807.1,-304.6)

		    return

	    end

        if rodsl == "Destiny Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(978.7,131.3,-1232.3)

		    return

	    end

        if rodsl == "Reinforced Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(-989.4,-244.4,-2695.5)

		    return

	    end

        if rodsl == "Trident Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(-1484.1,-226,-2199.2)

		    return

	    end

        if rodsl == "Scurvy Rod" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(-2825.5,214.7,1512.3)

		    return

	    end

    end

})



local TableZum = {}

GetCount = function(NameFish)

	local ReturnCound = 0

	for i,v in pairs(PlayerGui.hud.safezone.backpack.hotbar:GetChildren()) do

		if v:FindFirstChild("tool") and tostring(v.tool.value) == NameFish then

			ReturnCound += 1

		end

	end

	for i,v in pairs(PlayerGui.hud.safezone.backpack.inventory.scroll.safezone:GetChildren()) do

		if v.Name == NameFish then

			ReturnCound += 1

		end

	end

	

	return ReturnCound

end



local Teleporting = Tap.Teleport:AddSection('Teleport To Island')

local island = nil

local DropdownIl = Teleporting:AddDropdown("TelePort",{

    Title = "Select The Island",

    Values = {"Moosewood", "Forsaken Shores", "Mushgrove Swamp", "Roslit Bay", "Roslit Volcano", "Roslit Hamlet", "Snowcap Island", "Srarue Of Soverrignty", "Sunstone Island", "Terrapin Island", "Vertigo", "Brine Pool", "Trident Entrance", "Desolate Pocket", "Keepers Altar", "Birch Cay", "The Arch", "Earmark Island", "Harvesters Spike", "Buoy", "Haddock Rock", "The Depths", "Ancient Isle", "Ancient Isle Pit", "Ancient Isle Underworld", "Ancient Isle Bridge", "Ancient Isle Rod Crafting"},

    Multi = false,

    default = 1,

})

DropdownIl:OnChanged(function(Value)

    island = Value

end)



Teleporting:AddButton({

    Title = "Click To Teleport",

    Description = "Teleport To Island",

    Callback = function()

        if island == "Moosewood" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(385,134,245)

		    return

	    end

	    if island == "Forsaken Shores" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(-2495,133,1550)

	    	return

    	end

    	if island == "Mushgrove Swamp" then

    		plr.HumanoidRootPart.CFrame = CFrame.new(2510,131,-775)

	    	return

    	end

    	if island == "Roslit Bay" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(-1470,132,710)

	    	return

    	end

        if island == "Roslit Volcano" then

            plr.HumanoidRootPart.CFrame = CFrame.new(-1960,192,275)

            return

        end

        if island == "Roslit Hamlet" then

            plr.HumanoidRootPart.CFrame = CFrame.new(-1470,132,710)

            return

        end

    	if island == "Snowcap Island" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(2610,135,2435)

	    	return

    	end

    	if island == "Srarue Of Soverrignty" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(20,159,-1040)

        return

    	end

    	if island == "Sunstone Island" then

    		plr.HumanoidRootPart.CFrame = CFrame.new(-915,138,-1135)

    		return

    	end

    	if island == "Terrapin Island" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(-160,145,1940)

		    return

    	end

    	if island == "Vertigo" then

    		plr.HumanoidRootPart.CFrame = CFrame.new(-110,-515,1040)

    		return

    	end

	    if island == "Brine Pool" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(-1796,-142,-3410)

	    	return

	    end

    	if island == "Trident Entrance" then

    		plr.HumanoidRootPart.CFrame = CFrame.new(-1480,-225,-2300)

	    	return

	    end

	    if island == "Desolate Pocket" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(-1660,-214,-2850)

	    	return

    	end

    	if island == "Keepers Altar" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(1310,-805,-160)

	    	return

    	end

    	if island == "Birch Cay" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(1740,141,-2502)

	    	return

	    end

    	if island == "The Arch" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(960,263,-1250)

	    	return

    	end

    	if island == "Earmark Island" then

    		plr.HumanoidRootPart.CFrame = CFrame.new(1240,147,510)

    		return

    	end

    	if island == "Harvesters Spike" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(-1270,171,1565)

            return

	    end

    	if island == "Buoy" then

	    	plr.HumanoidRootPart.CFrame = CFrame.new(-790,143,-3100)

	    	return

    	end

        if island == "Haddock Rock" then

            plr.HumanoidRootPart.CFrame = CFrame.new(-480,161,-460)

            return

        end

        if island == "The Depths" then

            plr.HumanoidRootPart.CFrame = CFrame.new(950,-737,1360)

            return

        end

        if island == "Ancient Isle" then

            plr.HumanoidRootPart.CFrame = CFrame.new(5645,156,620)

            return

        end

        if island == "Ancient Isle Pit" then

            plr.HumanoidRootPart.CFrame = CFrame.new(5950,155,485)

            return

        end

        if island == "Ancient Isle Underworld" then

            plr.HumanoidRootPart.CFrame = CFrame.new(-3155,-754,2200)

            return

        end

		if island == "Ancient Isle Bridge" then

            plr.HumanoidRootPart.CFrame = CFrame.new(-3160,-754,2110)

            return

        end

		if island == "Ancient Isle Rod Crafting" then

            plr.HumanoidRootPart.CFrame = CFrame.new(-3160,-745,1680)

            return

        end

    end

})



local Best_spot = Tap.Teleport:AddSection("Best Spot")



Best_spot:AddButton({

    Title = "Click to Teleport",

    Description = "Teleport To Best Spot",

    Callback = function()

        local forceFieldPart = Instance.new("Part")

        forceFieldPart.Size = Vector3.new(10, 1, 10)

        forceFieldPart.Position = Vector3.new(1447.8507080078125, 131.49998474121094, -7649.64501953125) -- Adjusted position (2 units lower)

        forceFieldPart.Anchored = true

        forceFieldPart.BrickColor = BrickColor.new("White")

        forceFieldPart.Material = Enum.Material.SmoothPlastic

        forceFieldPart.Parent = game.Workspace

        local forceField = Instance.new("ForceField")

        forceField.Parent = forceFieldPart

        wait()

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1447.8507080078125, 133.49998474121094, -7649.64501953125)

    end

})



local tpev = Tap.Teleport:AddSection("Teleport To Event")

local eventvalue = nil



local ddtpev = tpev:AddDropdown("Event", {

    Title = "Select The Event",

    Values = {"Isonade"},

    Multi = false,

    default = 1,

})



ddtpev:OnChanged(function(Value)

    eventvalue = Value

end)



tpev:AddButton({

    Title = "Click To Teleport",

    Description = "Teleport To Event",

    Callback = function()

        if eventvalue == "Isonade" then

	    	if game.workspace.zones.fishing:FindFirstChild("Isonade") then

			    plr.HumanoidRootPart.CFrame = game.workspace.zones.fishing:FindFirstChild("Isonade").CFrame + Vector3.new(40,115,0)

			    return

		    end

	    end

    end

})



local Teleportps = Tap.Teleport:AddSection("Teleport To Positions")

local tppsx = nil

local tppsy = nil

local tppsz = nil

local InputX = Tap.Teleport:AddInput("Input", {

    Title = "Position-X",

    Default = "",

    Placeholder = "X",

    Numeric = false,

    Finished = false,

    Callback = function(Value)

        tppsx = Value

    end

})



local InputY = Tap.Teleport:AddInput("Input", {

    Title = "Position-Y",

    Default = "",

    Placeholder = "Y",

    Numeric = false,

    Finished = false,

    Callback = function(Value)

        tppsy = Value

    end

})



local InputZ = Tap.Teleport:AddInput("Input", {

    Title = "Position-Z",

    Default = "",

    Placeholder = "Z",

    Numeric = false,

    Finished = false,

    Callback = function(Value)

        tppsz = Value

    end

})



local buttotps = Tap.Teleport:AddButton({

    Title = "Click To Teleport",

    Description = "Teleport To Position",

    Callback = function()

        plr.HumanoidRootPart.CFrame = CFrame.new(tppsx,tppsy,tppsz)

		return

    end

})



local Old = os.time()

	task.spawn(function(InitializeService)

		warn("ANTI AFK STARTING")

		pcall(function()

			for i,v in pairs(getconnections(Client.Idled)) do

				v:Disable() 

			end

			Client.Idled:connect(function()

				game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)

				wait(1)

				game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)

			end)

			while wait(300) do

				game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)

				wait(1)

				game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)

			end

		end)

	end)

do

	Settings_M = Tap.Settings:AddSection("Misc") do

		Timeing = Settings_M:AddParagraph({        

			Title = "Timeing Server"

		})

	end



	RunService.Heartbeat:Connect(function() -- All RunService

		local TimeSinceLastPlay = os.time() - Old

		local hours = tostring(math.floor(TimeSinceLastPlay / 3600))

		local minutes = tostring(math.floor((TimeSinceLastPlay % 3600) / 60))

		local seconds = tostring(TimeSinceLastPlay % 60)

		Timeing:SetTitle("Server Joined "..hours.." H "..minutes.." M "..seconds.." S ")

	end)





	InterfaceManager:SetLibrary(Fluent)

	InterfaceManager:BuildInterfaceSection(Tap.Settings)

	Window:SelectTab(1)

	Fluent:SetTheme("Darker")



	setfpscap(120)

	while true do

    	if (game:GetService("Workspace").DistributedGameTime % 1 * 60) > 30 then

        	setfpscap(120)

    	end

    	wait(0)

	end

end

else

    game.Players.LocalPlayer:kick("Map Not Support")

end 