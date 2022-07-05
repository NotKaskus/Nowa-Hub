local wallyRepo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local zxunysRepo = 'https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/Resources/Scripts/'
local zzerexxRepo = 'https://raw.githubusercontent.com/NotKaskus/Nowa-Hub/main/Resources/Lib/'

-- // Library
local Library = loadstring(game:HttpGet(wallyRepo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(wallyRepo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(wallyRepo .. 'addons/SaveManager.lua'))()
loadstring(game:HttpGet(zzerexxRepo .. 'UniversalEsp.lua'))()
loadstring(game:HttpGet(zxunysRepo .. 'Raw%20Main.lua'))()

-- // Environments
local AimbotEnv = getgenv().Aimbot
local EspEnv = getgenv().UESP

-- // Main Window
local Window = Library:CreateWindow({
	Title = 'Nowa Hub',
    Center = true, 
    AutoShow = true
})


--// Tabs
local Tabs = {
	Combat = Window:AddTab('Combat'),
	Visual = Window:AddTab('Visual'),
	Settings = Window:AddTab('Settings')
}

-- // Combat Aimbot Left Group Box
local AimbotGroupBox = Tabs.Combat:AddLeftGroupbox('Aimbot')

-- [[ Overide defaul aimbot fov ]]
AimbotEnv.FOVSettings.Enabled = false

-- [[ Enable/Disable Aimbot ]]
AimbotGroupBox:AddToggle('AIMBOT_TOGGLE', {
    Text = 'Toggle Aimbot',
    Default = false,
    Tooltip = 'Enable or Disable the aimbot module.',
})

Toggles.AIMBOT_TOGGLE:OnChanged(function()
	AimbotEnv.Settings.Enabled = Toggles.AIMBOT_TOGGLE.Value
end)


-- [[ Enable/Disable Alive Check ]]
AimbotGroupBox:AddToggle('AIMBOT_ALIVE_CHECK', {
    Text = 'Alive Check',
    Default = false,
    Tooltip = 'Enable or Disable alive check.',
})

Toggles.AIMBOT_ALIVE_CHECK:OnChanged(function()
	AimbotEnv.Settings.AliveCheck = Toggles.AIMBOT_ALIVE_CHECK.Value
end)


-- [[ Team Cheker ]]
AimbotGroupBox:AddToggle('AIMBOT_TEAM_CHECK', {
    Text = 'Team Check',
    Default = false,
    Tooltip = 'Aim only at enemy.',
})

Toggles.AIMBOT_TEAM_CHECK:OnChanged(function()
	AimbotEnv.Settings.TeamCheck = Toggles.AIMBOT_TEAM_CHECK.Value
end)


-- // Visual Left Group Box
local VisualGroupBox = Tabs.Visual:AddLeftGroupbox('Wall Hack')

EspEnv:Set('Tracers', 'Enabled', false)
EspEnv:Set('Names', 'ShowDistance', true)

VisualGroupBox:AddToggle('ESP_TEAM_CHECK', {
	Text = 'Team Check',
	Default = false,
	Tooltip = 'Only apply wallhack on enemy'
})

Toggles.ESP_TEAM_CHECK:OnChanged(function()
	EspEnv.TeamCheck = Toggles.ESP_TEAM_CHECK.Value
end)


VisualGroupBox:AddSlider('ESP_MAX_DISTANCE', {
	Text = 'Max Distance',
	Default = 500,
	Min = 100,
	Max = 1000,
	Rounding = 0,
	Compact = false
})

Options.ESP_MAX_DISTANCE:OnChanged(function()
    EspEnv.MaximumDistance = Options.ESP_MAX_DISTANCE.Value
end)


VisualGroupBox:AddDivider()


VisualGroupBox:AddToggle('ESP_BOXES', {
	Text = 'Boxes',
	Default = false,
	Tooltip = 'Displays a Box around characters.'
})

Toggles.ESP_BOXES:OnChanged(function()
	EspEnv:Set('Boxes', 'Enabled', Toggles.ESP_BOXES.Value)
end)


VisualGroupBox:AddToggle('ESP_SKELETONS', {
	Text = 'Show Skeletons',
	Default = false,
	Tooltip = 'Displays a line for each body part, creating a skeleton.'
})

Toggles.ESP_SKELETONS:OnChanged(function()
	EspEnv:Set('HeadDots', 'Enabled', Toggles.ESP_SKELETONS.Value)
	EspEnv:Set('Skeletons', 'Enabled', Toggles.ESP_SKELETONS.Value)
end)


VisualGroupBox:AddToggle('ESP_LOOK_TRACERS', {
	Text = 'Look Tracers',
	Default = false,
	Tooltip = 'Displays a line that originates from the character\'s head and extends forwards by a certain distance, indicating the direction the head is facing.'
})

Toggles.ESP_LOOK_TRACERS:OnChanged(function()
	EspEnv:Set('LookTracers', 'Enabled', Toggles.ESP_LOOK_TRACERS.Value)
end)


VisualGroupBox:AddToggle('ESP_NAMES', {
	Text = 'Show Name',
	Default = false,
	Tooltip = 'Displays the player\'s data such as name, distance and health.'
})

Toggles.ESP_NAMES:OnChanged(function()
	EspEnv:Set('Names', 'Enabled', Toggles.ESP_NAMES.Value)
end)


VisualGroupBox:AddToggle('ESP_HEALTH_BARS', {
	Text = 'Health Bars',
	Default = false,
	Tooltip = 'Displays a health bar below the character.'
})

Toggles.ESP_HEALTH_BARS:OnChanged(function()
	EspEnv:Set('HealthBars', 'Enabled', Toggles.ESP_HEALTH_BARS.Value)
end)


VisualGroupBox:AddToggle('ESP_RAINBOW_TOGGLE', {
	Text = 'Toggle Rainbow ESP',
	Default = false,
	Tooltip = 'Do you want the esp color to be rainbow?.'
})

Toggles.ESP_RAINBOW_TOGGLE:OnChanged(function()
	local ESP_RAINBOW = Toggles.ESP_RAINBOW_TOGGLE.Value
    EspEnv:Set('Boxes', 'RainbowColor', ESP_RAINBOW)
    EspEnv:Set('Skeletons', 'RainbowColor', ESP_RAINBOW)
    EspEnv:Set('HealthBars', 'RainbowColor', ESP_RAINBOW)
    EspEnv:Set('LookTracers', 'RainbowColor', ESP_RAINBOW)
    EspEnv:Set('Names', 'RainbowColor', ESP_RAINBOW)
    EspEnv:Set('HeadDots', 'RainbowColor', ESP_RAINBOW)
end)


VisualGroupBox:AddLabel('ESP Color'):AddColorPicker('ESP_COLOR', {
    Default = Color3.fromRGB(255,255,255),
    Title = 'ESP Color',
})

Options.ESP_COLOR:OnChanged(function()
	local ESP_COLOR = Options.ESP_COLOR.Value
    EspEnv:Set('Boxes', 'Color', ESP_COLOR)
    EspEnv:Set('Skeletons', 'Color', ESP_COLOR)
    EspEnv:Set('HealthBars', 'Color', ESP_COLOR)
    EspEnv:Set('LookTracers', 'Color', ESP_COLOR)
    EspEnv:Set('Names', 'Color', ESP_COLOR)
    EspEnv:Set('HeadDots', 'Color', ESP_COLOR)
end)



local FovGroupBox = Tabs.Visual:AddLeftGroupbox('Fov')

FovGroupBox:AddToggle('FOV_TOGGLE', {
	Text = 'Fov',
	Default = false,
	Tooltip = 'Only target players within the circle radius.'
})

Toggles.FOV_TOGGLE:OnChanged(function()
	AimbotEnv.FOVSettings.Enabled = Toggles.FOV_TOGGLE.Value
end)


FovGroupBox:AddSlider('FOV_SCALE', {
	Text = 'FOV Scale',
	Default = 90,
	Min = 50,
	Max = 500,
	Rounding = 0,
	Compact = false
})

Options.FOV_SCALE:OnChanged(function()
    AimbotEnv.FOVSettings.Amount = Options.FOV_SCALE.Value
end)

FovGroupBox:AddSlider('FOV_THICKNESS', {
	Text = 'FOV Thickness',
	Default = 1,
	Min = 0,
	Max = 10,
	Rounding = 0,
	Compact = false
})

Options.FOV_THICKNESS:OnChanged(function()
    AimbotEnv.FOVSettings.Thickness = Options.FOV_THICKNESS.Value
end)

local function RGBToString(RGB)
    return tostring(math.floor(RGB.R * 255))..", "..tostring(math.floor(RGB.G * 255))..", "..tostring(math.floor(RGB.B * 255))
end

FovGroupBox:AddLabel('FOV Color'):AddColorPicker('FOV_COLOR', {
    Default = Color3.fromRGB(255,255,255),
    Title = 'FOV Color',
})

Options.FOV_COLOR:OnChanged(function()
	AimbotEnv.FOVSettings.Color = RGBToString(Options.FOV_COLOR.Value)
end)


local TracerGroupBox = Tabs.Visual:AddRightGroupbox('Tracers')

TracerGroupBox:AddToggle('TRACER_TOGGLE', {
	Text = 'Toggle Tracers',
	Default = false,
	Tooltip = 'Displays a line that connects to the character.'
})

Toggles.TRACER_TOGGLE:OnChanged(function()
	EspEnv:Set('Tracers', 'Enabled', Toggles.TRACER_TOGGLE.Value)
end)


TracerGroupBox:AddDropdown('TRACER_ORIGIN', {
    Values = { 'Top', 'Center', 'Bottom', 'Mouse' },
    Default = 3,
    Multi = false,
    Text = 'Tracer Origin',
    Tooltip = 'The origin where the tracer line should be display',
})

Options.TRACER_ORIGIN:OnChanged(function()
	EspEnv:Set('Tracers', 'Origin', Options.TRACER_ORIGIN.Value)
end)


TracerGroupBox:AddLabel('Tracer Color'):AddColorPicker('TRACER_COLOR', {
    Default = Color3.fromRGB(255,255,255),
    Title = 'ESP Color',
})

Options.TRACER_COLOR:OnChanged(function()
	local TRACER_COLOR = Options.TRACER_COLOR.Value
    EspEnv:Set('Tracers', 'Color', TRACER_COLOR)
end)


TracerGroupBox:AddToggle('TRACER_RAINBOW_TOGGLE', {
	Text = 'Toggle Rainbow Tracers',
	Default = false,
	Tooltip = 'Do you want the tracer color to be rainbow?.'
})

Toggles.TRACER_RAINBOW_TOGGLE:OnChanged(function()
	EspEnv:Set('Tracers', 'RainbowColor', Toggles.TRACER_RAINBOW_TOGGLE.Value)
end)



local SettingsGroupBox = Tabs.Settings:AddLeftGroupbox('Menu')

SettingsGroupBox:AddButton('Unload', function()
	Library:Unload() -- Destroy the GUI
	getgenv().Aimbot.Functions:Exit() -- Destroy Aimbot Lib
	getgenv().UESP:Destroy() -- Destroy Esp Lib
end)

SettingsGroupBox:AddLabel('Menu Keybind'):AddKeyPicker('MenuKeybind', {
	Default = 'End',
	NoUI = true,
	Text = 'Menu keybind'
}) 

-- Hand the library over to our managers
SaveManager:SetLibrary(Library)
-- Ignore keys that are used by ThemeManager. 
SaveManager:SetFolder('MyScriptHub/Baseplate')
-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['Settings']) 