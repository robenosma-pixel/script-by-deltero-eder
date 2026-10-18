local P=game.Players.LocalPlayer local G=Instance.new("ScreenGui",P.PlayerGui) M=Instance.new("Frame",G) M.Size=UDim2.new(0,200,0,140) M.Position=UDim2.new(0.5,-100,0.5,-70) M.BackgroundColor3=Color3.fromRGB(20,20,20) M.Active=true M.Draggable=true
local function B(t,y,c) local b=Instance.new("TextButton",M) b.Size=UDim2.new(0,180,0,30) b.Position=UDim2.new(0,10,0,y) b.Text=t b.BackgroundColor3=c or Color3.fromRGB(45,45,45) b.TextColor3=Color3.new(1,1,1) b.TextScaled=true return b end
local b1=B("SNAP ABAJO",10,Color3.fromRGB(180,0,0)) local b2=B("AIMBOT OFF",45) local b3=B("SPEED OFF",80)
local sv,dw,s2,s1=false,nil,false,false
b1.MouseButton1Click:Connect(function() local h=P.Character and P.Character:FindFirstChild("HumanoidRootPart") if not h then return end if not dw then sv=h.CFrame h.CFrame=CFrame.new(h.Position-Vector3.new(0,35,0)) b1.Text="SNAP ARRIBA" dw=true else h.CFrame=sv+Vector3.new(0,5,0) b1.Text="SNAP ABAJO" dw=false end end)
b2.MouseButton1Click:Connect(function() s2=not s2 b2.Text="AIMBOT "..(s2 and "ON" or "OFF") end)
b3.MouseButton1Click:Connect(function() s1=not s1 b3.Text="SPEED "..(s1 and "ON" or "OFF") end)
game:GetService("RunService").RenderStepped:Connect(function()
local cam=workspace.CurrentCamera local hrp=P.Character and P.Character:FindFirstChild("HumanoidRootPart") local hum=P.Character and P.Character:FindFirstChild("Humanoid")
if s1 and hrp and hum and hum.MoveDirection.Magnitude>0 then hrp.CFrame=hrp.CFrame+hum.MoveDirection*0.35 end
if s2 then local t,d=nil,400 for _,v in pairs(game.Players:GetPlayers()) do if v~=P and v.Character and v.Character:FindFirstChild("Head") and v.Character.Humanoid.Health>0 then local p,o=cam:WorldToViewportPoint(v.Character.Head.Position) if o then local m=(Vector2.new(p.X,p.Y)-Vector2.new(cam.ViewportSize.X/2,cam.ViewportSize.Y/2)).Magnitude if m<d then d=m t=v end end end end if t then cam.CFrame=CFrame.new(cam.CFrame.Position,t.Character.Head.Position) end end
end)
