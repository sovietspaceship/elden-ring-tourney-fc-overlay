{$lua}
if syntaxcheck then return end
[ENABLE]

local io = require("io")

-- apparently a form is needed to create a timer? idk
-- this script goes hard feel free to edit
local form = createForm()
local formDescription = createLabel(form)
local addressList = getAddressList()

-- change this to be in an existing directory on your system, e.g. Documents
local filePath = "PATH\\TO\\er-overlay-data.txt"

overlayDataUpdaterTimer = createTimer(form)

-- update interval for writing to file
overlayDataUpdaterTimer.Interval = 100
formDescription.Caption = 'Started'

local Key_Player1CurrentHP = 'Player1 - Current HP'
local Key_Player1MaxHP = 'Player1 - Max HP'
local Key_Player1Name = 'Player1 - Name'
local Key_Player2CurrentHP = 'Player2 - Current HP'
local Key_Player2MaxHP = 'Player2 - Max HP'
local Key_Player1Name = 'Player1 - Name'
local Key_Player3CurrentHP = 'Player3 - Current HP'
local Key_Player3MaxHP = 'Player3 - Max HP'
local Key_Player1Name = 'Player1 - Name'
local Key_Player4CurrentHP = 'Player4 - Current HP'
local Key_Player4MaxHP = 'Player4 - Max HP'
local Key_Player1Name = 'Player1 - Name'

function tick()
    local file = io.open(filePath, "w")

    -- could be refactored into readInteger and hardcoding offsets
    local Player1CurrentHP = addressList.getMemoryRecordByDescription(Key_Player1CurrentHP)
    local Player1MaxHP = addressList.getMemoryRecordByDescription(Key_Player1MaxHP)
    local Player1Name = addressList.getMemoryRecordByDescription(Key_Player1Name)
    local Player2CurrentHP = addressList.getMemoryRecordByDescription(Key_Player2CurrentHP)
    local Player2MaxHP = addressList.getMemoryRecordByDescription(Key_Player2MaxHP)
    local Player2Name = addressList.getMemoryRecordByDescription(Key_Player2Name)
    local Player3CurrentHP = addressList.getMemoryRecordByDescription(Key_Player3CurrentHP)
    local Player3MaxHP = addressList.getMemoryRecordByDescription(Key_Player3MaxHP)
    local Player3Name = addressList.getMemoryRecordByDescription(Key_Player3Name)
    local Player4CurrentHP = addressList.getMemoryRecordByDescription(Key_Player4CurrentHP)
    local Player4MaxHP = addressList.getMemoryRecordByDescription(Key_Player4MaxHP)
    local Player4Name = addressList.getMemoryRecordByDescription(Key_Player4Name)

    if file ~= nil then
        -- format is just csv
        file:write(Player1CurrentHP.Value)
        file:write(",")
        file:write(Player1MaxHP.Value);
        file:write(",")
        file:write(Player1Name.Value);
        file:write(",")
        file:write(Player2CurrentHP.Value)
        file:write(",")
        file:write(Player2MaxHP.Value);
        file:write(",")
        file:write(Player2Name.Value);
        file:write(",")
        file:write(Player3CurrentHP.Value)
        file:write(",")
        file:write(Player3MaxHP.Value);
        file:write(",")
        file:write(Player3Name.Value);
        file:write(",")
        file:write(Player4CurrentHP.Value)
        file:write(",")
        file:write(Player4MaxHP.Value);
        file:write(",")
        file:write(Player4Name.Value);
        file:close()
    end
end

overlayDataUpdaterTimer.OnTimer = tick

tick()

[DISABLE]
overlayDataUpdaterTimer.destroy()
