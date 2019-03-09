CountOfElements = 0
ElementList = {}
FirstRun = true
FirstRun2 = true

m = nil

function setperipheral(str)
m = peripheral.wrap(str)
end
--end of function setperipheral()


function processall()
    
    if FirstRun then
    term.setBackgroundColor(colors.black)
    term.clear()
    FirstRun = false
    end

    event = {os.pullEvent()}

    for i = 1, CountOfElements do 
    ElementList[i].process()
    end
end
--end of function processall()

function processallonmonitor()

    if FirstRun2 then
        m.setBackgroundColor(colors.black)
        m.clear()
        FirstRun2 = false
    end

    event2 = {os.pullEvent()}

    for i = 1, CountOfElements do 
        ElementList[i].processonmonitor()
    end


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
        if event[1] == "mouse_click" and event[3] >= button.x1 and event[3] < button.x1 + string.len(buttontext) and event[4] == button.y1 then
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

    button.processonmonitor = function()
        local col = colors.blue
        if event2[1] == "monitor_touch" and event2[3] >= button.x1 and event2[3] < button.x1 + string.len(buttontext) and event2[4] == button.y1 then
        --    --col = colors.lightBlue TODO
            button.onclick()
        end
        
        for i = 0, string.len(button.text) - 1 do
            m.setBackgroundColor(col)
            m.setCursorPos(i+x1, y1)
            m.write(string.sub(button.text,i+1,i+1))
        end

    end
    --end of function button.processonmonitor()


    ElementList[CountOfElements] = button
    return button

end
--end of function createbutton()




--Library table creating and return
libtable = {
    CreateButton = createbutton,
    Draw = processall,
    DrawM = processallonmonitor,
    SetSide = setperipheral
}

return libtable