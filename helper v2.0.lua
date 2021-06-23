script_name('helper')
script_author('VK - @xkelling')

require "lib.moonloader"
local imgui = require 'imgui'
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8

local main_window_state = imgui.ImBool(false)
local type_window = imgui.ImInt(1)


function main()
if not isSampfuncsLoaded() or not isSampLoaded() then return end
while not isSampAvailable() do wait(100) end
sampRegisterChatCommand('helper', helper)
sampRegisterChatCommand('hel', hel)
sampAddChatMessage("[Admin-Scripts] ", -1)
imgui.Process = false

while true do
wait(0)
imgui.Process = main_window_state.v
end end


function helper()
	main_window_state.v = not main_window_state.v
end

------------
function imgui.OnDrawFrame()
local sw, sh = getScreenResolution()
imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
imgui.Begin("##main", _, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize + imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.AlwaysAutoResize)

imgui.BeginGroup()
imgui.BeginChild("##main", imgui.ImVec2(180, 120), true)
imgui.EndChild()

if imgui.Button(u8('Adminka Binder '), imgui.ImVec2(180, 30)) then
	type_window.v = 1
end

if imgui.Button(u8('Lovlya /ot '), imgui.ImVec2(180, 30)) then
	type_window.v = 2
end

if imgui.Button(u8('Fix goto '), imgui.ImVec2(180, 30)) then
	type_window.v = 3
end

if imgui.Button(u8('Настройки '), imgui.ImVec2(180, 30)) then
	type_window.v = 4
end
imgui.EndGroup()

imgui.SameLine()

imgui.BeginChild("##main2", imgui.ImVec2(350, 255), true)

if type_window.v == 1 then
imgui.Text(u8'123')
end

imgui.EndChild()

imgui.End()
end
------------
function imgui.TextQuestion(label, description)
    imgui.TextDisabled(label)

    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
            imgui.PushTextWrapPos(600)
                imgui.TextUnformatted(description)
            imgui.PopTextWrapPos()
        imgui.EndTooltip()
    end
end
------------
imgui.SwitchContext()
local style = imgui.GetStyle()
local style = imgui.GetStyle()
local colors = style.Colors
local clr = imgui.Col
local ImVec4 = imgui.ImVec4
local ImVec2 = imgui.ImVec2
style.WindowRounding = 3.0
style.FrameRounding = 3.0
style.ChildWindowRounding = 3.0
style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
colors[clr.Text] = ImVec4(0.95, 0.96, 0.98, 1.00)
colors[clr.TextDisabled] = ImVec4(0.36, 0.42, 0.47, 1.00)
colors[clr.WindowBg] = ImVec4(0.11, 0.15, 0.17, 1.00)
colors[clr.ChildWindowBg] = ImVec4(0.15, 0.18, 0.22, 1.00)
colors[clr.PopupBg] = ImVec4(0.08, 0.08, 0.08, 0.94)
colors[clr.Border] = ImVec4(0.43, 0.43, 0.50, 0.50)
colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
colors[clr.FrameBg] = ImVec4(0.20, 0.25, 0.29, 1.00)
colors[clr.FrameBgHovered] = ImVec4(0.12, 0.20, 0.28, 1.00)
colors[clr.FrameBgActive] = ImVec4(0.09, 0.12, 0.14, 1.00)
colors[clr.TitleBg] = ImVec4(0.09, 0.12, 0.14, 0.65)
colors[clr.TitleBgCollapsed] = ImVec4(0.00, 0.00, 0.00, 0.51)
colors[clr.TitleBgActive] = ImVec4(0.08, 0.10, 0.12, 1.00)
colors[clr.MenuBarBg] = ImVec4(0.15, 0.18, 0.22, 1.00)
colors[clr.ScrollbarBg] = ImVec4(0.02, 0.02, 0.02, 0.39)
colors[clr.ScrollbarGrab] = ImVec4(0.20, 0.25, 0.29, 1.00)
colors[clr.ScrollbarGrabHovered] = ImVec4(0.18, 0.22, 0.25, 1.00)
colors[clr.ScrollbarGrabActive] = ImVec4(0.09, 0.21, 0.31, 1.00)
colors[clr.ComboBg] = ImVec4(0.20, 0.25, 0.29, 1.00)
colors[clr.CheckMark] = ImVec4(0.28, 0.56, 1.00, 1.00)
colors[clr.SliderGrab] = ImVec4(0.28, 0.56, 1.00, 1.00)
colors[clr.SliderGrabActive] = ImVec4(0.37, 0.61, 1.00, 1.00)
colors[clr.Button] = ImVec4(0.20, 0.25, 0.29, 1.00)
colors[clr.ButtonHovered] = ImVec4(0.28, 0.56, 1.00, 1.00)
colors[clr.ButtonActive] = ImVec4(0.06, 0.53, 0.98, 1.00)
colors[clr.Header] = ImVec4(0.20, 0.25, 0.29, 0.55)
colors[clr.HeaderHovered] = ImVec4(0.26, 0.59, 0.98, 0.80)
colors[clr.HeaderActive] = ImVec4(0.26, 0.59, 0.98, 1.00)
colors[clr.ResizeGrip] = ImVec4(0.26, 0.59, 0.98, 0.25)
colors[clr.ResizeGripHovered] = ImVec4(0.26, 0.59, 0.98, 0.67)
colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
colors[clr.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
colors[clr.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39)
colors[clr.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00)
colors[clr.PlotLines] = ImVec4(0.61, 0.61, 0.61, 1.00)
colors[clr.PlotLinesHovered] = ImVec4(1.00, 0.43, 0.35, 1.00)
colors[clr.PlotHistogram] = ImVec4(0.90, 0.70, 0.00, 1.00)
colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
colors[clr.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)
