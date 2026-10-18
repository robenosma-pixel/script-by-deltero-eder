local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Script By Deltero Eder",
   LoadingTitle = "Snap Menu V3",
   LoadingSubtitle = "by Deltero Eder",
   ConfigurationSaving = { Enabled = false }
})

local MainTab = Window:CreateTab("Main", 4483362458)
local ExtraTab = Window:CreateTab("Extras", 4483362458)
local CredTab = Window:CreateTab("Creadores", 4483362458)

local sv,dw,s2,s1,noclip,sjump=false,false,false,false,false,false
local P=game.Players.LocalPlayer

-- CREADORES OFICIALES
CredTab:CreateParagraph({Title="CREADORES OFICIALES", Content="Este script es oficial de Deltero y Eder"})
CredTab:CreateLabel("TikTok: @deltero5")
CredTab:CreateLabel("TikTok: eder_x_x1")
CredTab:CreateButton({
   Name = "Copiar @deltero5",
   Callback = function() setclipboard("@deltero5") Rayfield:Notify({Title="Copiado",Content="@deltero5 copiado",Duration=2}) end,
})
CredTab:CreateButton({
   Name = "Copiar eder_x_x1",
   Callback = function() setclipboard("eder_x_x1") Rayfield:Notify({Title="Copiado",Content="eder_x_x1 copiado",Duration=2}) end,
})

-- MAIN
MainTab:CreateButton({
   Name = "SNAP ABAJO / ARRIBA",
   Callback = function()
   local h=P.Character and P.Character:FindFirstChild("HumanoidRootPart")
   if not h then return end
   if not dw then sv=h.CFrame h.CFrame=CFrame.new(h.Position-Vector3.new(0,35,0)) dw=true
   else h.CFrame=sv dw=false end
   end,
})
MainTab:CreateToggle({Name="AIMBOT (No pared)", CurrentValue=false, Callback=function(v) s2=v end,})
MainTab:CreateToggle({Name="SPEED HACK", CurrentValue=false, Callback=function(v) s1=v end,})

-- EXTRAS
ExtraTab:CreateToggle({Name="NOCLIP", CurrentValue=false, Callback=function(v) noclip=v end,})
ExtraTab:CreateToggle({Name="SUPER JUMP", CurrentValue=false, Callback=function(v) sjump=v if P.Character and P.Character:FindFirstChild("Humanoid") then P.Character.Humanoid.JumpPower= v and 120 or 50 end end,})
ExtraTab:CreateToggle({Name="HITBOX EXPANDER", CurrentValue=false, Callback=function(v) for _,plr in pairs(game.Players:GetPlayers()) do if plr~=P and plr.Character and plr.Character:FindFirstChild("Head") then if v then plr.Character.Head.Size=Vector3.new(10,10,10) plr.Character.Head.Transparency=0.5 else plr.Character.Head.Size=Vector3.new(2,1,1) plr.Character.Head.Transparency=0 end end end end,})

game:GetService("RunService").Stepped:Connect(function()
if noclip and P.Character then for _,v in pairs(P.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end
end)

game:GetService("RunService").RenderStepped:Connect(function()
local cam=workspace.CurrentCamera local hrp=P.Character and P.Character:FindFirstChild("HumanoidRootPart") local hum=P.Character and P.Character:FindFirstChild("Humanoid")
if s1 and hrp and hum and hum.MoveDirection.Magnitude>0 then hrp.CFrame=hrp.CFrame+hum.MoveDirection*0.35 end
if s2 then
local t,d=nil,400 local params=RaycastParams.new() params.FilterType=Enum.RaycastFilterType.Blacklist params.FilterDescendantsInstances={P.Character}
for _,v in pairs(game.Players:GetPlayers()) do
if v~=P and v.Character and v.Character:FindFirstChild("Head") and v.Character.Humanoid.Health>0 then
local p,o=cam:WorldToViewportPoint(v.Character.Head.Position)
if o then local m=(Vector2.new(p.X,p.Y)-Vector2.new(cam.ViewportSize.X/2,cam.ViewportSize.Y/2)).Magnitude if m<d then local ray=workspace:Raycast(cam.CFrame.Position, v.Character.Head.Position - cam.CFrame.Position, params) if not ray or ray.Instance:IsDescendantOf(v.Character) then d=m t=v end end end
end end
if t then cam.CFrame=CFrame.new(cam.CFrame.Position,t.Character.Head.Position) end
end
end)
