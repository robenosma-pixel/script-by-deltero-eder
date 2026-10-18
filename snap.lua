local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Script By Deltero Eder",
   LoadingTitle = "Snap Menu",
   LoadingSubtitle = "by Deltero",
   ConfigurationSaving = { Enabled = false }
})

local MainTab = Window:CreateTab("Main", 4483362458)

local sv,dw,s2,s1=false,false,false,false

MainTab:CreateButton({
   Name = "SNAP ABAJO / ARRIBA",
   Callback = function()
   local P=game.Players.LocalPlayer
   local h=P.Character and P.Character:FindFirstChild("HumanoidRootPart")
   if not h then return end
   if not dw then
   sv=h.CFrame
   h.CFrame=CFrame.new(h.Position-Vector3.new(0,35,0))
   dw=true
   Rayfield:Notify({Title="Snap",Content="Abajo activado",Duration=1})
   else
   h.CFrame=sv
   dw=false
   Rayfield:Notify({Title="Snap",Content="Arriba activado",Duration=1})
   end
   end,
})

MainTab:CreateToggle({
   Name = "AIMBOT",
   CurrentValue = false,
   Callback = function(v) s2=v end,
})

MainTab:CreateToggle({
   Name = "SPEED HACK",
   CurrentValue = false,
   Callback = function(v) s1=v end,
})

game:GetService("RunService").RenderStepped:Connect(function()
local P=game.Players.LocalPlayer
local cam=workspace.CurrentCamera
local hrp=P.Character and P.Character:FindFirstChild("HumanoidRootPart")
local hum=P.Character and P.Character:FindFirstChild("Humanoid")
if s1 and hrp and hum and hum.MoveDirection.Magnitude>0 then hrp.CFrame=hrp.CFrame+hum.MoveDirection*0.35 end
if s2 then
local t,d=nil,400
for _,v in pairs(game.Players:GetPlayers()) do
if v~=P and v.Character and v.Character:FindFirstChild("Head") and v.Character.Humanoid.Health>0 then
local p,o=cam:WorldToViewportPoint(v.Character.Head.Position)
if o then
local m=(Vector2.new(p.X,p.Y)-Vector2.new(cam.ViewportSize.X/2,cam.ViewportSize.Y/2)).Magnitude
if m<d then d=m t=v end
end
end
end
if t then cam.CFrame=CFrame.new(cam.CFrame.Position,t.Character.Head.Position) end
end
end)
