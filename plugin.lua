-- Basic Framework Plugin
-- by QSC
-- October 2020

-- Information block for the plugin
--[[ #include "info.lua" ]]

-- Define the color of the plugin object in the design
function GetColor(props)
  return { 0,83,214 }
end

-- The name that will initially display when dragged into a design
function GetPrettyName(props)
  return "Open Source TTS " .. PluginInfo.BuildVersion
end

-- Optional function used if plugin has multiple pages
PageNames = { "Main", "Help" }  --List the pages within the plugin
function GetPages(props)
  local pages = {}
  --[[ #include "pages.lua" ]]
  return pages
end

-- Optional function to define model if plugin supports more than one model
function GetModel(props)
  local model = {}
  --[[ #include "model.lua" ]]
 return model
end

-- Define User configurable Properties of the plugin
function GetProperties()
  local props = {}
  --[[ #include "properties.lua" ]]
  return props
end

-- Optional function to define pins on the plugin that are not connected to a Control
function GetPins(props)
  local pins = {}
  --[[ #include "pins.lua" ]]
  return pins
end

-- Optional function to update available properties when properties are altered by the user
function RectifyProperties(props)
  --[[ #include "rectify_properties.lua" ]]
  return props
end

-- Optional function to define components used within the plugin
function GetComponents(props)
  local components = {}
  --[[ #include "components.lua" ]]
  return components
end

-- Optional function to define wiring of components used within the plugin
function GetWiring(props)
  local wiring = {}
  --[[ #include "wiring.lua" ]]
  return wiring
end

-- Defines the Controls used within the plugin
function GetControls(props)
  local ctrls = {}
  --[[ #include "controls.lua" ]]
  return ctrls
end

--Layout of controls and graphics for the plugin UI to display
function GetControlLayout(props)
  local layout = {}
  local graphics = {}
  local about_blurb = [[
This plugin was developed to be a free and open-source method to leverage Google's (paid) Deepmind-powered Text to Speech API. This plugin has been deployed under an MIT license, so you are free to reuse, distribute and profit from this code. You must generate a valid Google API key to use this plugin, and once you do you will be subject to Google's own pricing for API usage. The cost is very cheap, and currently at the time of development is the following:

Standard voices: $4.00 USD per 1 million characters
WaveNet voices: $16.00 USD per 1 million characters
Neural2 voices: $16.00 USD per 1 million characters
      
Audio files are only generated when you press the generate button. They are stored locally on the core in 1 of the 10 slots. When played back, the API is not used, and after converting your strings of text to audio, and saving them in the slots, the API key can happily be removed, and the core does not need access to the internet. I would advise deploying the plugin to shared environments in this manner so your API key cannot be abused by a third party. 

Contact me via GitHub, send a message or open an issue, if you have any problems or suggestions for improvements.
]]
  --[[ #include "layout.lua" ]]
  return layout, graphics
end

--Start event based logic
if Controls then
  --[[ #include "runtime.lua" ]]
end
