-- Loadstring for KavoUI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))();
--

-- Lib Windows --
local Window = Library.CreateLib("ZombieLab | Authors: Itzporium, DustinTheGR8", "DarkTheme");
-----------------

-- Tabs --
local Tab = Window:NewTab("Blatant");
----------

-- Functions --
local getLocalPlayer = function()
    if (game:GetService("Players")) then
        return game:GetService("Players").LocalPlayer;
    else
        return nil;
    end
end

local notify = function()
    game:GetService("CoreGui")
end
---------------

-- Vars --
local lplayer = getLocalPlayer();
----------

-- Blatant --
local KillAll = Tab:NewSection("Kill all zombies");

KillAll:NewButton("Kill", "Need a gun", function()
    pcall(function()
        for i, v in pairs(game:GetService("Players"):GetPlayers()) do
            -- Make sure player have Humanoid and HumanoidRootPart
            if v.Character then
                if v.Character:FindFirstChildWhichIsA("Humanoid") then
                    if v.Character:FindFirstChild("HumanoidRootPart") then
                        if (lplayer) then
                            if (lplayer.Character) then
                                if (lplayer.Character:FindFirstChild("Pistol")) then
                                    if (lplayer.Character:FindFirstChild("Pistol"):FindFirstChild("GunScript_Server") and lplayer.Character:FindFirstChild("Pistol"):FindFirstChild("GunScript_Server"):FindFirstChild("InflictTarget")) then
                                        lplayer.Character:FindFirstChild("Pistol"):FindFirstChild("GunScript_Server"):FindFirstChild("InflictTarget"):FireServer(unpack({
                                            [1] = v.Character:FindFirstChildWhichIsA("Humanoid"),
                                            [2] = v.Character:FindFirstChild("HumanoidRootPart"),
                                            [3] = math.huge -- Infinity OMG a number lol
                                        }))
                                    else
                                        notify("error", "You must equip gun to perform this action")
                                    end
                                else
                                    notify("error", "You must equip gun to perform this action")
                                end
                            else
                                notify("error", "Your character is missing")
                            end
                        else
                            notify("error", "LocalPlayer is not defined")
                        end
                    end
                end
            end
        end
    end)
end)
-------------
