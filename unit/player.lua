local name, addon = ...
local oUF = addon.oUF or oUF
local Config = addon.Config
local Functions = addon.Functions

local ApplyPowerBar = function(self)
    local power = Functions['CreateStatusBar']('$parent_PowerBar', self)
    power:SetPoint('BOTTOMRIGHT', self, 'BOTTOMRIGHT', 0, 0)
    power:SetSize(134, 12)
    
    power.bg = power:CreateTexture(nil, 'BORDER')
    power.bg:SetAllPoints(power)
    power.bg:SetTexture(Config.Textures.StatusBar)
    power.bg:SetAlpha(0.30)
    
    power.Value = Functions.FontString(power, 'OVERLAY', Config.Fonts.Font, Config.Fonts.Size, nil, 'CENTER', true)
    power.Value:SetPoint('LEFT', power, 'LEFT', 2, 0)
    power.Value:SetTextColor(1, 1, 1)
    
    power.Percent = Functions.FontString(power, 'OVERLAY', Config.Fonts.Font, Config.Fonts.Size, nil, 'CENTER', true)
    power.Percent:SetPoint('RIGHT', power, 'RIGHT', -2, 0)
    power.Percent:SetTextColor(1, 1, 1)
    
    power.frequentUpdates = true
    power.Smooth = true
    power.colorClass = true
    power.colorReaction = true
    power.colorDisconnected = true
    power.colorTapping = true
    
    power.PreUpdate = Functions.PreUpdatePower
    power.PostUpdate = Functions.PostUpdatePower
    
    self.Power = power;
end

local ApplyHealthBar = function(self)
    local health = Functions.CreateStatusBar('$parent_HealthBar', self)
    health:SetPoint('TOPRIGHT', self, 'TOPRIGHT', 0,0)
    health:SetSize(134, 22)
    
    health.bg = health:CreateTexture(nil, 'BORDER')
    health.bg:SetAllPoints(health)
    health.bg:SetTexture(Config.Textures.StatusBar)
    health.bg:SetAlpha(0.30)
    
    health.Value = Functions.FontString(health, 'OVERLAY', Config.Fonts.Font, Config.Fonts.Size, nil, 'CENTER', true)
    health.Value:SetPoint('LEFT', health, 'LEFT', 2, 0)
    health.Value:SetTextColor(1, 1, 1)
    
    health.Percent = Functions.FontString(health, 'OVERLAY', Config.Fonts.Font, Config.Fonts.Size, nil, 'CENTER', true)
    health.Percent:SetPoint('RIGHT', health, 'RIGHT', -2, 0)
    health.Percent:SetTextColor(1, 1, 1)
    
    health.frequentUpdates = true
    health.Smooth = true
    health.colorClass = true
    health.colorReaction = true
    health.colorDisconnected = true
    health.colorTapping = true
    
    health.PreUpdate = Functions.PreUpdateHealth
    health.PostUpdate = Functions.PostUpdateHealth
    
    self.Health = health
end

local ApplyPortrait = function(self)
    local portrait = CreateFrame('PlayerModel', nil, self)
    portrait:SetSize(36, 36)
    portrait:SetPoint('TOPLEFT', self, 'TOPLEFT', 0, 0)

    self.Portrait = portrait
end

local Apply = function(self)
    local config = Config.Units.Player
        
    self:RegisterForClicks('AnyUp')
    self:SetScript('OnEnter', UnitFrame_OnEnter)
    self:SetScript('OnLeave', UnitFrame_OnLeave)
    
    self:SetSize(170, 36)
    self:SetScale(1.0)
    self:SetPoint('CENTER', UIParent, 'CENTER', -200, -60)
    
    self:SetFrameStrata('BACKGROUND')
    self:SetFrameLevel(1)
    
    Functions.ApplyBackdrop(self)
    
    self.RaisedFrame = CreateFrame('Frame', '$parent_RaisedFrame', self)
    self.RaisedFrame:SetAllPoints(self)
    self.RaisedFrame:SetFrameLevel(self:GetFrameLevel() + 20)
    
    ApplyPowerBar(self)
    ApplyHealthBar(self)
    ApplyPortrait(self)
end

oUF:RegisterStyle('berwyn:player', Apply)
oUF:SetActiveStyle('berwyn:player')
oUF:Spawn('player', 'oUF_player')