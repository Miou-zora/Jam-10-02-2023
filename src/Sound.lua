require "src/Button"

Sound = {}

Sound.Music = {}
Sound.Musics = {InGame = nil, MainMenu = nil}
Sound.LastMusic = nil

Sound.Sound = {}
Sound.Sounds = {Collide = nil}

function Sound.Music.GetVolume()
    return love.audio.getVolume()
end

function Sound.Music.SetVolume(value)
    love.audio.setVolume(value)
end

local function InitButtons()
    local WW = love.graphics.getWidth()
    local WH = love.graphics.getHeight()
    Button.AddButton(createSliderButton({x = WW / 2 - WW / 10, y = WH / 8 * 4}, {x = WW / 5, y = WH / 15}, "Music", Sound.Music.GetVolume, Sound.Music.SetVolume, GameActions.GameState.Option))
end

function Sound.Play(music)
    if Sound.LastMusic ~= nil then
        Sound.LastMusic:stop()
    end
    love.audio.play(music)
    Sound.LastMusic = music
end

function Sound.load()
    Sound.Musics = {
        InGame = love.audio.newSource("assets/sounds/InGame.mp3", "stream"),
        MainMenu = love.audio.newSource("assets/sounds/MainMenu.mp3", "stream")
    }
    Sound.Sounds = {
        Collide = love.audio.newSource("assets/sounds/Collide.mp3", "static")
    }
    Sound.Play(Sound.Musics.InGame)
    InitButtons()
end
