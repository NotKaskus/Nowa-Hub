local wallyRepo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local zxunysRepo = 'https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/'
local nowaRepo = 'https://raw.githubusercontent.com/NotKaskus/Nowa-Hub/main/'

-- // Library
local Library = loadstring(game:HttpGet(wallyRepo .. 'Library.lua'))()
local SaveManager = loadstring(game:HttpGet(wallyRepo .. 'addons/SaveManager.lua'))()
loadstring(game:HttpGet(nowaRepo .. 'Resources/Lib/UniversalSilentAim.lua'))()
loadstring(game:HttpGet(nowaRepo .. 'Resources/Lib/UniversalEsp.lua'))()
loadstring(game:HttpGet(zxunysRepo .. 'Resources/Scripts/Raw%20Main.lua'))()

-- // Environments
local AimbotEnv = getgenv().Aimbot
local EspEnv = getgenv().UESP
local SilentAimEnv = getgenv().SilentAim

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
local SilentAimGroupBox = Tabs.Combat:AddRightGroupbox('Silent Aim')

-- [[ Silent Aim Toggle ]]
SilentAimGroupBox:AddToggle('SILENT_AIM_TOGGLE', {
    Text = 'Toggle Silent Aim',
    Default = false,
    Tooltip = 'Aim only at enemy.',
})

Toggles.SILENT_AIM_TOGGLE:OnChanged(function()
	SilentAimEnv.Functions:Set('Enabled', Toggles.SILENT_AIM_TOGGLE.Value)
end)


-- [[ Team Cheker ]]
SilentAimGroupBox:AddToggle('SILENT_AIM_TEAM_CHECK', {
    Text = 'Team Check',
    Default = false,
    Tooltip = 'Aim only at enemy.',
})

Toggles.SILENT_AIM_TEAM_CHECK:OnChanged(function()
	SilentAimEnv.Functions:Set('TeamCheck', Toggles.SILENT_AIM_TEAM_CHECK.Value)
end)


SilentAimGroupBox:AddDropdown('SILENT_AIM_TARGET_PART', {
    Values = {"Head", "HumanoidRootPart", "Random"},
    Default = 1,
    Multi = false,
    Text = 'Target Part',
    Tooltip = 'The part of the body that will be used by silent aim.',
})

Options.SILENT_AIM_TARGET_PART:OnChanged(function()
    SilentAimEnv.Functions:Set('TargetPart', Options.SILENT_AIM_TARGET_PART.Value)
end)


SilentAimGroupBox:AddDropdown('SILENT_AIM_METHOD', {
    Values = {'Raycast', 'FindPartOnRay', 'FindPartOnRayWithWhitelist', 'FindPartOnRayWithIgnoreList', 'Mouse.Hit/Target'},
    Default = 1,
    Multi = false,
    Text = 'Silent Aim Method',
    Tooltip = 'The method to use by the silent aim module.',
})

Options.SILENT_AIM_METHOD:OnChanged(function()
    SilentAimEnv.Functions:Set('SilentAimMethod', Options.SILENT_AIM_METHOD.Value)
end)


SilentAimGroupBox:AddSlider('SILENT_AIM_HIT_CHANCE', {
    Text = 'Hit Chance',
    Default = 100,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Compact = false, -- If set to true, then it will hide the label
})

Options.SILENT_AIM_HIT_CHANCE:OnChanged(function()
    SilentAimEnv.Functions:Set('HitChance', Options.SILENT_AIM_HIT_CHANCE.Value)
end)


SilentAimGroupBox:AddDivider()


SilentAimGroupBox:AddToggle('SILENT_AIM_HIT_PREDICTION_TOGGLE', {
    Text = 'Mouse.Hit/Target Prediction',
    Default = false,
    Tooltip = 'Enable Target prediction for "Mouse.Hit/Target" method.',
})

Toggles.SILENT_AIM_HIT_PREDICTION_TOGGLE:OnChanged(function()
	SilentAimEnv.Functions:Set('MouseHitPrediction', Toggles.SILENT_AIM_HIT_PREDICTION_TOGGLE.Value)
end)


SilentAimGroupBox:AddSlider('SILENT_AIM_HIT_PREDICTION_CHANCE', {
    Text = 'Hit Chance',
    Default = 0.165,
    Min = 0,
    Max = 10,
    Rounding = 3,
    Compact = false, -- If set to true, then it will hide the label
})

Options.SILENT_AIM_HIT_PREDICTION_CHANCE:OnChanged(function()
    SilentAimEnv.Functions:Set('MouseHitPredictionAmount', Options.SILENT_AIM_HIT_PREDICTION_CHANCE.Value)
end)


-- // Visual Left Group Box
local VisualGroupBox = Tabs.Visual:AddLeftGroupbox('Wall Hack')

EspEnv:Set('Tracers', 'Enabled', false)
EspEnv:Set('Names', 'ShowDistance', true)


-- [[ Team Cheker ]]
VisualGroupBox:AddToggle('ESP_TEAM_CHECK', {
	Text = 'Team Check',
	Default = false,
	Tooltip = 'Only apply wallhack on enemy'
})

Toggles.ESP_TEAM_CHECK:OnChanged(function()
	EspEnv:Set('Other', 'TeamCheck', Toggles.ESP_TEAM_CHECK.Value)
end)


