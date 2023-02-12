require "src/Button"

Sound = {}

Sound.Music = {}

Sound.Musics = {}

Sound.LastMusic = nil

function Sound.Music.GetVolume()
    return Sound.LastMusic:getVolume()
end

function Sound.Music.SetVolume(value)
    Sound.LastMusic:setVolume(value)
end

local function InitButtons()
    local WW = love.graphics.getWidth()
    local WH = love.graphics.getHeight()
    -- Button.AddButton(createSliderButton({x = WW / 2 - WW / 10, y = WH / 8 * 3}, {x = 200, y = 200}, "Music", Sound.Music.GetVolume, Sound.Music.SetVolume, GameActions.GameState.Option))
end

function Sound.load()
    Sound.Musics = {
        InGame = love.audio.newSource("assets/sounds/InGame.mp3", "stream"),
        MainMenu = love.audio.newSource("assets/sounds/MainMenu.mp3", "stream")
    }

    InitButtons()
end

function Sound.Play(music)
    if Sound.LastMusic ~= nil then
        Sound.LastMusic:stop()
    end
    love.audio.play(music)
    Sound.LastMusic = music
end
