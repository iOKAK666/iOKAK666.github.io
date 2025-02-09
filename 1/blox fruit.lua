local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
end)

if not success then
    warn("ไม่สามารถโหลด Rayfield ได้!")
    return
end

local Window = Rayfield:CreateWindow({
    Name = "X Hub - AutoFarm",
    LoadingTitle = "กำลังโหลด UI...",
    LoadingSubtitle = "By X Hub",
    ConfigurationSaving = { Enabled = false },
    KeySystem = false
})

local AutoFarmTab = Window:CreateTab("AutoFarm", 4483362458)
local AutoFarmSection = AutoFarmTab:CreateSection("ตั้งค่าออโต้ฟาร์ม")

AutoFarm = false
AutoAttack = false

AutoFarmTab:CreateToggle({
    Name = "เปิดใช้งาน AutoFarm",
    CurrentValue = false,
    Flag = "AutoFarm",
    Callback = function(value)
        AutoFarm = value
        if value then
            StartAutoFarm()
        end
    end
})

AutoFarmTab:CreateToggle({
    Name = "เปิดใช้งาน Auto Attack",
    CurrentValue = false,
    Flag = "AutoAttack",
    Callback = function(value)
        AutoAttack = value
        if value then
            StartAutoAttack()
        end
    end
})

