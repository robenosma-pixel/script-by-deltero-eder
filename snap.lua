local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Deltero Eder V4",
   LoadingTitle = "Mod Menu",
   LoadingSubtitle = "by @deltero5 & eder_x_x1",
   ConfigurationSaving = { Enabled = false }
})

local MainTab = Window:CreateTab("Main", 4483362458)
local ExtraTab = Window:CreateTab("Extras", 4483362458)
local VisualTab = Window:CreateTab("Visual", 4483362458)
local CredTab = Window:CreateTab("Creadores", 4483362458)

local P = game.Players.LocalPlayer
local sv,dw,s2,s1,noclip = nil,false,false,false,false
local flying = false

-- CREADORES
CredTab:CreateParagraph({Title = "CREADORES OFICIALES", Content = "Script oficial"})
CredTab:CreateLabel("TikTok: @deltero5")
CredTab:CreateLabel("TikTok: eder_x_x1")

-- MAIN
MainTab:CreateButton({
   Name = "SNAP ABAJO / ARRIBA",
   Callback = function()
   local h = P.Character and P.Character:FindFirstChild("HumanoidRootPart")
   if not h then return end
   if not dw then sv = h.CFrame h.CFrame = CFrame.new(h.Position - Vector3.new(0,35,0)) dw = true else h.CFrame = sv dw = false end
   end,
})

MainTab:CreateToggle({
   Name = "AIMBOT No Pared",
   CurrentValue = false,
   Callback = function(v) s2 = v end,
})

MainTab:CreateToggle({
   Name = "SPEED HACK",
   CurrentValue = false,
   Callback = function(v) s1 = v end,
})

-- EXTRAS
ExtraTab:CreateToggle({
   Name = "NOCLIP",
   CurrentValue = false,
   Callback = function(v) noclip = v end,
})

ExtraTab:CreateToggle({
   Name = "SUPER JUMP",
   CurrentValue = false,
   Callback = function(v) 
   if P.Character and P.Character:FindFirstChild("Humanoid") then
   P.Character.Humanoid.JumpPower = v and 120 or 50
   end
   end,
})

ExtraTab:CreateToggle({
   Name = "HITBOX",
   CurrentValue = false,
   Callback = function(v)
   for _,plr in pairs(game.Players:GetPlayers()) do
   if plr ~= P and plr.Character and plr.Character:FindFirstChild("Head") then
   if v then plr.Character.Head.Size = Vector3.new(10,10,10) else plr.Character.Head.Size = Vector3.new(2,1,1) end
   end
   end
   end,
})

ExtraTab:CreateToggle({
   Name = "FLY",
   CurrentValue = false,
   Callback = function(v)
   local hrp = P.Character and P.Character:FindFirstChild("HumanoidRootPart")
   if not hrp then return end
   if v then
   flying = true
   local bv = Instance.new("BodyVelocity", hrp)
   bv.Name = "FlyVel"
   bv.Velocity = Vector3.new(0,0,0)
   bv.MaxForce = Vector3.new(9e9,9e9,9e9)
   local bg = Instance.new("BodyGyro", hrp)
   bg.Name = "FlyGyro"
   bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
   bg.CFrame = hrp.CFrame
   task.spawn(function()
   while flying do
   local cam = workspace.CurrentCamera
   local move = Vector3.new(0,0,0)
   if P.Character and P.Character:FindFirstChild("Humanoid") then
   local hum = P.Character.Humanoid
   if hum.MoveDirection.Magnitude > 0 then
   move = move + cam.CFrame:VectorToWorldSpace(hum.MoveDirection * 50)
   end
   end
   if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,50,0) end
   if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then move = move - Vector3.new(0,50,0) end
   hrp.FlyVel.Velocity = move
   hrp.FlyGyro.CFrame = cam.CFrame
   task.wait()
   end
   end)
   else
   flying = false
   if hrp:FindFirstChild("FlyVel") then hrp.FlyVel:Destroy() end
   if hrp:FindFirstChild("FlyGyro") then hrp.FlyGyro:Destroy() end
   end
   end,
})

-- VISUAL
VisualTab:CreateToggle({
   Name = "ESP",
   CurrentValue = false,
   Callback = function(v)
   for _,plr in pairs(game.Players:GetPlayers()) do
   if plr ~= P and plr.Character then
   if v then
   if not plr.Character:FindFirstChild("ESP_HL") then
   local hl = Instance.new("Highlight
