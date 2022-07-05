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


-- // Combat Aimbot Left Group Box
local VisualGroupBox = Tabs.Visual:AddLeftGroupbox('Visual')

EspEnv:Set('Tracers', 'Enabled', false)
EspEnv:Set('Boxes', 'Enabled', false)
EspEnv:Set('Skeletons', 'Enabled', false)
EspEnv:Set('LookTracers', 'Enabled', false)
EspEnv:Set('HeadDots', 'Enabled', false)
EspEnv:Set('Names', 'Enabled', false)
EspEnv:Set('HealthBars', 'Enabled', false)

VisualGroupBox:AddToggle('ESP_TOGGLE', {
	Text = 'Toggle ESP',
	Default = false,
	Tooltip = 'Enable or Disable the esp module.'
})

Toggles.ESP_TOGGLE:OnChanged(function()
	local ESP_TOGGLE = Toggles.ESP_TOGGLE.Value
	EspEnv:Set('Boxes', 'Enabled', ESP_TOGGLE)
	EspEnv:Set('Skeletons', 'Enabled', ESP_TOGGLE)
	EspEnv:Set('LookTracers', 'Enabled', ESP_TOGGLE)
	EspEnv:Set('HeadDots', 'Enabled', ESP_TOGGLE)
	EspEnv:Set('Names', 'Enabled', ESP_TOGGLE)
	EspEnv:Set('HealthBars', 'Enabled', ESP_TOGGLE)
end)


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

local SettingsGroupBox = Tabs.Settings:AddLeftGroupbox('Menu')

SettingsGroupBox:AddButton('Unload', function()
		Library:Unload() -- Destroy the GUI
		getgenv().Aimbot.Functions:Exit() -- Destroy Aimbot Lib
		getgenv().UESP:Destroy() -- Destroy Esp Lib
end)