-- [[ ESP Increase max distance ]]
VisualGroupBox:AddSlider('ESP_MAX_DISTANCE', {
	Text = 'Max Distance',
	Default = 500,
	Min = 100,
	Max = 1000,
	Rounding = 0,
	Compact = false
})

Options.ESP_MAX_DISTANCE:OnChanged(function()
	EspEnv:Set('Other', 'MaximumDistance', Options.ESP_MAX_DISTANCE.Value)
end)


VisualGroupBox:AddDivider()


-- [[ ESP Boxes ]]
VisualGroupBox:AddToggle('ESP_BOXES', {
	Text = 'Boxes',
	Default = false,
	Tooltip = 'Displays a Box around characters.'
})

Toggles.ESP_BOXES:OnChanged(function()
	EspEnv:Set('Boxes', 'Enabled', Toggles.ESP_BOXES.Value)
end)


-- [[ ESP Skeletons ]]
VisualGroupBox:AddToggle('ESP_SKELETONS', {
	Text = 'Show Skeletons',
	Default = false,
	Tooltip = 'Displays a line for each body part, creating a skeleton.'
})

Toggles.ESP_SKELETONS:OnChanged(function()
	EspEnv:Set('HeadDots', 'Enabled', Toggles.ESP_SKELETONS.Value)
	EspEnv:Set('Skeletons', 'Enabled', Toggles.ESP_SKELETONS.Value)
end)


-- [[ ESP Look Tracers ]]
VisualGroupBox:AddToggle('ESP_LOOK_TRACERS', {
	Text = 'Look Tracers',
	Default = false,
	Tooltip = 'Displays a line that originates from the character\'s head and extends forwards by a certain distance, indicating the direction the head is facing.'
})

Toggles.ESP_LOOK_TRACERS:OnChanged(function()
	EspEnv:Set('LookTracers', 'Enabled', Toggles.ESP_LOOK_TRACERS.Value)
end)


-- [[ ESP Names ]]
VisualGroupBox:AddToggle('ESP_NAMES', {
	Text = 'Show Name',
	Default = false,
	Tooltip = 'Displays the player\'s data such as name, distance and health.'
})

Toggles.ESP_NAMES:OnChanged(function()
	EspEnv:Set('Names', 'Enabled', Toggles.ESP_NAMES.Value)
end)


-- [[ ESP Health Bars ]]
VisualGroupBox:AddToggle('ESP_HEALTH_BARS', {
	Text = 'Health Bars',
	Default = false,
	Tooltip = 'Displays a health bar below the character.'
})

Toggles.ESP_HEALTH_BARS:OnChanged(function()
	EspEnv:Set('HealthBars', 'Enabled', Toggles.ESP_HEALTH_BARS.Value)
end)


-- [[ ESP Rainbow toggle ]]
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


-- [[ Customize ESP Color ]]
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


VisualGroupBox:AddDivider()



-- [[ Toggle Fov ]]
VisualGroupBox:AddToggle('FOV_TOGGLE', {
	Text = 'Fov',
	Default = false,
	Tooltip = 'Only target players within the circle radius.'
})

Toggles.FOV_TOGGLE:OnChanged(function()
	AimbotEnv.FOVSettings.Enabled = Toggles.FOV_TOGGLE.Value
end)


-- [[ Increase FOV Scale ]]
VisualGroupBox:AddSlider('FOV_SCALE', {
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


-- [[ Increase FOV Thickness ]]
VisualGroupBox:AddSlider('FOV_THICKNESS', {
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

-- [[ Customize FOV Color ]]
VisualGroupBox:AddLabel('FOV Color'):AddColorPicker('FOV_COLOR', {
    Default = Color3.fromRGB(255,255,255),
    Title = 'FOV Color',
})

Options.FOV_COLOR:OnChanged(function()
	AimbotEnv.FOVSettings.Color = RGBToString(Options.FOV_COLOR.Value)
end)



local TracerGroupBox = Tabs.Visual:AddRightGroupbox('Tracers')

-- [[ TRACER Toggle ]]
TracerGroupBox:AddToggle('TRACER_TOGGLE', {
	Text = 'Toggle Tracers',
	Default = false,
	Tooltip = 'Displays a line that connects to the character.'
})

Toggles.TRACER_TOGGLE:OnChanged(function()
	EspEnv:Set('Tracers', 'Enabled', Toggles.TRACER_TOGGLE.Value)
end)


-- [[ Customize Tracer Posittion ]]
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


-- [[ Customize Tracer Color ]]
TracerGroupBox:AddLabel('Tracer Color'):AddColorPicker('TRACER_COLOR', {
    Default = Color3.fromRGB(255,255,255),
    Title = 'ESP Color',
})

Options.TRACER_COLOR:OnChanged(function()
	local TRACER_COLOR = Options.TRACER_COLOR.Value
    EspEnv:Set('Tracers', 'Color', TRACER_COLOR)
end)


-- [[ Toggle Rainbow Tracer ]]
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
SaveManager:SetFolder('Nowa-Hub/Games/' .. game.PlaceId)
SaveManager:BuildConfigSection(Tabs['Settings']) 
