function Faemod_Print(...)
    -- Faemod_PrintDebug(...)
    local args = {...}
    local string = 'Faemod: '
    for i,v in pairs(args) do
        string = string .. tostring(v)
    end
    print(string)
end

function Faemod_PrintDebug(...)
    local debug = true
    if debug then
        local args = {...}
        local string = 'Faemod_DEBUG: '
        for i,v in pairs(args) do
            string = string .. tostring(i) .. "," .. tostring(v) .. " "
        end
        print(string)
    end
end

function Faemod_OnLoad()
    Faemod_Print('Running Fae\'s Custom Stuff')
    Faemod_SymmetricalPlayerFrames(135,-300)
    Faemod_FocusFrame(340,-180)
    --Faemod_HideVendorTooltip()
end

function Faemod_FocusFrame(x,y)
    -- focus
    Faemod_Print('Setting Focus Frame (',x,',',y,')')
    FocusFrame:ClearAllPoints()
    FocusFrame:SetMovable(true) 
        FocusFrame:SetPoint("CENTER",UIParent,x,y)
        FocusFrame:SetUserPlaced(true)
    FocusFrame:SetMovable(false)
end


function Faemod_SymmetricalPlayerFrames(x,y)
    -- player
    Faemod_Print('Setting PlayerFrame (',-x,',',y,')')
    PlayerFrame:ClearAllPoints() 
    PlayerFrame:SetMovable(true) 
        PlayerFrame:SetPoint("CENTER",UIParent,-x,y) 
        PlayerFrame:SetUserPlaced(true)
    PlayerFrame:SetMovable(false)
    -- target
    Faemod_Print('Setting TargetFrame (',x,',',y,')')
    TargetFrame:ClearAllPoints()
    TargetFrame:SetMovable(true) 
        TargetFrame:SetPoint("CENTER",UIParent,x,y)
        TargetFrame:SetUserPlaced(true)
    TargetFrame:SetMovable(false)
end

function Faemod_PartyFrameScale(x)
    Faemod_Print('Setting Party Member Unit Frame Scale x',x)
    PartyMemberFrame1:SetScale(x)
    PartyMemberFrame2:SetScale(x)
    PartyMemberFrame3:SetScale(x)
    PartyMemberFrame4:SetScale(x)
end

function Faemod_HideVendorTooltip()
    Faemod_Print('Hiding default vendor tooltip')
        
    --auctionator_orig_GameTooltip_OnTooltipAddMoney = GameTooltip_OnTooltipAddMoney;
    GameTooltip_OnTooltipAddMoney = Faemod_original;
end
function Faemod_GameTooltip_OnTooltipAddMoney(self, cost, maxcost)
    return
    --auctionator_orig_GameTooltip_OnTooltipAddMoney (self, cost, maxcost);
end

Faemod_OnLoad()