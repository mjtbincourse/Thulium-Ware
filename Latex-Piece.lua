local colors = {
    Background = Color3.fromRGB(40, 40, 40),
    Header = Color3.fromRGB(60, 60, 60),
    TextColor = Color3.fromRGB(220, 220, 220),
    ElementColor = Color3.fromRGB(80, 80, 80),
    AccentColor = Color3.fromRGB(255, 215, 0)
}
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Thulium-Ware Beta|Latex Piece", colors)
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Configuration")
local Weaponlist = {}
local Weapon = nil
local Melee1 = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Stats_Frame.Melee.UpEvent
local Defense2 = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Stats_Frame.Defents.UpEvent
local Sword3 = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Stats_Frame.Sword.UpEvent
local Gun4 = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Stats_Frame.Gun.UpEvent
local Glue5 = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Stats_Frame.Glue.UpEvent

for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
    table.insert(Weaponlist, v.Name)
end

Section:NewDropdown(
    "Select Weapon",
    " ",
    Weaponlist,
    function(currentOption)
        Weapon = currentOption
    end
)

Section:NewButton(
    "Refresh Weapon",
    " ",
    function()
        dropdown:Refresh(Weaponlist)
    end
)

Section:NewDropdown(
    "Select-Mob",
    "DropdownInf",
    {
        "Sky Man",
        "Sky bandit",
        "Land bandit",
        "Boss",
        "Leaf Man",
        "Tree Man",
        "Snow People",
        "Bad People",
        "Blue People",
        "Sky Js"
    },
    function(p)
        getgenv().folder = p
    end
)

local woah = Tab:NewSection("Auto-Farm")

woah:NewToggle(
    "Auto Equip",
    " ",
    function(a)
        AutoEquiped = a
    end
)

spawn(
    function()
        while wait() do
            if AutoEquiped then
                pcall(
                    function()
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(
                            game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Weapon)
                        )
                    end
                )
            end
        end
    end
)

woah:NewToggle(
    "Auto-Farm Selected",
    " ",
    function(y)
        _G.autofarmm = y
        while _G.autofarmm do
            task.wait()
            pcall(
                function()
                    for i, v in pairs(game:GetService("Workspace").Monster[getgenv().folder]:GetDescendants()) do
                        if v:FindFirstChild("HumanoidRootPart") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                v.HumanoidRootPart.CFrame * CFrame.new(-5, -7, 0)
                            workspace[game.Players.LocalPlayer.Name].Combat.Main.RemoteEvent:FireServer("A")
                        end
                    end
                end
            )
        end
    end
)

local stats = Window:NewTab("Misc")
local ss = stats:NewSection("Misc")
ss:NewToggle(
    "Auto-Melee",
    " ",
    function(b)
        _G.meleee = b
        while _G.meleee do
            wait(.1)
            Melee1:FireServer()
        end
    end
)

ss:NewToggle(
    "Auto-Defense",
    " ",
    function(bc)
        _G.defensee = bc
        while _G.defensee do
            wait(.1)
            Defense2:FireServer()
        end
    end
)

ss:NewToggle(
    "Auto-Sword",
    " ",
    function(bb)
        _G.Swordd = bb
        while _G.Swordd do
            wait(.1)
            Sword3:FireServer()
        end
    end
)

ss:NewToggle(
    "Auto-Gun",
    " ",
    function(bv)
        _G.Gunn = bv
        while _G.Gunn do
            wait(.1)
            Gun4:FireServer()
        end
    end
)

ss:NewToggle(
    "Auto-Glue",
    " ",
    function(bk)
        _G.Gluee = bk
        while _G.Gluee do
            wait(.1)
            Glue5:FireServer()
        end
    end
)

local suu = stats:NewSection("Extra")

suu:NewButton(
    "No Sea Damage",
    " ",
    function()
        game:GetService("Workspace"):FindFirstChild("Water"):Destroy()
    end
)

local CC = Window:NewTab("Credits")
local credits = CC:NewSection("Credits")

credits:NewButton(
    "sadawrf#3405",
    " ",
    function()
        setclipboard("sadawrf#3405")
    end
)