function StartAutoFarm()
    local LocalPlayer = game:GetService("Players").LocalPlayer

    local function GetQuest(A, B)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", A or "BanditQuest1", B or 1)
    end

    local function DataQuest()
        local Lvl = LocalPlayer.Data.Level
        if Lvl.Value >= 1 and Lvl.Value <= 14 then
            Enemy = "Bandit"
            QuestName = "BanditQuest1"
            QuestNumber = 1
            QuestPos = CFrame.new(1059, 15, 1550)
            EnemyPos = CFrame.new(1196, 11, 1616)
        elseif Lvl.Value >= 15 and Lvl.Value <= 19 then
            Enemy = "Monkey"
            QuestName = "JungleQuest"
            QuestNumber = 1
            QuestPos = CFrame.new(-1598, 35, 153)
            EnemyPos = CFrame.new(-1619, 21, 142)
        elseif Lvl.Value >= 20 and Lvl.Value <= 34 then
            Enemy = "Gorilla"
            QuestName = "JungleQuest"
            QuestNumber = 2
            QuestPos = CFrame.new(-1598, 35, 153)
            EnemyPos = CFrame.new(-1232.47058, 2.22256494, -516.024292, -0.939700961, 0, 0.341998369, 0, 1, 0, -0.341998369, 0, -0.939700961)
        elseif Lvl.Value >= 35 and Lvl.Value <= 44 then
            Enemy = "Pirate"
            QuestName = "BuggyQuest1"
            QuestNumber = 1
            QuestPos = CFrame.new(-1140, 5, 3828)
            EnemyPos = CFrame.new(-1227, 26, 3915)
        elseif Lvl.Value >= 45 and Lvl.Value <= 59 then
            Enemy = "Brute"
            QuestName = "BuggyQuest1"
            QuestNumber = 2
            QuestPos = CFrame.new(-1140, 5, 3828)
            EnemyPos = CFrame.new(-1138, 25, 4289)
        elseif Lvl.Value >= 60 and Lvl.Value <= 74 then
            Enemy = "Desert Bandit"
            QuestName = "DesertQuest"
            QuestNumber = 1
            QuestPos = CFrame.new(899, 6, 4391)
            EnemyPos = CFrame.new(975, 22, 4404)
        elseif Lvl.Value >= 75 and Lvl.Value <= 89 then
            Enemy = "Desert Officer"
            QuestName = "DesertQuest"
            QuestNumber = 2
            QuestPos = CFrame.new(899, 6, 4391)
            EnemyPos = CFrame.new(1555, 14, 4390)
        elseif Lvl.Value >= 90 and Lvl.Value <= 99 then
            Enemy = "Snow Bandit"
            QuestName = "SnowQuest1"
            QuestNumber = 1
            QuestPos = CFrame.new(1387, 87, -1299)
            EnemyPos = CFrame.new(1419, 120, -1412)
        elseif Lvl.Value >= 100 and Lvl.Value <= 119 then
            Enemy = "Snowman"
            QuestName = "SnowQuest1"
            QuestNumber = 2
            QuestPos = CFrame.new(1387, 87, -1299)
            EnemyPos = CFrame.new(1221, 138, -1490)
        elseif Lvl.Value >= 120 and Lvl.Value <= 149 then
            Enemy = "Chief Petty Officer"
            QuestName = "MarineQuest2"
            QuestNumber = 1
            QuestPos = CFrame.new(-5034, 29, 4326)
            EnemyPos = CFrame.new(5191, 3, 403)
        elseif Lvl.Value >= 150 and Lvl.Value <= 174 then
            Enemy = "Sky Bandit"
            QuestName = "SkyQuest"
            QuestNumber = 1
            QuestPos = CFrame.new(-4843, 719, -2623)
            EnemyPos = CFrame.new(-4955, 284, -2874)
        elseif Lvl.Value >= 175 and Lvl.Value <= 189 then
            Enemy = "Dark Master"
            QuestName = "SkyQuest"
            QuestNumber = 2
            QuestPos = CFrame.new(-4843, 719, -2623)
            EnemyPos = CFrame.new(-5272, 405, -2201)
        elseif Lvl.Value >= 190 and Lvl.Value <= 209 then
            Enemy = "Prisoner"
            QuestName = "PrisonerQuest"
            QuestNumber = 1
            QuestPos = CFrame.new(5307, 2, 472)
            EnemyPos = CFrame.new(5191, 25, 403)
        elseif Lvl.Value >= 210 and Lvl.Value <= 249 then
            Enemy = "Dangerous Prisoner"
            QuestName = "PrisonerQuest"
            QuestNumber = 2
            QuestPos = CFrame.new(5307, 2, 472)
            EnemyPos = CFrame.new(5594, 25, 611)
        elseif Lvl.Value >= 250 and Lvl.Value <= 274 then
            Enemy = "Toga Warrior"
            QuestName = "ColosseumQuest"
            QuestNumber = 1
            QuestPos = CFrame.new(-1575, 7, -2984)
            EnemyPos = CFrame.new(-1949, 25, -2769)
        elseif Lvl.Value >= 275 and Lvl.Value <= 299 then
            Enemy = "Gladiator"
            QuestName = "ColosseumQuest"
            QuestNumber = 2
            QuestPos = CFrame.new(-1575, 7, -2984)
            EnemyPos = CFrame.new(-1297, 25, -3242)
        elseif Lvl.Value >= 300 and Lvl.Value <= 324 then
            Enemy = "Military Soldier"
            QuestName = "MagmaQuest"
            QuestNumber = 1
            QuestPos = CFrame.new(-5311, 12, 8515)
            EnemyPos = CFrame.new(-5409, 21, 8457)
        elseif Lvl.Value >= 325 and Lvl.Value <= 374 then
            Enemy = "Military Spy"
            QuestName = "MagmaQuest"
            QuestNumber = 2
            QuestPos = CFrame.new(-5311, 12, 8515)
            EnemyPos = CFrame.new(-5845, 86, 8831)
        elseif Lvl.Value >= 375 and Lvl.Value <= 399 then
            Enemy = "Fishman Warrior"
            QuestName = "FishmanQuest"
            QuestNumber = 1
            QuestPos = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            EnemyPos = CFrame.new(61163.8515625, 11.6796875, 1819.7841796875)
        elseif Lvl.Value >= 400 and Lvl.Value <= 449 then
            Enemy = "Fishman Commando"
            QuestName = "FishmanQuest"
            QuestNumber = 2
            QuestPos = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            EnemyPos = CFrame.new(61163.8515625, 11.6796875, 1819.7841796875)
        elseif Lvl.Value >= 450 and Lvl.Value <= 474 then
            Enemy = "God's Guard"
            QuestName = "SkyExp1Quest"
            QuestNumber = 1
            QuestPos = CFrame.new(-4721, 845, -1949)
            EnemyPos = CFrame.new(-4733, 874, -1962)
        elseif Lvl.Value >= 475 and Lvl.Value <= 524 then
            Enemy = "Shanda"
            QuestName = "SkyExp1Quest"
            QuestNumber = 2
            QuestPos = CFrame.new(-7862, 5546, -382)
            EnemyPos = CFrame.new(-7685, 5569, -498)
        elseif Lvl.Value >= 525 and Lvl.Value <= 549 then
            Enemy = "Royal Squad"
            QuestName = "SkyExp2Quest"
            QuestNumber = 1
            QuestPos = CFrame.new(-7907, 5636, -1413)
            EnemyPos = CFrame.new(-7621, 5627, -1460)
        elseif Lvl.Value >= 550 and Lvl.Value <= 624 then
            Enemy = "Royal Soldier"
            QuestName = "SkyExp2Quest"
            QuestNumber = 2
            QuestPos = CFrame.new(-7907, 5636, -1413)
            EnemyPos = CFrame.new(-7812, 5642, -1777)
        elseif Lvl.Value >= 625 and Lvl.Value <= 649 then
            Enemy = "Galley Pirate"
            QuestName = "FountainQuest"
            QuestNumber = 1
            QuestPos = CFrame.new(-7907, 5636, -1413)
            EnemyPos = CFrame.new(5591, 59, 3971)
        elseif Lvl.Value >= 650 and Lvl.Value <= 700 then
            Enemy = "Galley Captain"
            QuestName = "FountainQuest"
            QuestNumber = 2
            QuestPos = CFrame.new(-7907, 5636, -1413)
            EnemyPos = CFrame.new(5521, 67, 4866)
        end
    end

    local function ClearQuest()
        if not string.find(LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, tostring(Enemy)) then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
        end
    end

    spawn(function()
        while AutoFarm and task.wait() do
            pcall(function()
                DataQuest()
                ClearQuest()
                if not LocalPlayer.PlayerGui.Main.Quest.Visible then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = QuestPos
                    task.wait(0.1)
                    GetQuest(QuestName, QuestNumber)
                else
                    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == tostring(Enemy) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)
                        end
                    end
                end
            end)
        end
    end)
end

function StartAutoAttack()
    local RunService = game:GetService("RunService")
    spawn(function()
        while AutoAttack do
            RunService.Heartbeat:Wait()
            pcall(function()
                local regAtk = game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RE/RegisterAttack")
                local regHit = game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RE/RegisterHit")

                for _, v in next, workspace.Enemies:GetChildren() do
                    if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
                        regAtk:FireServer(0)

                        local args = {
                            [1] = v:FindFirstChild("RightHand"),
                            [2] = {}
                        }

                        for _, e in next, workspace:WaitForChild("Enemies"):GetChildren() do
                            if e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 then
                                table.insert(args[2], {
                                    [1] = e,
                                    [2] = e:FindFirstChild("HumanoidRootPart") or e:FindFirstChildOfClass("BasePart")
                                })
                            end
                        end

                        regHit:FireServer(unpack(args))
                    end
                end
            end)
        end
    end)
end