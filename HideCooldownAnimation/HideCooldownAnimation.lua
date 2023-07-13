local function hideSpellCastAnimFrame(button)
    button.SpellCastAnimFrame:Hide()
end

local function hideInterruptDisplay(button)
    button.InterruptDisplay:Hide()
end

local function hideTargetReticleAnimFrame(button)
    button.TargetReticleAnimFrame:Hide()
end

local function hideCastAnimations(button)
    button.cooldown:SetDrawBling(true)


    hooksecurefunc(button, "PlaySpellCastAnim", hideSpellCastAnimFrame)
    hooksecurefunc(button, "PlaySpellInterruptedAnim", hideInterruptDisplay)
    hooksecurefunc(button, "PlayTargettingReticleAnim", hideTargetReticleAnimFrame)
end

hooksecurefunc("StartChargeCooldown", function(button)
    button.chargeCooldown:SetEdgeTexture("Interface\\Cooldown\\edge")
end)

-- hide the cooldown flash animation
hooksecurefunc("ActionButtonCooldown_OnCooldownDone", function(cooldown)
    local cooldownFlash = cooldown:GetParent().CooldownFlash

    if cooldownFlash then
        cooldownFlash:Hide()
    end
end)

-- register known action buttons
for _, button in pairs(ActionBarButtonEventsFrame.frames) do
    hideCastAnimations(button)
end

-- and watch for any additional action buttons
hooksecurefunc(ActionBarButtonEventsFrame, "RegisterFrame", function(_, button)
    hideCastAnimations(button)
end)