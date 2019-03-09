CountOfElements = 0
ElementList = {}

function processall()
    
    event = {os.pullEvent()}

    for i = 1, CountOfElements do 
    ElementList[i].process()
    end
end
--end of function processall()

function processallonmonitor()

end
--end of function processallonmonitor()


function createbutton(buttontext,x1,y1)
CountOfElements = CountOfElements + 1



local button = {}
button.id = CountOfElements
button.text = buttontext
button.x1 = x1
button.y1 = y1
button.is_clicked = false
button.clickable = true
button.onclick = function()
--return 0
end

button.process = function() 
local col = colors.blue
if event[1] == "mouse_click" and event[3] >= x1 and event[3] < x1 + string.len(buttontext) and event[4] == y1 then
--col = colors.lightBlue TODO
button.onclick()
end


for i = 0, string.len(button.text) - 1 do
term.setBackgroundColor(col)
term.setCursorPos(i+x1, y1)
term.write(string.sub(button.text,i+1,i+1))

end
end
--end of function button.process()

function button.processonmonitor()

end
--end of function button.processonmonitor


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