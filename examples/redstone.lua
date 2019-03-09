f = require("lib")


b = f.CreateButton("On",2,3)
b2 = f.CreateButton("Off", 2,5)
b.onclick = function()
redstone.setAnalogOutput("back", 10)
end
b2.onclick = function()
redstone.setAnalogOutput("back", 0)
end

while true do
f.Draw()
sleep(0.3)
end

