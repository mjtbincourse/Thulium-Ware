local colors = {
    Background = Color3.fromRGB(40, 40, 40),
    Header = Color3.fromRGB(60, 60, 60),
    TextColor = Color3.fromRGB(220, 220, 220),
    ElementColor = Color3.fromRGB(80, 80, 80),
    AccentColor = Color3.fromRGB(255, 215, 0)
}
Mobs = {}
for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v.ClassName == "Model" and v:FindFirstChild("NPC") and not table.find(Mobs, v.Name) then
        table.insert(Mobs, v.Name)
    end
end

repeat
    wait()
until game.Players.LocalPlayer.Backpack:FindFirstChild("Combat")
for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
    if v.ClassName == "Tool" then
        v.Parent = game.Players.LocalPlayer.Backpack
    end
end

tools = {}
for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetDescendants()) do
    if v.ClassName == "Tool" then
        table.insert(tools, v.Name)
    end
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Thulium-Ware |Two-Piece", colors)
local TaskWait = task.wait
local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Main")
local TweenService = game:GetService("TweenService")
local UseDelay = 0
Section:NewToggle(
    "Auto-Farm",
    " ",
    function(xxx)
        _G.task = xxx
        getgenv().ToolName = _G.Weapon
        game:GetService("RunService").Stepped:connect(
            function()
                if task then
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
                end
            end
        )

        while _G.task do
            task.wait()
            pcall(
                function()
                    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v:IsA("Model") and v.Name == _G.Mobs and v:FindFirstChild("NPC") and v.Humanoid.Health > 0 then
                            for i, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if tool:IsA("Tool") and tool.Name == _G.tools then
                                    tool.Parent = game.Players.LocalPlayer.Character
                                end
                            end
                            repeat
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                                wait()
                                local weapon = game.Players.LocalPlayer.Character:FindFirstChild(_G.tools)
                                if weapon then
                                    weapon.Parent = game.Players.LocalPlayer.Backpack
                                    weapon.Parent = game.Players.LocalPlayer.Character
                                    weapon:Activate()
                                    task.wait(UseDelay)
                                end
                                game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
                            until v.Humanoid.Health <= 0 or not _G.task
                        end
                    end
                end
            )
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end
)


Section:NewDropdown("Select Mob", "DropdownInf", Mobs, function(xd)
_G.Mobs = xd
end)

Section:NewDropdown("Select Tool", "DropdownInf", tools, function(xx)
_G.tools = xx
end)

local chests = Tab:NewSection("Chests")

chests:NewToggle(
    "Auto-Chest",
    " ",
    function(yesss)
        getgenv().Enabled = yesss

        for _, v in next, getconnections(LocalPlayer.Idled) do
            v:Disable()
        end

        local function IsAlive(MinHealth, Contains)
            MinHealth = MinHealth or 0
            Contains = Contains or {"HumanoidRootPart"}

            local Character = LocalPlayer.Character

            if (Character) then
                for _, v in next, Contains do
                    if (not Character:FindFirstChild(v)) then
                        return
                    end
                end

                local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")

                return Humanoid and Humanoid.Health > MinHealth
            end
        end

        while (Enabled) do
            if (IsAlive()) then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-929, 85, 354)
                local Chest = nil
                for _, v in next, workspace.Chest:GetChildren() do
                    local ProximityPrompt = v:FindFirstChild("EF")
                    ProximityPrompt = ProximityPrompt and ProximityPrompt:FindFirstChild("Attachment1")
                    ProximityPrompt = ProximityPrompt and ProximityPrompt:FindFirstChild("ProximityPrompt")

                    if (ProximityPrompt and ProximityPrompt.Enabled) then
                        Chest = v
                        break
                    end
                end

                Chest.EF.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
            end

            TaskWait()
        end
    end
)

chests:NewToggle(
    "Auto-Interact",
    " ",
    function(cartman)
        _G.autointeract = cartman
        while _G.autointeract do
            VirtualInputManager:SendKeyEvent(true, "E", false, nil)
            TaskWait()
            VirtualInputManager:SendKeyEvent(false, "E", false, nil)
            game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(
                function(prompt)
                    prompt.HoldDuration = 0
                end
            )
        end
    end
)
