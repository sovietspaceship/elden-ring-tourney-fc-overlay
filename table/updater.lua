{$lua}
[ENABLE]

local io = require("io")

local form = createForm()
local formDescription = createLabel(form)
local addressList = getAddressList()

local filePath = "C:\\Users\\Rei\\Documents\\er-overlay-data.txt"

overlayDataUpdaterTimer = createTimer(form)

overlayDataUpdaterTimer.Interval = 500
formDescription.Caption = 'Started server'

local Key_Player1CurrentHP = 'Player1 - Current HP'
local Key_Player1MaxHP = 'Player1 - Max HP'

function tick()
    local file = io.open(filePath, "w")

    local Player1CurrentHP = addressList.getMemoryRecordByDescription(Key_Player1CurrentHP)
    local Player1MaxHP = addressList.getMemoryRecordByDescription(Key_Player1MaxHP)

    if file ~= nil then
        file:write(Player1CurrentHP.Value)
        file:write(",")
        file:write(Player1MaxHP.Value);
        file:close()
    end
end

overlayDataUpdaterTimer.OnTimer = tick

tick()

[DISABLE]
overlayDataUpdaterTimer.destroy()
