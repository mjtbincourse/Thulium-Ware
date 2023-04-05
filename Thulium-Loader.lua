local thuliumm = "https://raw.githubusercontent.com/mjtbincourse/Thulium-Ware/main/"

local games = {
    [9216815133] = "Trollge%20Conventions.lua",
    [12860567360] = "Latex-Piece.lua",
    [5303541547] = "Two%20Piece.lua"
}

for i, v in pairs(games) do
    if i == game.PlaceId or i == game.GameId then
        loadstring(game:HttpGet(thuliumm .. v))()
    end
end

game:GetService("Players").LocalPlayer.Idled:Connect(
    function()
        game:GetService("VirtualUser"):ClickButton2(Vector2.new())
    end
)
