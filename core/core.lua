local name, addon = ...
local oUF = addon.oUF or oUF
local Config = addon.Config

local Functions = CreateFrame('Frame')
addon.Functions = Functions

------------
-- Utilities
------------

Functions.CreateStatusBar = function(name, parent, texture, color)
    local StatusBar = CreateFrame('StatusBar', name or nil, parent or UIParent)
    StatusBar:SetStatusBarTexture(texture or Config.Textures.StatusBar)
    StatusBar:GetStatusBarTexture():SetHorizTile(false)
    
    if(color) then
        StatusBar:SetStatusBarColor(unpack(color))
    end
    
    return StatusBar
end

Functions.ApplyBackdrop = function(self)
    if(not self) then return end
    
    self:SetBackdrop(Config.Backdrop)
    self:SetBackdropColor(0, 0, 0, 1)
end

Functions.FontString = function(parent, layer, type, size, style, justifyH, shadow)
    local fontString = parent:CreateFontString(nil, layer or 'OVERLAY')
    fontString:SetFont(type, size or 10, style or nil)
    fontString:SetJustifyH(justifyH or 'CENTER')
        
    if(shadow) then
        fontString:SetShadowColor(0, 0, 0)
        fontString:SetShadowOffset(1.25, -1.25)
    end
    
    return fontString
end

----------------
-- Power updates
----------------

Functions.PreUpdatePower = function(self, unit)
    local powerType = select(2, UnitPowerType(unit))
    local colors = Config.Colors.Power[powerType]
    
    if(colors) then
        self:SetStatusBarTexture(unpack(colors))
    end
end

Functions.PostUpdatePower = function(self, unit, min, max)
    if(not UnitIsPlayer(unit)) then
        self.Value:SetText('')
        self.Percent:SetText('')
    else
        local powerType = select(2, UnitPowerType(unit))
        local colors = Config.Colors.Power[powerType]
        
        self.Value:SetText(min .. '/' .. max)
        if(powerType == 'MANA') then
            self.Percent:SetText(math.floor(min/max * 100) .. '%')
        else
            self.Percent:SetText(min)
        end
    end
end


-----------------
-- Health updates
-----------------

Functions.PreUpdateHealth = function(self, unit)
    local class, classFileName = UnitClass(unit)
    local color = RAID_CLASS_COLORS[classFileName]
    
    if(color) then
        self:SetStatusBarTexture(color.r, color.g, color.b, 1.0)
    end
end

Functions.PostUpdateHealth = function(self, unit, min, max)
    local r, g, b
    
    local duration = math.floor(min/max*100)
    
    if(max ~= 0) then
        r, g, b = oUF.ColorGradient(min, max, 1, 0, 0, 1, 1, 0, 1, 1, 1)
    end
     
    if(not UnitIsConnected(unit)) then
        self.Value:SetText('')
        self.Percent:SetText('offline')
        self.Percent:SetTextColor(0.8, 0.8, 0.8)
    elseif(UnitIsGhost(unit)) then
        self.Value:SetText('')
        self.Percent.SetText('ghost')
        self.Percent:SetTextColor(0.8, 0.8, 0.8)
    elseif(UnitIsDead(unit)) then
        self.Value:SetText('')
        self.Percent:SetText('dead')
        self.Percent:SetTextColor(0.8, 0.8, 0.8)
    elseif(unit == 'player') then
        self.Value:SetText(min .. '/' .. max)
        self.Percent:SetText(duration .. '%')
        self.Percent:SetTextColor(r, g, b)
    elseif(unit == 'target' or unit == 'focus' or self:GetParent():GetName():match('oUF_Party')) then
        self.Value:SetText(min .. '/' .. max)
        self.Percent:SetText(duration .. '%')
        self.Percent:SetTextColor(r, g, b)
    else
        self.Value:SetText('')
        self.Percent:SetText(duration .. '%')
    end
end