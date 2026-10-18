local P=game.Players.LocalPlayer
local sv,dw=false,nil
local s2,s1,noclip=false,false,false
local flying=false
local sel=nil

-- GUI SIMPLE QUE NO FALLA
local gui=Instance.new("ScreenGui",game.CoreGui)
gui.Name="DelteroEderV4"
local main=Instance.new("Frame",gui)
main.Size=UDim2.new(0,250,0,380)
main.Position=UDim2.new(0.5,-125,0.5,-190)
main.BackgroundColor3=Color3.fromRGB(20,20,20)
main.Active=true
main.Draggable=true
Instance.new("UICorner",main)

local function addBtn(text,y,func)
local b=Instance.new("TextButton",main)
b.Size=UDim2.new(0.9,0,0,30)
b.Position=UDim2.new(0.05,0,0,y)
b.Text=text
b.BackgroundColor3=Color3.fromRGB(40,40,40)
b.TextColor3=Color3.new(1,1,1)
Instance.new("UICorner",b)
b.MouseButton1Click:Connect(func)
return b
end

local title=Instance.new("TextLabel",main)
title.Size=UDim2.new(1,0,0,30)
title.Text="Deltero x Eder V4 | @deltero5"
title.BackgroundColor3=Color3.fromRGB(30,30,30)
title.TextColor3=Color3.new(1,1,1)
Instance.new("UICorner",title)

addBtn("SNAP ABAJO/ARRIBA",35,function()
local h=P.Character and P.Character:FindFirstChild("HumanoidRootPart")
if not h then return end
if not dw then sv=h.CFrame h.CFrame=CFrame.new(h.Position-Vector3.new(0,35,0)) dw=true else h.CFrame=sv dw=false end
end)

addBtn("AIMBOT: OFF",70,function(b)
s2=not s2
b.Text=s2 and "AIMBOT: ON (No pared)" or "AIMBOT: OFF"
end)

addBtn("SPEED: OFF",105,function(b)
s1=not s1
b.Text=s1 and "SPEED: ON" or "SPEED: OFF"
end)

addBtn("NOCLIP: OFF",140,function(b)
noclip=not noclip
b.Text=noclip and "NOCLIP: ON" or "NOCLIP: OFF"
end)

addBtn("SUPER JUMP: OFF",175,function(b)
local hum=P.Character and P.Character:FindFirstChild("Humanoid")
if hum then
if hum.JumpPower<100 then hum.JumpPower=120 b.Text="SUPER JUMP: ON" else hum.JumpPower=50 b.Text="SUPER JUMP: OFF" end
end
end)

addBtn("HITBOX: OFF",210,function(b)
local on=b.Text=="HITBOX: OFF"
for _,plr in pairs(game.Players:GetPlayers()) do if plr~=P and plr.Character and plr.Character:FindFirstChild("Head") then plr.Character.Head.Size=on and Vector3.new(10,10,10) or Vector3.new(2,1,1) end end
b.Text=on and "HITBOX: ON" or "HITBOX: OFF"
end)

addBtn("ESP: OFF",245,function(b)
local on=b.Text=="ESP: OFF"
for _,plr in pairs(game.Players:GetPlayers()) do if plr~=P and plr.Character then if on then if not plr.Character:FindFirstChild("ESP") then local hl=Instance.new("Highlight",plr.Character) hl.Name="ESP" hl.FillColor=Color3.fromRGB(255,0,0) end else if plr.Character:FindFirstChild("ESP") then plr.Character.ESP:Destroy() end end end end
b.Text=on and "ESP: ON" or "ESP: OFF"
end)

addBtn("FLY: OFF",280,function(b)
local hrp=P.Character and P.Character:FindFirstChild("HumanoidRootPart")
if not hrp then return end
if not flying then
flying=true b.Text="FLY: ON"
local bv=Instance.new("BodyVelocity",hrp) bv.Name="FlyVel" bv.Velocity=Vector3.new(0,0,0) bv.MaxForce=Vector3.new(9e9,9e9,9e9)
local bg=Instance.new("
