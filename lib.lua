CountOfElements = 0
ElementList = {}

function processall()
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
button.onclick = nil
button.process = function() 
--term.setBackgroundColor(colors.black)
local col
if button.clickable==true then
col = colors.blue
else
    col = colors.lightGray

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

end
ElementList[CountOfElements] = button
return button

end





--Library table creating and return
libtable = {
    CreateButton = createbutton,
    Draw = processall
}

return libtable