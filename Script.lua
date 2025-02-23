-- Rayfield Interface Customizado para LostHub
-- Baseado na Interface Rayfield por Sirius

if debugX then
	warn('Iniciando Rayfield Customizado para LostHub')
end

local function getService(name)
    local service = game:GetService(name)
    return if cloneref then cloneref(service) else service
end

local requestsDisabled = getgenv and getgenv().DISABLE_RAYFIELD_REQUESTS
local InterfaceBuild = '3K3W'
local Release = "Build 1.672"

local HttpService = getService('HttpService')
local RunService = getService('RunService')
local UserInputService = getService("UserInputService")
local TweenService = getService("TweenService")
local Players = getService("Players")
local CoreGui = getService("CoreGui")

-- Tema Personalizado (Fundo preto, detalhes em vermelho escuro)
local CustomTheme = {
    TextColor = Color3.fromRGB(255, 255, 255), -- Texto branco
    Background = Color3.fromRGB(0, 0, 0), -- Fundo preto
    Topbar = Color3.fromRGB(50, 0, 0), -- Barra superior vermelho escuro
    Shadow = Color3.fromRGB(20, 0, 0), -- Sombra escura avermelhada

    NotificationBackground = Color3.fromRGB(20, 0, 0),
    NotificationActionsBackground = Color3.fromRGB(200, 0, 0),

    TabBackground = Color3.fromRGB(40, 0, 0),
    TabStroke = Color3.fromRGB(80, 0, 0),
    TabBackgroundSelected = Color3.fromRGB(150, 0, 0),
    TabTextColor = Color3.fromRGB(255, 255, 255),

    ElementBackground = Color3.fromRGB(25, 0, 0),
    ElementBackgroundHover = Color3.fromRGB(40, 0, 0),
    ElementStroke = Color3.fromRGB(100, 0, 0),

    SliderBackground = Color3.fromRGB(80, 0, 0),
    SliderProgress = Color3.fromRGB(200, 0, 0),
    SliderStroke = Color3.fromRGB(255, 0, 0),

    ToggleBackground = Color3.fromRGB(30, 0, 0),
    ToggleEnabled = Color3.fromRGB(200, 0, 0),
    ToggleDisabled = Color3.fromRGB(100, 100, 100),

    InputBackground = Color3.fromRGB(30, 0, 0),
    InputStroke = Color3.fromRGB(90, 0, 0),
    PlaceholderColor = Color3.fromRGB(150, 150, 150),
}

-- Função principal para aplicar o tema personalizado
local function ApplyTheme(theme)
	Rayfield.Main.BackgroundColor3 = theme.Background
	Rayfield.Main.Topbar.BackgroundColor3 = theme.Topbar
	Rayfield.Main.Shadow.Image.ImageColor3 = theme.Shadow
end

local Rayfield = game:GetObjects("rbxassetid://10804731440")[1]
Rayfield.Enabled = false

if syn and syn.protect_gui then
	syn.protect_gui(Rayfield)
	Rayfield.Parent = CoreGui
else
	Rayfield.Parent = CoreGui
end

ApplyTheme(CustomTheme)

-- Personaliza o título
Rayfield.Main.Topbar.Title.Text = "LostHub"

-- Notificação de crédito
local function NotifyCredit()
	local Notification = Rayfield.Notifications.Template:Clone()
	Notification.Parent = Rayfield.Notifications
	Notification.Title.Text = "LostHub"
	Notification.Description.Text = "made by jofer223/Lost_JBL"
	Notification.Visible = true
	wait(10)
	Notification:Destroy()
end

NotifyCredit()

-- Atalho para abrir/fechar com a tecla 'Q'
local Keybind = Enum.KeyCode.Q
local isMenuOpen = false

local function ToggleMenu()
	isMenuOpen = not isMenuOpen
	Rayfield.Enabled = isMenuOpen
end

UserInputService.InputBegan:Connect(function(input)
	if input.KeyCode == Keybind then
		ToggleMenu()
	end
end)

-- Animação lenta na primeira abertura
local firstOpen = true
local function openWithAnimation()
    if firstOpen then
        wait(2) -- Animação lenta na primeira vez
        firstOpen = false
    end
    ToggleMenu()
end

openWithAnimation()

-- Carregar configurações e gerenciamento adicional
local function loadSettings()
    -- Adicionar lógica de carregamento de configurações aqui
end

loadSettings()
