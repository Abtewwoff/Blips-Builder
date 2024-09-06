local TextPanels = {
    Background = { Dictionary = "adastramenu", Texture = "gradient_bgd", Y = 0, Width = 371, Height = 42 },
    Text = {
        Title = { X = 8, Y = 10, Scale = 0.32 },
        Left = { X = 8, Y = 40, Scale = 0.28 },
        Right = { X = 8, Y = 40, Scale = 0.28 },
    },
}

---BoutonPanel
---@param LeftText string
---@param RightText string
---@public
function RageUI.InfosPanel(TitleText, LeftText, RightText, Index, Heighttest)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        local leftTextSize = MeasureStringWidth(LeftText)
        if CurrentMenu() and (Index == nil or (CurrentMenu.Index == Index)) then
            RenderRectangle(CurrentMenu.X + 480, CurrentMenu.Y + TextPanels.Background.Y + CurrentMenu.SubtitleHeight + (RageUI.StatisticPanelCount * 42), TextPanels.Background.Width + CurrentMenu.WidthOffset, Heighttest, 0, 0, 0, 150)
            RenderText(TitleText or "", CurrentMenu.X + 480 + TextPanels.Text.Title.X, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + TextPanels.Text.Title.Y + CurrentMenu.SubtitleHeight, 0, TextPanels.Text.Title.Scale, 245, 245, 245, 255, 0)
            RenderText(LeftText or "", CurrentMenu.X + 480 + TextPanels.Text.Left.X, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + TextPanels.Text.Left.Y + CurrentMenu.SubtitleHeight, 0, TextPanels.Text.Left.Scale, 245, 245, 245, 255, 0)
            RenderText(RightText or "", CurrentMenu.X + 480 + TextPanels.Background.Width + CurrentMenu.WidthOffset - leftTextSize, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + TextPanels.Text.Left.Y + CurrentMenu.SubtitleHeight, 0, TextPanels.Text.Left.Scale, 245, 245, 245, 255, 2)
            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end

function RageUI.Info(Title, RightText, LeftText)
    local LineCount = #RightText >= #LeftText and #RightText or #LeftText
    if Title ~= nil then
        RenderText("~h~" .. Title .. "~h~", 400 + 82, 75, 0, 0.34, 255, 255, 255, 255, 0)
    end
    if RightText ~= nil then
        RenderText(table.concat(RightText, "\n"), 400 + 80, Title ~= nil and 105 or 7, 0, 0.28, 255, 255, 255, 255, 0)
    end
    if LeftText ~= nil then
        RenderText(table.concat(LeftText, "\n"), 400 + 400 + 70, Title ~= nil and 105 or 7, 0, 0.28, 255, 255, 255, 255, 2)
    end
    RenderRectangle(400 + 75, 70, 400, Title ~= nil and 50 + (LineCount * 20) or ((LineCount + 1) * 20), 0, 0, 0, 160)
end

---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by iTexZ.
--- DateTime: 05/11/2020 02:17
---

local TextPanels = {
    Background = { Dictionary = "tespascool", Texture = "gradient_bgd", Y = 0, Width = 571, Height = 42 },
}

---@type Panel
function RageUI.RenderBoutique(Dictionary, Texture)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            RenderSprite(Dictionary, Texture, 500.0, 0.0, 350.0, 200.0, 0, 255, 255, 255, 255);
            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end
function RageUI.RenderPack(Dictionary, Texture)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            RenderSprite(Dictionary, Texture, 0.0, 320.0, 471.0, 250.0, 0, 255, 255, 255, 255);
            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end


function RageUI.RenderWeapons(Dictionary, Texture)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            RenderSprite(Dictionary, Texture, CurrentMenu.X, CurrentMenu.Y + TextPanels.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + (RageUI.StatisticPanelCount * 42), TextPanels.Background.Width + CurrentMenu.WidthOffset, TextPanels.Background.Height + 200, 0, 255, 255, 255, 255);
            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end

function RageUI.RenderVIP(Dictionary, Texture)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            RenderSprite(Dictionary, Texture, CurrentMenu.X, 220.25, TextPanels.Background.Width + CurrentMenu.WidthOffset, TextPanels.Background.Height + 200, 0, 255, 255, 255, 255);
            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end

---@type Panel
function RageUI.CaissePreviewOpen(Dictionary, Texture)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            RenderSprite(Dictionary, Texture, CurrentMenu.X, CurrentMenu.Y + TextPanels.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + (RageUI.StatisticPanelCount * 42), TextPanels.Background.Width + CurrentMenu.WidthOffset, TextPanels.Background.Height + 200, 0, 255, 255, 255, 255);
            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end
---@type Panel
function RageUI.RenderCaisse(Dictionary, Texture)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            RenderSprite(Dictionary, Texture, CurrentMenu.X, 300.25, TextPanels.Background.Width + CurrentMenu.WidthOffset, TextPanels.Background.Height + 200, 0, 255, 255, 255, 255);
            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end

---@type Panel
function RageUI.RenderCaissePreview(Dictionary, Texture)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            RenderSprite(Dictionary, Texture, CurrentMenu.X, 530.25, TextPanels.Background.Width + CurrentMenu.WidthOffset, TextPanels.Background.Height + 200, 0, 255, 255, 255, 255);
            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end

---@type Panel
function RageUI.RenderJournalier(Dictionary, Texture)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            RenderSprite(Dictionary, Texture, CurrentMenu.X, 400.25, TextPanels.Background.Width + CurrentMenu.WidthOffset, TextPanels.Background.Height + 200, 0, 255, 255, 255, 255);
            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end

local BoxSettings = {
    itemPerLine = 4,
    width = 215,
    height = 120,
    space = 5
}

function RageUI.RenderBox(Items)
    local lastLine = 0;
    for k, v in pairs(VisualitionCaisse[Items]) do
        local x = 525 + (((k -1) - (BoxSettings.itemPerLine * lastLine)) * (BoxSettings.width + BoxSettings.space))
        local y = (lastLine * (BoxSettings.height + BoxSettings.space))
        RenderSprite("caissemystere", v.model, x, y, BoxSettings.width, BoxSettings.height, 0, 255, 255, 255, 255)
        if math.tointeger(k / BoxSettings.itemPerLine) ~= nil then
            lastLine = math.tointeger(k / BoxSettings.itemPerLine)
        end
    end
end