repeat wait() until game:IsLoaded()

game:GetService("Players").LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local thuliumm = "https://raw.githubusercontent.com/mjtbincourse/Thulium-Ware/main/"

local games = {
    [9216815133] = "Trollge%20Conventions",
}

for i, v in pairs(games) do
    if i == game.PlaceId or i == game.GameId then
        loadstring(game:HttpGet(thuliumm .. v))()
    end
end
