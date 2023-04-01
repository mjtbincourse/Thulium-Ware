local SolarisLib =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/lua-releases/main/uis/boxlib.lua"))()
local win =
    SolarisLib:New(
    {
        Name = "Thulium-Ware | Trollge Conventions",
        FolderToSave = "Sadarwf-Ware"
    }
)

local VirtualInputManager = game:GetService("VirtualInputManager")

local main = win:Tab("-Main")

local autofarm = main:Section("Auto-Farm")

local toggle =
    autofarm:Toggle(
    "Auto-Chest",
    false,
    "Toggle",
    function(gay)
        _G.ac = gay
        while _G.ac do
            task.wait()
            for _, v in pairs(game:GetService("Workspace").chests:GetChildren()) do
                if v:IsA "Part" then
                    game:GetService "Players".LocalPlayer.Character:FindFirstChild "HumanoidRootPart".CFrame = v.CFrame
                    workspace.FallenPartsDestroyHeight = 0 / 0
                end
            end
        end
    end
)

local toggle =
    autofarm:Toggle(
    "Fast-AutoInteract",
    false,
    "Toggle",
    function(coems)
        _G.iii = coems
        while _G.iii do
            wait(.1)
            VirtualInputManager:SendKeyEvent(true, "E", false, nil)
            task.wait()
            VirtualInputManager:SendKeyEvent(false, "E", false, nil)
            game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(
                function(prompt)
                    prompt.HoldDuration = 0
                end
            )
        end
    end
)

local automatics = main:Section("Automatics")

automatics:Button(
    "Open/Use All Tools",
    function()
        for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.ClassName == "Tool" then
                v.Parent = game:GetService("Players").LocalPlayer.Character
            end
        end
        for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
            if v.ClassName == "Tool" then
                v:Activate()
            end
        end
    end
)

local modifiers = win:Tab("-Modifiers")

local modifiers2 = modifiers:Section("Modifiers")

local slider =
    modifiers2:Slider(
    "Walk-Speed",
    20,
    500,
    0,
    20,
    "Slider",
    function(sp)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = sp
    end
)

local slider =
    modifiers2:Slider(
    "Jump-Power",
    20,
    500,
    0,
    20,
    "Slider",
    function(jp)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = jp
    end
)

local Dupe = win:Tab("-Duping")

local dupe1 = Dupe:Section("Activate")

local slider =
    dupe1:Slider(
    "How Much To Dupe",
    10,
    1000,
    0,
    10,
    "Slider",
    function(kyla)
        getgenv().Dupe3 = kyla
    end
)

dupe1:Button(
    "Activate-Dupe | You Can Only Dupe Per Account!",
    function()
        local old
        old =
            hookmetamethod(
            game,
            "__namecall",
            function(self, ...)
                if self.Name == "CodeEntered" and getnamecallmethod() == "FireServer" then
                    for i = 1, getgenv().Dupe3 do
                        old(self, ...)
                    end
                    return
                end
                return old(self, ...)
            end
        )
    end
)

local dupe2 = Dupe:Section("Redeem Codes (For Duping)")

dupe2:Button(
    "Normal Chest",
    function()
        game:GetService("ReplicatedStorage").CodeEntered:FireServer("Chest")
        SolarisLib:Notification("Thulium-Ware", "Duping in Progres")
    end
)

dupe2:Button(
    "Light Chest",
    function()
        game:GetService("ReplicatedStorage").CodeEntered:FireServer("SevenMillionVisits")
        SolarisLib:Notification("Thulium-Ware", "Duping in Progres")
    end
)

dupe2:Button(
    "Dark Chest",
    function()
        game:GetService("ReplicatedStorage").CodeEntered:FireServer("DarkChest")
        SolarisLib:Notification("Thulium-Ware", "Duping in Progres")
    end
)

local teleports = win:Tab("-Teleports")

local tp = teleports:Section("Teleports")

local dropdown =
    tp:Dropdown(
    "Sellers/Shops",
    {"Acid_seller", "Light_seller", "Rad_seller", "ruler", "blood_seller", "Boiling_seller", "Oil_seller"},
    "",
    "Dropdown",
    function(SelectedLocation)
        _G.dropdownn = SelectedLocation
    end
)

tp:Button(
    "Teleport Selected",
    function()
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
            game:GetService("Workspace").NewMap.map["maxwells and sellers"][_G.dropdownn].trollface.CFrame
    end
)

local Server = win:Tab("-Server")

local server = Server:Section("Server")

server:Button(
    "Server-Hop",
    function()
        local Servers =
            game.HttpService:JSONDecode(
            game:HttpGet("https://games.roblox.com/v1/games/9216815133/servers/Public?sortOrder=Asc&limit=100")
        )
        for i, v in pairs(Servers.data) do
            if v.playing ~= v.maxPlayers then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id)
            end
        end
    end
)

local security = Server:Section("Security")

local toggle =
    security:Toggle(
    "AutoKick | When Mod/Owner Joins",
    false,
    "Toggle",
    function(genius)
        _G.fuck = genius
        while _G.fuck do
            wait()
            local Players = game:GetService("Players")
            local blacklist = {
                "DimesionalOne",
                "Brname1234",
                "R3zlta",
                "pachou_01",
                "idk_ujyy",
                "rafa_foxi2",
                "Astrogod_Official",
                "WowThisManJustDied",
                "Mishka1337227",
                "izzyEB6",
                "guest395824"
            }
            Players.PlayerAdded:Connect(
                function(player)
                    if table.find(blacklist, player.Name) then
                        Players.LocalPlayer:Kick("A Staff or An Owner Joined The Server")
                    end
                end
            )
        end
    end
)

local Credits = win:Tab("-Credits")
local credits = Credits:Section("Owner")
credits:Textbox(
    "sadawrf#3405",
    true,
    function()
        setclipboard("sadawrf#3405")
    end
)

credits:Button(
    "Join Discord Server",
    function()
        setclipboard("https://discord.gg/9Eet3Jvhm6")
    end
)
