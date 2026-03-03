-- pfUI-style skinning for XLoot
local _G = getfenv(0)

-- pfUI color scheme
local pfUI_colors = {
    bg = {0, 0, 0, 0.9},           -- Dark background
    border = {0.4, 0.4, 0.4, 1},   -- Gray border
    border_col = {0.6, 0.6, 0.6, 1}, -- Lighter gray for colored borders
    header = {0.1, 0.1, 0.1, 1},   -- Slightly lighter header
}

-- pfUI backdrop template
local pfUI_backdrop = {
    bgFile = "Interface\\AddOns\\XLoot\\media\\bg",
    edgeFile = "Interface\\AddOns\\XLoot\\media\\border",
    tile = true, 
    tileSize = 12, 
    edgeSize = 12,
    insets = {left = 0, right = 0, top = 0, bottom = 0}
}

-- Quality border texture
local quality_border_texture = "Interface\\AddOns\\XLoot\\media\\border_col"

function XLoot:Skin(frame, header, bba, ba, fh, bd)
    if not frame then return end
    
    local backdrop = bd or pfUI_backdrop
    frame:SetBackdrop(backdrop)
    
    -- Use pfUI colors or custom if provided
    local border_r = pfUI_colors.border[1]
    local border_g = pfUI_colors.border[2]
    local border_b = pfUI_colors.border[3]
    local border_a = bba or pfUI_colors.border[4]
    
    local bg_r = pfUI_colors.bg[1]
    local bg_g = pfUI_colors.bg[2]
    local bg_b = pfUI_colors.bg[3]
    local bg_a = ba or pfUI_colors.bg[4]
    
    frame:SetBackdropBorderColor(border_r, border_g, border_b, border_a)
    frame:SetBackdropColor(bg_r, bg_g, bg_b, bg_a)
    
    -- Add gradient fade effect (pfUI style)
    if not frame.tfade then 
        frame.tfade = frame:CreateTexture(nil, "BORDER") 
    end
    frame.tfade:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
    frame.tfade:SetPoint("TOPLEFT", frame, "TOPLEFT", 1, -1)
    frame.tfade:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -1, 1)
    frame.tfade:SetBlendMode("ADD")
    frame.tfade:SetGradientAlpha("VERTICAL", .1, .1, .1, 0, .2, .2, .2, 0.3)
    
    -- Handle header if present
    if header and _G[frame:GetName().."Header"] then
        _G[frame:GetName().."Header"]:Hide()
        _G[frame:GetName().."Header"]:SetPoint("TOP", frame, "TOP", 0, 7)
    end
end

function XLoot:QualityBorder(button)
    local frame = button.wrapper or button
    local border = frame:CreateTexture(button:GetName() .. "QualBorder", "OVERLAY")
    border:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
    border:SetBlendMode("ADD")
    border:SetAlpha(1)
    border:SetHeight(button:GetHeight() * 1.8)
    border:SetWidth(button:GetWidth() * 1.8)
    border:SetPoint("CENTER", frame, "CENTER", 0, 1)
    border:Hide()
    return border
end

function XLoot:QualityBorderResize(frame, hmult, ymult, hoff, yoff)
    local border = _G[frame:GetName().."QualBorder"]
    if not border then return end
    local width, height = frame:GetWidth(), frame:GetHeight()
    border:SetHeight(height * (ymult or 1.62))
    border:SetWidth(width * (hmult or 1.72))
    border:SetPoint("CENTER", frame, "CENTER", hoff or 5, yoff or 1)
end

function XLoot:BackdropFrame(frame, bgcolor, bordercolor)
    frame:SetBackdrop(pfUI_backdrop)
    frame:SetBackdropColor(unpack(bgcolor or {0, 0, 0, 0.9}))
    frame:SetBackdropBorderColor(unpack(bordercolor or {0.4, 0.4, 0.4, 1}))
end

function XLoot:ItemButtonWrapper(button, woff, hoff, edgesize, borderinset)
    local wrapper = button.wrapper or CreateFrame("Frame", button:GetName().."Wrapper", button)
    wrapper:SetWidth(button:GetWidth() + (woff or 10))
    wrapper:SetHeight(button:GetHeight() + (hoff or 10))
    wrapper:ClearAllPoints()
    wrapper:SetPoint("CENTER", button, "CENTER")
    
    self:Skin(wrapper)
    
    if edgesize then
        local backdrop = wrapper:GetBackdrop()
        backdrop.edgeSize = edgesize
        wrapper:SetBackdrop(backdrop)
    end
    
    wrapper:SetBackdropColor(1, 1, 1, 0)
    wrapper:SetBackdropBorderColor(.7, .7, .7, 1)
    wrapper:Show()
    return wrapper
end

-- pfUI-style close button creation
function XLoot:CreateCloseButton(parent, onClickFunc)
    local close = CreateFrame("Button", nil, parent)
    close:SetWidth(16)
    close:SetHeight(16)
    close:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -3, -3)
    
	-- Background
    close:SetBackdrop({
        bgFile = "Interface\\AddOns\\XLoot\\media\\bg",
        edgeFile = "Interface\\AddOns\\XLoot\\media\\border_col",
        tileSize = 8,
        edgeSize = 8,
        insets = {left = 0, right = 0, top = 0, bottom = 0}
    })
    close:SetBackdropColor(0.2, 0.1, 0.1, 0.9)
    close:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
	
    -- Close icon (using your close.tga)
    local icon = close:CreateTexture(nil, "OVERLAY")
    icon:SetTexture("Interface\\AddOns\\XLoot\\media\\close")
    icon:SetAllPoints(close)
    icon:SetVertexColor(1, 0.3, 0.3, 1)
    
    -- Highlight texture
    local highlight = close:CreateTexture(nil, "HIGHLIGHT")
    highlight:SetTexture("Interface\\AddOns\\XLoot\\media\\close")
    highlight:SetAllPoints(close)
    highlight:SetVertexColor(1, 0.6, 0.6, 1)
    
    close:SetScript("OnClick", onClickFunc or function() parent:Hide() end)
    close:SetScript("OnEnter", function()
        icon:SetVertexColor(1, 0.5, 0.5, 1)
    end)
    close:SetScript("OnLeave", function()
        icon:SetVertexColor(1, 0.3, 0.3, 1)
    end)
    
    return close
end

-- pfUI-styled loot button skin
function XLoot:SkinLootButton(button)
    if not button then return end
    
    -- Disable default Blizzard textures
    button:DisableDrawLayer("BORDER")
    button:DisableDrawLayer("BACKGROUND")
    
    -- Hide default textures
    for i = 1, button:GetNumRegions() do
        local region = select(i, button:GetRegions())
        if region:GetObjectType() == "Texture" then
            local tex = region:GetTexture()
            if tex and (string.find(tex, "Border") or string.find(tex, "LootSlot") or string.find(tex, "Normal")) then
                region:Hide()
            end
        end
    end
    
    -- Apply custom backdrop
    button:SetBackdrop(pfUI_backdrop)
    button:SetBackdropColor(0, 0, 0, 0.95)
    button:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
    
    -- Increase frame level to ensure backdrop shows
    button:SetFrameLevel(button:GetFrameLevel() + 10)
end