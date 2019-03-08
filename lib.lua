CountOfElements = 0
ElementList = {}

function processall()
    
    event = {os.pullEvent()}
    
    --print(button)
    --sleep(0.1)
    for i = 1, CountOfElements do 
    ElementList[i].process()
end
end



function createbutton(buttontext,x1,y1)
CountOfElements = CountOfElements + 1
x1 = x1+1
y1 = y1+1
local x2, y2
y2 = y1 + 2
x2 = x1 + string.len(buttontext) + 1


local button = {}
button.id = CountOfElements
button.text = buttontext
button.x1 = x1
button.y1 = y1
button.x2 = x2
button.y2 = y2
button.is_clicked = false
button.clickable = true
button.onclick = function()
--return 0
end
button.process = function() 
event = {os.pullEvent()}
--term.setBackgroundColor(colors.black)
local col


if event[1] == "mouse_click" then
if event[3] >= button.x1 and event[3] <= button.x2 and event[4] >= button.y1 and event[4] <= button.y2 and button.clickable == true then
button.clicked = true

button.onclick()
end
--else
--button.clicked = false

end
--end

if button.clickable==true then
col = colors.blue
else
    col = colors.lightGray

end
if button.clicked == true then
col = colors.lightBlue
end


for i = button.y1, button.y2 do
for j = button.x1, button.x2 do
term.setCursorPos(j,i)
term.setBackgroundColor(col)
term.write(" ")
if i == button.y1 + 1 then
term.setCursorPos(j,i)
--term.setBackgroundColor(colors.red)
if j > button.x1 and j < button.x2 then
term.setCursorPos(j,i)
term.write(string.sub(button.text, j - x2,j - x2))
end
end
end
end
button.clicked = false
end
ElementList[CountOfElements] = button
return button

end
--end of function createbutton()




--Library table creating and return
libtable = {
    CreateButton = createbutton,
    Draw = processall
}

return libtable