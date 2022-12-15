-- Basic Framework Plugin
-- by QSC
-- October 2020

-- Information block for the plugin
PluginInfo = {
  Name = "Google~Open Source Text to Speech",
  Version = "1.0",
  BuildVersion = "1.0.0.0",
  Id = "4466b82c-097b-4879-b092-c4f3c6198dca",
  Author = "Jason Krasavage",
  Description = "Open source text to speech plugin that uses the Google TTS API."  
}

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
  for ix,name in ipairs(PageNames) do
    table.insert(pages, {name = PageNames[ix]})
  end
  return pages
end

-- Optional function to define model if plugin supports more than one model
function GetModel(props)
  local model = {}
 return model
end

-- Define User configurable Properties of the plugin
function GetProperties()
  local props = {}
  return props
end

-- Optional function to define pins on the plugin that are not connected to a Control
function GetPins(props)
  local pins = {}
  table.insert(pins,{
    Name = "Audio Output",
    Direction = "output",
  })
  return pins
end

-- Optional function to update available properties when properties are altered by the user
function RectifyProperties(props)
  return props
end

-- Optional function to define components used within the plugin
function GetComponents(props)
  local components = {}
  
  table.insert(components,{
    Name = "audio_player",
  		Type = "audio_file_player",
  		Properties = {
  			["n_channels"] = 1
  		}
  })
  return components
end

-- Optional function to define wiring of components used within the plugin
function GetWiring(props)
  local wiring = {}
  table.insert( wiring, { "Audio Output", "audio_player Track 1" } )
  return wiring
end

-- Defines the Controls used within the plugin
function GetControls(props)
  local ctrls = {}
  table.insert(ctrls, {
    Name = "text",
    ControlType = "Text",
    Count = 1,
    PinStyle = "Input",
    UserPin = true,
  })
  table.insert(ctrls,{
    Name = "convert_tts",
    ControlType = "Button",
    ButtonType = "Trigger",
    PinStyle = "Input",
    UserPin = true,
    Count = 1,
  })
  table.insert(ctrls, {
    Name = "api_key",
    ControlType = "Text",
    Count = 1,
    PinStyle = "Input",
    UserPin = true,
  })
  table.insert(ctrls, {
    Name = "voice_type",
    ControlType = "Text",
    TextType = "Combo Box",
    Count = 1,
    PinStyle = "None",
    UserPin = true,
  })
  table.insert(ctrls, {
    Name = "language",
    ControlType = "Text",
    TextType = "Combo Box",
    Count = 1,
    PinStyle = "None",
    UserPin = true,
  })
  table.insert(ctrls, {
    Name = "voice_name",
    ControlType = "Text",
    TextType = "Combo Box",
    Count = 1,
    PinStyle = "None",
    UserPin = true,
  })
  table.insert(ctrls, {
    Name = "slot_selector",
    ControlType = "Text",
    TextType = "Combo Box",
    Count = 1,
    PinStyle = "None",
    UserPin = true,
  })
  table.insert(ctrls,{
    Name = "selected_name",
    ControlType = "Indicator",
    IndicatorType = "Text",
    PinStyle = "None",
    UserPin = true,
    Count = 1, 
  })
  table.insert(ctrls,{
    Name = "selected_language",
    ControlType = "Indicator",
    IndicatorType = "Text",
    PinStyle = "None",
    UserPin = true,
    Count = 1, 
  })
  table.insert(ctrls,{
    Name = "selected_language_code",
    ControlType = "Indicator",
    IndicatorType = "Text",
    PinStyle = "None",
    UserPin = true,
    Count = 1, 
  })
  table.insert(ctrls,{
    Name = "selected_gender",
    ControlType = "Indicator",
    IndicatorType = "Text",
    PinStyle = "None",
    UserPin = true,
    Count = 1, 
  })
  table.insert(ctrls,{
    Name = "slot_delete",
    ControlType = "Button",
    ButtonType = "Trigger",
    PinStyle = "None",
    UserPin = true,
    Count = 10,
  })
  table.insert(ctrls,{
    Name = "slot_trigger",
    ControlType = "Button",
    ButtonType = "Trigger",
    PinStyle = "Input",
    UserPin = true,
    Count = 10,
  })
  table.insert(ctrls, {
    Name = "slot_name",
    ControlType = "Text",
    Count = 10,
    PinStyle = "None",
    UserPin = true,
  })
  table.insert(ctrls,{
    Name = "slot_text",
    ControlType = "Indicator",
    IndicatorType = "Text",
    PinStyle = "None",
    UserPin = true,
    Count = 10, 
  })
  table.insert(ctrls,{
    Name = "QR",
    ControlType = "Button",
    ButtonType = "Trigger",
    PinStyle = "Input",
    UserPin = true,
    Count = 1,
  })
  table.insert(ctrls,{
    Name = "api_connected",
    ControlType = "Indicator",
    IndicatorType = "LED",
    PinStyle = "Output",
    UserPin = true,
    Count = 1,
  })
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
  local CurrentPage = PageNames[props["page_index"].Value]
  if CurrentPage == "Main" then
    table.insert(graphics,{
      Type = "GroupBox",
      Text = "",
      Fill = {240,245,245},
      StrokeWidth = 0,
      Position = {0,0},
      Size = {560,800}
    })
    table.insert(graphics,{
      Type = "GroupBox",
      Text = "",
      Fill = {0,83,214},
      StrokeWidth = 0,
      Position = {0,0},
      Size = {560,75}
    })
    table.insert(graphics,{
      Type = "GroupBox",
      Text = "",
      Fill = {0,83,214},
      StrokeWidth = 0,
      Position = {0,725},
      Size = {560,75}
    })
    table.insert(graphics,{
      Type = "Image",
      Image = "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",
      Position = { 198,752 },
      Size = { 164,48 },
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "powered by",
      Position = {198,733},
      Size = {164,19},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center",
      Color = {255,255,255}
  
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Developed by Jason Krasavage",
      Position = {367,781},
      Size = {189,19},
      Font = "Roboto",
      FontSize = 12,
      FontStyle = "Italic",
      HTextAlign = "Right",
      VTextAlign = "Center",
      Color = {230,230,230}
  
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Open Source Text to Speech",
      Position = {0,0},
      Size = {560,75},
      Font = "Roboto",
      FontSize = 36,
      FontStyle = "Medium Italic",
      HTextAlign = "Center",
      VTextAlign = "Center",
      Color = {255,255,255}
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Valid Google API Key:",
      Position = {10,82},
      Size = {163,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Left",
      VTextAlign = "Center"
    })
    layout["api_connected"] = {
      IndicatorType = "LED",
      Position = {156,82},
      Size = {31,31},
      Margin = 10
    }
    layout["api_key"] = {
      PrettyName = "Google API Key",
      Style = "TextField",
      Position = {187,82},
      Size = {352,31},
      Color = {255,255,255},
      StrokeWidth = 2,
      StrokeColor = {221,221,221},
      CornerRadius = 0,
      Font = "Roboto Mono",
      FontStyle = "Italic",
      FontSize = 12,
      FontColor = {0,0,0}
    }
    table.insert(graphics,{
      Type = "Text",
      Text = "Slot",
      Position = {10,117},
      Size = {64,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Voice Type",
      Position = {135,117},
      Size = {103,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Language",
      Position = {286,117},
      Size = {103,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Voice",
      Position = {436,117},
      Size = {103,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    layout["slot_selector"] = {
      PrettyName = "Slot Selector",
      Style = "ComboBox",
      Position = {10,148},
      Size = {64,24},
      Color = {255,255,255},
      StrokeWidth = 2,
      StrokeColor = {221,221,221},
      CornerRadius = 10,
      FontSize = 12
    }
    layout["voice_type"] = {
      PrettyName = "Voice Type Combo Box",
      Style = "ComboBox",
      Position = {135,148},
      Size = {103,25},
      Color = {255,255,255},
      StrokeWidth = 2,
      StrokeColor = {221,221,221},
      CornerRadius = 10,
      FontSize = 12
    }
    layout["language"] = {
      PrettyName = "Language Combo Box",
      Style = "ComboBox",
      Position = {286,148},
      Size = {103,25},
      Color = {255,255,255},
      StrokeWidth = 2,
      StrokeColor = {221,221,221},
      CornerRadius = 10,
      FontSize = 12
    }
    layout["voice_name"] = {
      PrettyName = "Voice Name Combo Box",
      Style = "ComboBox",
      Position = {436,148},
      Size = {103,25},
      Color = {255,255,255},
      StrokeWidth = 2,
      StrokeColor = {221,221,221},
      CornerRadius = 10,
      FontSize = 12
    }
    table.insert(graphics,{
      Type = "Text",
      Text = "Gender:",
      Position = {10,191},
      Size = {81,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Left",
      VTextAlign = "Center"
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Name:",
      Position = {10,230},
      Size = {81,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Left",
      VTextAlign = "Center"
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Language:",
      Position = {286,191},
      Size = {81,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Left",
      VTextAlign = "Center"
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Code:",
      Position = {286,230},
      Size = {81,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Left",
      VTextAlign = "Center"
    })
    layout["selected_gender"] = {
      PrettyName = "Selected Gender",
      Style = "TextField",
      Position = {91,191},
      Size = {170,31},
      Color = {221,221,221},
      StrokeWidth = 2,
      StrokeColor = {156,156,156},
      CornerRadius = 0,
      FontSize = 12,
      FontColor = {0,0,0}
    }
    layout["selected_name"] = {
      PrettyName = "Selected Name",
      Style = "TextField",
      Position = {91,230},
      Size = {170,31},
      Color = {221,221,221},
      StrokeWidth = 2,
      StrokeColor = {156,156,156},
      CornerRadius = 0,
      FontSize = 12,
      FontColor = {0,0,0}
    }
    layout["selected_language"] = {
      PrettyName = "Selected Language",
      Style = "TextField",
      Position = {367,191},
      Size = {170,31},
      Color = {221,221,221},
      StrokeWidth = 2,
      StrokeColor = {156,156,156},
      CornerRadius = 0,
      FontSize = 12,
      FontColor = {0,0,0}
    }
    layout["selected_language_code"] = {
      PrettyName = "Selected Language Code",
      Style = "TextField",
      Position = {367,230},
      Size = {170,31},
      Color = {221,221,221},
      StrokeWidth = 2,
      StrokeColor = {156,156,156},
      CornerRadius = 0,
      FontSize = 12,
      FontColor = {0,0,0}
    }
    layout["text"] = {
      PrettyName = "Conversion Text",
      Style = "TextField",
      Position = {10,274},
      Size = {411,62},
      Color = {255,255,255},
      StrokeWidth = 2,
      StrokeColor = {221,221,221},
      CornerRadius = 0,
      Font = "Roboto",
      FontStyle = "Regular",
      FontSize = 12,
      FontColor = {0,0,0}
    }
    layout["convert_tts"] = {
      PrettyName = "Generate Audio",
      ButtonStyle = "Trigger",
      Position = {434,274},
      Size = {103,62},
      ButtonVisualStyle = "Gloss",
      UnlinkOffColor = true,
      Color = {255,255,255},
      OffColor = {255,230,240},
      StrokeWidth = 2,
      StrokeColor = {0,0,0},
      CornerRadius = 0,
      Legend = "Generate\rAudio",
      Font = "Roboto",
      FontStyle = "Medium Italic",
      FontSize = 14,
      FontColor = {0,0,0}
    }
    table.insert(graphics,{
      Type = "Text",
      Text = "Slot",
      Position = {10,357},
      Size = {44,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Name",
      Position = {54,357},
      Size = {128,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Text",
      Position = {182,357},
      Size = {251,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Delete",
      Position = {433,357},
      Size = {52,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Play",
      Position = {485,357},
      Size = {52,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    for i=1, 10 do
      table.insert(graphics,{
        Type = "Text",
        Text = tostring(i),
        Position = {10,388+(32*(i-1))},
        Size = {44,31},
        Font = "Roboto",
        FontSize = 14,
        FontStyle = "Medium",
        HTextAlign = "Center",
        VTextAlign = "Center"
      })
      layout["slot_name "..i] = {
        PrettyName = "Slot Friendly Name "..i,
        Style = "TextField",
        Position = {54,388+(32*(i-1))},
        Size = {128,31},
        Color = {255,255,255},
        StrokeWidth = 2,
        StrokeColor = {221,221,221},
        CornerRadius = 0,
        Font = "Roboto",
        FontStyle = "Regular",
        FontSize = 12,
        FontColor = {0,0,0},
        Margin = 3
      }
      layout["slot_text "..i] = {
        PrettyName = "Slot Converted Text "..i,
        Style = "TextField",
        Position = {182,388+(32*(i-1))},
        Size = {251,31},
        Color = {221,221,221},
        StrokeWidth = 2,
        StrokeColor = {156,156,156},
        CornerRadius = 0,
        FontSize = 12,
        FontColor = {0,0,0},
        Margin = 3
      }
      layout["slot_delete "..i] = {
        PrettyName = "Slot Delete Button "..i,
        ButtonStyle = "Trigger",
        Position = {433,388+(32*(i-1))},
        Size = {52,31},
        ButtonVisualStyle = "Gloss",
        UnlinkOffColor = true,
        Color = {255,255,255},
        OffColor = {221,221,221},
        StrokeWidth = 2,
        StrokeColor = {0,0,0},
        CornerRadius = 0,
        Font = "Roboto",
        FontStyle = "Medium Italic",
        FontSize = 14,
        FontColor = {0,0,0},
        Margin = 3
      }
      layout["slot_trigger "..i] = {
        PrettyName = "Slot Play Button "..i,
        ButtonStyle = "Trigger",
        Position = {485,388+(32*(i-1))},
        Size = {52,31},
        ButtonVisualStyle = "Gloss",
        UnlinkOffColor = true,
        Color = {255,255,255},
        OffColor = {212,255,237},
        StrokeWidth = 2,
        StrokeColor = {0,0,0},
        CornerRadius = 0,
        Font = "Roboto",
        FontStyle = "Medium Italic",
        FontSize = 14,
        FontColor = {0,0,0},
        Margin = 3
      }
    end
  
  
  
  elseif CurrentPage == "Help" then
    table.insert(graphics,{
      Type = "GroupBox",
      Text = "",
      Fill = {240,245,245},
      StrokeWidth = 0,
      Position = {0,0},
      Size = {560,800}
    })
    table.insert(graphics,{
      Type = "GroupBox",
      Text = "",
      Fill = {0,83,214},
      StrokeWidth = 0,
      Position = {0,0},
      Size = {560,75}
    })
    table.insert(graphics,{
      Type = "GroupBox",
      Text = "",
      Fill = {0,83,214},
      StrokeWidth = 0,
      Position = {0,725},
      Size = {560,75}
    })
    table.insert(graphics,{
      Type = "Image",
      Image = "iVBORw0KGgoAAAANSUhEUgAAAPoAAABLCAYAAABZeprtAAAACXBIWXMAAC4jAAAuIwF4pT92AAAoIElEQVR4nO2dd5gUVfb3P1XVcWZ6cmKGAWaGIQliAEVxFcHVVTFidl0VUVd/rq4Kuqtidg3oChhRMbsGWMWMedU1ISpgAMkDTM6pc1e9f9zq6TDdPREWX+r7PE2ocOvWrXvuyedKzFirYcCAgf+vIf+vO2DAgIGdD4PQDRjYA2AQugEDewAMQjdgYA+AQegGDOwBMAjdgIE9AAahGzCwB8AgdAMG9gCYdvkTJUAFnCq0+cW/AcLDdiRNXCgBVhmSFbBIYlkywnsMGOg1dhGha4JIXSrU+0GBpCIrEyakUlZgpSzfQpZDQZYl/AGNlo4AFU1+NlZ7+XWbh42VXqjyCiJPVwThSxJoQaqXds1rGDDwG8XOJ3QZ8AA1HqQcMydOz+S0Q1I5fHwSeenmbm9XVY31VV4+/9nJ8pXtvL+qnfZtHsHpc8w6we/0tzBg4DcNacBj3TUEp1UkkCWoEZz47OkZzD09h5FDrP1qvqbRz5L/trL4gyZWrWwDswJ55tCzDRgw0AUDQOj67bIEbhW8KpZME16fBuUecobbePKvhUw/wNH/3kbhyfebue/VOn75rgOyTJBmgsCAP8aAgd88BsbqrgANfnCrnP6HDAZnmGCdk4Mmp/LjorIwIh9YljvzyHR+frSMW68qFAe2eYS6bqjsBgxEoP+Ersiww0tquomP7ysmK0Vh8wfNHHVCFl/eX0KeQwm7eOdQ4Nwzc/jh0eFMnJgCW9zg0wzHoQEDYegjOWggqeLurW7KRidRt2QkjT54+OZtjDg0leW3DxvIfnaLfYbZWLGwlHPPyoEdHnAGQDaUdgMGoM+ErsvHW1zsvX8Ka58ow+XROGXmeii18cG9JQPaye6hEVQLnr6qkJuuKhTuuA59MTKsdAb2cPSN0BVgq4exB6Ty5cISFGDKrdugysOCuUUMSd+1cThalGJ+81k53HRtEdR6wR0QLjgDBvZg9IrQJUkDRYNtbkr3TubLf5aQbJJY/kM7q16qo/TUHC4/ImNn9TV+v2Icu/m0bOZcXggVXlA1w0BnYI9GrwhdkyWo82PJNvPRvGE4rIJ6bl7WCF6Vu/+Uu1M62Vfcc04ux5ycDeUeg6sb2KPRc0KXECGsrgBLbh3K0EwRpLKp2ss37zeSPi2dGTvBV95fvHFdEbmj7VDlESqHgd0YIVvL/ww+Tfw6u7Gb2nfcKnQEhNHZpXZ7ec+VaQmo8HD+hfkcv29K5+G3vmuHLW7Ou2RQX7q706FI8OqNQzjk/PViUKx9pHYZMQHa/cTXA/RJIelRgWZJJOMY0kTPIEviG3nVEH1JQIpJzFQ1eKAvbSPsNa5gw3riVIoMFhn8KtT59DwKoDEA2WbxDbuno10IsRiakiXMsowGBFTwBfT3iYOeEboE1PtIHWHn4QvyI069v7oDHCaOGpfc567vbEwuszPznFyefLwaSux9+3B+DbMFcovt+oH4K72qgdOj0dLmhwYfeDQxmTJNYDJi8+PCp5GaYcKRJIMmJq0GVFZ6QO5HYISE4ICyRGGxJUQPGtS2BvB5NWj0c9oJ2cw+IRNJgmf/08IDL9WDQxYL0O4CjwYWiffnDmHEICsasK3ey+S/bwOfKnJAYqBnhK4BrQHum1uEzRz50l+sd0OJjQPK7LHv3U1w/5/yeO69Znwtfkg19Z7YmvyM3T+FlfOKu71UVTVaXRqVjT4214iEnI9XOfl+TYfgWIMsuyGn+B9DA2q8XH1WITeckh06rMGUG8v570fNUGTtw5hpYtGo8bPw5iL+7w+RxuKJ12zm+3eb+N3xWbx8dWHn8QmldupaArz0aj3k9y8/Y0ChCs49fpiNzBQhnWak6PnbCcam+2VSAuq8FE1IYdbh6RGnqhr9tFR5yCqydj50YDDwLC/VLjPnjGyRJtsXaBKKLCPrUnmin0mRyEyRGTvEyvETHcw7L4/v5hfz6fxiTjw2Q7j9mnyGzSAaGtgsUsRYKjLce26uGCtvH1ZGCajzUDDezl+Ozuj6vWQJ2lWmH9TVvnTWYaliKqq7kQim89m61lBSR+e/Ewge3RO6poFH4/oZ2eEHAaht9UOLn7Lc7tNNe4edIyrNPjYLS7EN2vo2YQL9/OCH7p3Ma3OH8PwdwzBZFKj2CSOCAQEJPL6uY3xgmZ0j/pAhgqB6K8GrgEfj3nPzYp9WNUiS+GS1s8u5D9c4EVGgv/1v1L3o3uYndYSNWdPSwg6KF/f6xSKQ0Q9uXl7r4/NfnOyo81HnVLGZJXJTZEoGWZgw3M6gjIELvslIljn7iHSeerIGHNZ+Cw5vrmzn7w9WImeYOtcmVQObIpHuUBhfYOGgUUlMn+SIUHnOnpLG8CFWDr1sE946n8irD+xGXGM3xPxz8xj7YTO4hY7aI0hAtZeyA1M5c3KqfjDaaCVBrpXln7Rw7VArVx+fiVmRePrjZha+Ug9Z5v8vYjC6oSIJmgKcepIDJa5BQkPTej9JP/2xg3n/ruedVR1otT6RXqrohipVhSQJc7aFQ8rszDg4lbOnppOe1P9MlVlTUnnq5Rrwa/3mpjsaffz8ZZvQ4YJx9ZIkqN2v8ZFfhOAWlNq54qQsrgmTig4ssfH+P4uZcvFGobfbZMNIlwB7FVk57tgs3ny5DkpsnbpqQqiAV+POs3LCDkbfo+sHDpl7FlXzwLtNKDK0l7tF2rNd0Rfh3za1J6acgAp2mdMmpcU8nWSVwS5T30tR+NJHqphy6UbefrcJzadCgQWGWMXfhfq/M8z4OlQ++bSVy27fxohZ67njX7X4evWkcAgqOnhUEoUjk6Glj7p6GJKtsih6kW0Srphss8iLzzELg9sQGxRaqKz0cu2t2/jDzeUR9x82KolLz82Dai89pnINMYEH0uUc3uZAYoD7Ov9PuZChiHqD3UECarwMn+RgxoHdxHeomjCO5ptxNftpb/BDrgXsUu+IfKDGMdhO8DcAY5eY0J0qjqFWDhkd26JemGmCbAtrK709fuBJd27nkYerIN0MQ21g14WK8JfRJOFOSZKhwAxFVupqfdxwQzmlf/yV5avbe/y8EEIf68hxySLYYGdD0ydJlhmG23lvSQOnLaiMuOSuM3OwF1uhPXryBgt6ICZikx8qPMKQ1+CDep8IAqr2givQg7kYNsAyQqJp8IW16RVtVnpEVSCPqkspUbNM0sSv2S/8znU+UeRTIdSHtoBot8YLjXpfq/X/uwM9rhngj7KJlOSZOeXYLPHOCV1eugXap3LX2ZHRmj5/NNXo76MBzQE9CEUV/VYRUp+qj1Xwfd2qeF9Zf06DPm51+vvWesX7t/rD3jUBtQavafeLdoLG2mafaK9K/zaq1mdXX2LRvSPAgWUOwbljID1ZYdgQK1vXdLCjwcfgrMRGub88XcOy5+pgVJIYqM65Ha/zegFIn0buUCuHHpvJ0mdqOfr0dVxz/RDuPqdvIbe/G2Pnqc6stp0pkulta4gPNNzOkudr+XhqGlP1uAOHXeasaRksXlwDKUpoPsiId6/0ggIj9krm8PHJjCiwkJVqQlU1NlR6WbXJzbur26HcLSSJFCV+lR1ZqBRUeiFZZr/9Upg0KomRhRYyk2U8flhX4eGHjW4+WtUh2syzCrUiSHSq6Nde4+ykJyvIEpTX+dhWo8cLNPrJHGHjqKPTGT/MRmGmCZ9fY2O1l283uPlgVTts0/uanKCvCA3uiY+b+eOhadh0vfzuM3NY+k6DWNziBT8FufmBkdz8wzUdbK3xMev36ZHXBzTQNMbtnYzDLqFp4PXDqq1uAm4Nk01i3wOSMSkSsiyxvtJLXZNfEKIqsc9+yUzZO4XRRRaSLBI1zQF+LHfz7ncd1K5zCSkvRY79rgpioWz0k1Ji4+jfpzNpRBLDB5mxmmQa2/2s2uLh41UdrPyuTSwyQ6xIvWTziQndq7HfMFvCS6btlcTi1xv4fK2TMw+JLeIDfLvRxYOLq4V+pdA7cUSBlq0ejjg7l6uXjuLQyzZxz5wtrNvu4fXrinrRkMD4oTbIMIlIN/Mu0r00wCqi5O55vbGT0AFOnpjC4hdqxUSQ9Z9HgyovEyenctMZORybQPzcWO1l0btN3PtiLdRoQp2INu4pkuAYDX6OPCKTuWdkc8jYpLht/ljuYf6rDTy5rEGEWGbqbfrFwvvKVYMZUyT8y+98386xf1oP2WZuuaKAy4/PJD05NhFuqPSyaHkT9z1fIzh/vjWuIdJiknjovSYaXCrXHpcJCK5+6jGZLHm+FkqSYru+NAm8Ae6J4uZ/e6WO35XGkE59GgQ0ll1bSEmeRRzya+TMXE/LDg+Zo5NYcXco9Xr2s9Xcd8N2CqaksfDifGZ0Gvoi0eZSuf/1Bm56tEqMW5o5sr+KJDh4kszNfy3kkmMyyU3tOm5nHgKcA2983crM+ytp2OZB7qUnIL7orgEmiZGFloQNHLNvCkjw9BdtCa+b+3KdsJgm9cHopMh4TBKXLKhg0nA7618YSfEfMnhj3g6mzt3ay8agrMBCUpZFENOuhApkmvjPzx00h6kOk0fZSRpiA6dfiJEeFaq8XHVRPivuL0lI5ADD8y3MOz+PzxeU4shUBMcOX8JlBFG1qMy7poj3bh+SkMgBxg21svjKApbeNUwcaAj6/YWoG06bZkWGPBPvLSjmxjNz4hI5iLG/d2YeH84vJT3bLMTwBEZRWYJbXqiNOHbnGTli4XEG6KpaADVeRh2cyklh47a11sd3bzVSmh9f6gx3nwZUdCOz1uURtS0q6eOSWP1waVwiByGt3XhGDi//Yyh4NaG2BA0WigRVXnILLXz7UCk3nZETk8jDcfykVNY8UcaYfVLYWN07a1V8Qg9okCIzJCcx0z96vxTMBzh4/51GGlpjy2GVjT7e+7Ydcs19iGzSLfGpJrQKL7ctqWdYlpkVjwxn9GnZfPJQFSfcs6NXLTpsMkOzFTH4uxp2GU+9j9Xlns5DaUkKIweZ9ImLiBC7tID7ZkWGGze0BVjyWQsLljWw8O1GvlkX6fs9ZHQSXzxQgskhC90uSD9eoeM/cH0Rs0/OirhnW52XZz9qZsFrDTyyvIlVm90R52cc5ODte4vFfGgP2QLC/d356QrvLCzlyPGhHIittV7eXtHG0i9b+WGDq8swTNs7mS8eLEVJlqDJq2/a0RWleRZcX7by5nchRlKab+GPJ2SG6eph9/o1UDXmR/nNr3u5Dmr9ZHRZhEIGA3fYO7m9ulonCSHZE6bbHzIqiSX/LCFbdytXNPh54+s2nvmkha9/7ujyDqcdnMasM3OETSX4uCYf5jSZrx4qZcLwSCkjoMFnqztY9H4Tiz9s5rv1ofErcCh8cNcwhub2zu0c/+oAYJXJcSRu0G6RuPT4LBZcsYnb3mxg/tld9eaPfnRCrU9Y1fsKTfTnwx87mHtqNtl2ma8fGM44p8Yb91Vww3Abt5+c3W0zQWQ7TGJS7GpIEng0Nld7OWxMiKvmp5vEIljhYd9DUrn3vMhxvOH5Wh56rZ7mKi94EUt0isxB45JZ/PciRueLsR1XaOWxvw1m5jVbwYHOOTyceEo2lx0dCv/UgEserGTx8ib89b6QuzFV4ZgDHTz9tyJy9Il8zPhk5lyUz7z7KmBwV444bqiVcQgxflO9n78/UsnSFW1obQEhRttg9GAbs8/MYeYR6Z33jRlkYdE1Rcy6ZotIXIkBs0kCk8TfXqjjuP1DHHre2bk8/1ajkFSSdX4lS1DhZdwhqRy1T2jR2VDp5cU3GqHAMiDhChfpOr6mwZ8frOTp95vxtui7Dplh/Mgknru+iHFFodDZu8/K4dnljXg7hCeLFj+PzSumJMqu9eh7Tcx7oY7N2z2hoinJMhNGJXHHRfkcOS6ZgjSFgrTexa4kEN2F/uqwd++7vuHELNgnhQWPVlPR2NVtta7CE/a/foy0VWZ7vb9TzUm1SHx8fwmMSuKOudv4MgbniIdUmyzks10NCVChqSPy2VkO3WZgkll4YWQm4BnzK7njH9tpblVhkBWKbcJ15zDz1X/bmHjpRrbWhkS58w9NY8zBqVDvFepAlokHL4hcOKbMLWfRw9X4/cBgKxTbocgGNoV3Xm9kwl830+IMSWj/OD2b1JF2aAkQz4D53RY3485dz5JXG9ACQIZZiNg2hbW/urhgzhauei5SDL9gShpjJqcJq3KMZlVNg3wLv3zRytKvQ1w9P93EBSdlC0t+0LDqU0HSuC/KSDvnxVphxU6Sw3b36T8Ov3kbjz1ShderChdrrhnSzKz+upXJ126hsT00fpkpCtMmOoQlvt7HqINSOe/QSJvWlc/WcMmcrWwu9wgffoFVuGmTZFauaOOoizey5JvEKnI8JKZiSRIrajfITlW48S+DYJ2T0+ZXdDnf6lLDPmI/jF+KhNev4g9blkuzTTz5j6HQ4ueMe7s+Ox5MvTUIDhiEjqZGrTEWkwSNPvae5OCQkSFR7vnPWnj5qRoos4ntqMJ3pjELS37HJg+zHq2KaO/CaemdVvATpqZRmBniHPcsa+CzZQ0w2g4O3S8WbNMqw6hktn3TxtwX6zvvMckSZ09Nh5ZYm+UJsffIm8tx1XthRBIkKUJCUACzLKS5Aiv331/BWysj3aNzTsjUU1NjfRA9KN0iMfuZmogzd5+ZgzLECq0BcU2Vh0nT0vn93iFD5+qtHl5/uwkGmeky6P3Aoveb+XRZvRjDVEW4g2UhfTAiibafnTzwTmPEPZPL7OKbeDSunJ4Zce71b9uYP79SJO7kmUU7kv4zyzDMBmaJ024rpzIGM+0OiQld08SK3wPccnI2Zafl8OXjNdzxZkPEOatFGhii8qsk22TMUcab8yenMmlmHttfbeDRD5t71JQ3PmPaudDHQYkaeY9fBafGiRMi030vX1yj+839oixWZdRvu5CWPnq9gU3VoXiGKWPsIi3Wr3FKWEGQDo/KtYuqhFhY7Y3dZoUHvCoPvFKHK8yOcdTedrBJMS3dD77bSOOaDiFpxJKPVU2I2HaJK6O4+vT9UpALLcJYG3PMNMizUP5tO0981Nx5OMuhcNnJ2cK3HVDBLPHPP0Zy8yufrxW2BZvMQH7w+99uFIukHEqpjehvisLHP0XaUIYGc0JyzEyLMob+7V91+oaicgw7liRU6TwzVHi567X66Au6RXwFXJLAp9HqCgBmeuJzfmNuEaN/aOOG2VsYnm/l9IlCTxqeZwndrnXfTuz+AG6V0jxLzByDxRcNYq9/N3DDC7X8OUwPjIcOPT/5fwJZEjnXYWhoC4BdZt9hIW4eUGHGJAdNo+1YE6hQAVXD7dLwhC3KRdlmlFSFgFNlbNg2WB1ulZOnpmM6Ih1TAmnN7xPBGR1uFbtF6IMluRYhUvq6csZXvmgRXDwu9AUi28LGtR2sLncLNydCIhw51Mban+OpXjpnS1G4/sU6Zk1L7zxz08lZPLysAd+vTg46OYuDwqShH7a4+eRDoZsL4hkYEa6i0c+v2zwi6CtWkxpgk6luiuSSKXqkXW6+mWG5IXvVukov6351itiCREKHKkGamXd+6GBhL/scn9D13U/rWoOd7Z4oRuVbeGlhKWec/StnXLIR86PDOXlCCsdNcHBJhklU97D1o8K0H6aOjV3gYsxgC5NPz+aLJ2p4bUUbJ3VT1qquNSBEol0NDTBLFEdl/G2u9UOmiYKwJB5Fhsf7WLnHapaQgUCyTG5aqM3cNBP/njO4T22m2BURC+COnA0dbpVNNXp1loS0JAl1o97Hmq0hQgcYlmVmbYwFpBMakGOmdlU7j3/UwoV6klVGisIFx2by6LdtzDsrkpvP/lctODXIDdpjBmZh317vE6pGXLegOO6Peh1NBTwqg9OVCIlu7Q6P6GdmD/pnl6lq8lHfFiDb0XODXPyZrgAdakzjWiKcPsHBosfKoCPAjJnrWfRBE4WZJs45NhMq3X0rMC0BLQGkwRbOOSy+3/Jvx2aAAk9+0pKwuTaXSnmDV0zaXQ23ijnHzL7FoUne3BFgU6UHUmSsAxTAk2KTxUQzSST3NNurG2QGo7uiNLEOj4rLp/Usv14CAtDmilwR7BZ6lvftMHHdczV66SSBWYencfzlhUweFRKHv97g4uP3moUxa4DzyUOtJQ7DlaM2ENH0P8xRelu7KxjU3gPIwvXX0pN4/zAk4OhCdF9b0fM49iAuOiwN6ZHhXHTlJv580QYq/jGMG2dk89nXrZQ3ChG159CE2Fbt5cqrC8lLUDP+yPEpSPsk89aKNlxeFbsl9nM2VHlxNgR2XVRcEDLQ4ON3kxwRhTq+3+wmUOGFNCViAje0B7jyqRr8Xg2TBaELdtdlDSQZXF4NzaUi2SVcPo2gfXd9pZcbXqjFYpZFdaYeDoEsQ30wTiJqgUxNUnDYFFz+HgRxaIAikZYc+W2c3h7EcWtAtpn61R0seKeR2ceJmID9S2y8Pqcw4tIrnqoRhi9rMHw3yt/eD8gR8eux+hw8Hn1OAkWi3RMZb5KTqvQ85z0gksl6w82huxBYi8S3m9wJL4mHC6ekUfjMSM68sZzbLtvEWzPzySu2Ut7YNcE/IRQJtrjJ3z+Fu8/OSXipxSRx6L7JfLq0gdVbPUwaETsZZ025WyRlDNqFJYIkTRibNPj7SZFBK69+q8cwWyRhUS0Vx+1miefeaRQx5xnB8lcxJoSEmMzh88csQaYZzaVR1eQXfnqEOrBkST34gKQERlIJYVQLZxw2ve6dJiGF9cNmlijJNVO71gnpJKYnrwqpCvtEhVZvqfOLunrdQoMsE7e+WMf/HZmJPYZU9sHqDlZ80hKmmw8ckfcbVonyBh9un9ZZo2CfYpvQ992a+CbxIAFtAUbsnURaL1O2E1+drLByoxunp29uiWP2TubXZ0dw8tWD+WF5EyveaRLcvCerV/CSzW6S8sx8cOtQTD3IH59UaofWAD9t98S95rO1TqGz7SqGrourbHJx2jm5HBHm/vH6NZ75oEX4YJ0qP2wJ9TvJKnPqEekiJ7pQT+MtsIiMvgJzKK13kFlYgDNNod8gi7CQN/r4aVuozdJ8C/sclgpW9DbNXX+FFmHhTQ1rM8uEnGfujODUogjnjENS9bLDCQZVlqDWx5jRdvYKCyapafazYZu7Z5KeBmSYaFvn4p4o704Qs5+vFd3ogWt4l8Ou0L7Dw6qtIQaan25i2r7JIsMv0RzXgA4/5xyWFv+aOOiG0GVay938d20vuXAY8lNN/Pu6It54oowpU9NFKt9Wl8gH9+u6iRSedKsHPtT6YIuL/SamsOKxMsYO7llU3bBs4YPcVhdfjFy+xhk3Eqs3kDr/CE+6DvtJmvAy1Hths5PpZ+Tw8uUFEW3MeaGO9o0uQah2mVdXRgZEXDcjG5JMQgLprIQalLn13xYvF52czdcPlPL1A6X8+HgZxx/ogBofaPDKisg2bzsjV0TCuQKE5HdJtCvJ4Aeqfdx1aUGozUVl7FVsE+msMUTWS/+QwZADUmCLK2y/u+APkTnX6gdVY0FUeOqyb9tRK7w9NNTqfc0yc/fSuoiwVYDlq9pZ80Ur5JsHNDhmwGAGmgO88lXkN1k4U8+1r47ef0AfQxnY5KL4oFQuiypw2RMkHllFApfK0m/6kv8dieMOdPDJPcV8NL+EC8/JYVChRXCACp/wBVd6YYdb7ITqVhk90s691w/hu4eHs9egnofOpqXIoAiDWyx8sc5J1a8uUQm2n+Jcm0vV84f9YmEK/qq9Ioe43ANVXoYVWZl301DenDsk4v7/bnCx8Mlq0DOmyDSx5us2vlgfWlj3GWbj9tmFUOcXY6THcqMhCPWXdvaalMKiPw/iwDI7B5bZGVtkZfV6l9BPM8y89Z8WqsMKbUzfP4WL/zxIbDFdp1f3UfV2WwOw1snRR2dw7YlZoTaHWNm8wSWkixgwKxIf3jqU7FIrrO0QEXR+TfzcAdjqhnovt11XxBHjIz0n/3yrUfS1pwxYA9JNuDZ5uHVJpE959jM6N48OVNhdoGmQYebJdxsjAr/GDLbxyl3FSGZgg84IvaqwMzQEYJ2TorF2Pr6tZ5JtNBKzNQ3IUHjp8xYevCBPRG/1E1P3TWHqvim4vRqrN7tZs91DVYOfFk+AZLNEQZaZicU29o+jX3eHYA/jGVqf+KRFpGtmm7oGOvQSxblmDpiWAekmpLDoSqsikeGQ2bvQwn4ldo47KBVT1Lz7odzD76/aIhbTJDlU5UTVuPjhKn6aX9p57fUnZDIkXeGmJ2vYst2j+7ElcCicdU4eD/810hB12VM1lK/qgGJdPC73MvPBSt65PrTQPDorn5JMM/98qZaaWr/QxyWwp5k4//ICHrw00q137J3b6aj0CtE+TjJQWZ6FNU+UcdtTtfz7q1ZqG/2ABjaFKYelcfWZOUzfL9Lt+ciHzaz/qlWE4Vb30vCbb+HOf9fxweoOFBmcHpWf17uE2hLPnrE7IE2hZZObS5+s4bELQ4lLp050MPqZUdzzfC3vr2mnpjkACpSVWjnhj9lc/8dc0uPUhugO3cuvDhNtG1w8/1krM6f2XjeIB5tF4sBRdg4cNbD14JvaVd0y2fUjt7oC/OvjZsiy9JvIQWTuHb1oeK/ve+nzVs69ezveVlVMymC5IhUYZOXnr9q4+JEqFoX50M85LI0zD0vjm5+crK/1kmyS2G+4neFRiULLVrbz0JM1QnRVdSt9oZV332hg3thk5pwQMgRec3IWlxyTwbdrnWxp9JObpDBxpJ38zMhp8eDyJt5Z1iBir2OEkf603UNdW4DDxyQxyGHi4csLuHtWPpsqPfgCkJ1uojivazLMZ7+6uHTeDmED6G3wkobQ6d0qK1e0hYp7BAt17oZSewQGWXj86Vomj7Bx7mHpnYfHFlp49trBtDkD7Kj3I5skRg4yR9i1Fn3UwrAsJZS407moxX/p7gldAuwyty2tH1BC31mobPKDX4uI7Q5i3ptNeLd4RAJHb/U3rf/S4H/WdLBgWQPL3m8S+mgnkUdhkJXHnqzB51F5/PLCzueagMljk5hM7FzyZz5u5rw7d4i2k3SftwaYZMi2cM28HbS3BbglLEzUYZOZGrbFVjTuf62Bq+ZXiHJYZgli2DglYPqN5Tw7Z3BnRRdHksw+w+Mv4ku/bOXU27cL0TTPIkR8jS5xBOZgwdBYUBGW+qyoDxPvek1kW4ZDkUPXJ4fZCBx2udODJklgDZNmk3vCVWN4C+3BUHA9cg6Hwnk3bKPur35mR5RTB0eSwughXdWk5/7TzJ+v2MyLYQwmM+hqSzCluyF0rdN3uXVFK09/1sp5h8YPWNkd8PMOD1iFuyccHR6Ve1+pE9lUfVnuJWGo70nshaaJgIaqJj+ba3z892cnH6/uYOXqdlGTLN8qShbHInINca7QwlP/quOLtW7+dloWp05OJSWOser7DS7mvdrAS2/UQ7JJZI0FwoL5VRF7jSRx64JK3lvVzt9PzWb6xPjVfT//2ckdL9Xx3vImEZrpiFMKCSjMNOPsCHDKXzZx/WUFXHx0BkU5sQs8/LjFzX2vNfDMq/VisodXw5FEMEj4GHt1lWJAIImtssLbDw+Ya3epnedanWono9Q0kbQTVF3b3T0rThk0ewTh9IS9S0CDNGGXmHPPDt5c2c7sk7I4ZkJKzG+yZoubha83snhpHVgkyuu8tLtVAgGNjTW64TnB+iMxY233U1cCGnyk55upeXbkgOjqOwsZM3+lebuXqiWjO33HADMXVfHU41V6+aE+NKyC2SyR24M8YA0RFtrSFhDW8mAt8gyT+Lsnzw8OcZ0PAhrZw21MHZPMsEFmshwKLq9KXUuAL9Y5WfWTE1pV4aJL1H5QuqvxgkliyEg7h422MzTPgsMu0+5WqWn289kvTtatdeuLklkvkKi34RNGtm8XDmdCqfCF17UEGH75Jlq3usGjYh1i5fBxSYwbaicrVcHj06hu8vPNBhffr3VCsMqqNaqvAY3UFCUiNbqxPYDLlSjctBcIaGSkmiLUutrWAD6PaD83TelMmFI1qG72o/k1ZJNEfoYpVMfDr1HX0s3uKKqGySyTFzZfXF6NxlZ/JKuXEQtorfgmRSNsTCi1MSRHqGTtHpUfNrn5fm2HSGzKE0xCkUTNRlXV8Po1OrqpltQzQg92aLObP12QxzO76c6pq7e62efEXxg9LZ1f7gvV+Ppqo4uDz98A6SY9qqsPk0ZG3021h6WGZYSoa5b7FvYb3paqiQystoD4d3Bn0QAikSRVX0B6KqjImnChtan67rAIl05Al+CSFXCYRP+j24xD6CX/t5H2ep9wEzpV4Urzqvqmkjp7s8uiXWuccmLB3VTDJ22SHBbd1k/Ikli8wo2JKbL4RsExDkotEuJdFF3yaguE+qzo56CbgCPEfUGYJSFZxXqXYIBSm194o4J9lCVRdtohi2KYmqTvDKuJkmOSfk2SnFBN77kzWQMKLDz7bA2nHpTK9H12v91TF3/aChVezj44pF74NY2TbtkGaCG9tS8Ilv7tZWWPfkND+OMdStTk0sIMNL0gchDvIiPeJU2JtFdIQR95L9sM769dCQW/BNuQoq6J2S9NiPPR9UgHKlY9uNhEmw6C7cfacUjVxe3oem7ddUkjNMaxnhXzeklkB8Y0hek6BJowsloksPS8Tz3nNUEDgt3EjBvL2dHc/w0QBhIBVePx1xtgZFJE5NBJd+2gZq1ThLvuglLuOwdRATKSJAJbelogvQui7gsWOJCCoshAqGbhfQ3r++7q8tptED1W4WPW9/HrnVCpAjlmvHU+Dp+9hfZdXUU1Ae5+uxH3p83MODWbIdnCEHTNc7W8tbQehvZ/nzUDBn7L6L32GNCgyMrGVe1Mvnozzv9FgcUoNDpVblxQCcNsLNDrhd38Sh3zFlaKuG05jk5owMAegr6ZiVSg2Maar1s46IpNtHaJlNq1VHXavRUEVrRz681DKcw0cfO/arnlngph2bWZDCIfKHSWZJbjHDewu6J/ISAldtasbGf8hRv4vjw8nXXX6WHXvVzPRw9VcvTsQuYel8mlD1Vyy30VIhglOY6F00DfoAUDPlSKw+qK56Sa9PLqxljvruhjCpcWCrsbamPrRhcTLtnEI1cUcPFRGQPZv4R44N1G7rx1K/sdn8kNZ+Uy/ZZtvP1moyhQqMeNGxhgKBLIYlupoXpQTKszIDY4sAxsAUYDA4ee+9ETQZFEEESHnxnHZnD7+fmM6mYrp/5i7nO13L6gEnOuid8fns4P61xU/ewU5XLBENd3FoJ0XO8TcQUgrOq55qiNMw3sThgYQodQQMkOD3KumdmnZHHFidkRxQ4HApVNfi5dWMHrbzVBrhlThgl/i188O9VkTLRdhWDMNhhes98ABo7Qg1AQOc0NPlKG2Zj1+3TOm5bO+JLEu7J2hzaXyhPLG7n5hVpat3ug0CYUjwAIf22syAwDBgzAziB00apAqx7rnWni4PFJHLWfg2ljkxgzxEpGrCikKLi9Gis3OHl1RRsvfNJK7a9OEaGU0ZfNGg0Y2HOxcwg98gkiJrfZJ+Jz001k5JvZe5iNkjwzw3LNZKeasJnFBvTtHpWKBh+/bPeyepObHds8Im46TRHhgbB7FxUwYGA3xM4n9M4n6ZZ6nyYqnnaooZJIkta1lLGeB0+KSS/yp0WdNGDAQE8xsJayRAhWdAlmdCXeSCUGDOI2YKCv2E0r6BkwYGAgYRC6AQN7AAxCN2BgD4BB6AYM7AEwCN2AgT0ABqEbMLAHwCB0Awb2ABiEbsDAHoD/B6onROwbtN92AAAAAElFTkSuQmCC",
      Position = { 198,752 },
      Size = { 164,48 },
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "powered by",
      Position = {198,733},
      Size = {164,19},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center",
      Color = {255,255,255}
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Open Source Text to Speech",
      Position = {0,0},
      Size = {560,75},
      Font = "Roboto",
      FontSize = 36,
      FontStyle = "Medium Italic",
      HTextAlign = "Center",
      VTextAlign = "Center",
      Color = {255,255,255}
    })
    layout["QR"] = {
      PrettyName = "QR Code",
      ButtonStyle = "Trigger",
      Position = {173,100},
      Size = {215,215},
      ButtonVisualStyle = "Gloss",
      UnlinkOffColor = true,
      Color = {255,255,255},
      OffColor = {255,255,255},
      StrokeWidth = 0,
      StrokeColor = {0,0,0},
      CornerRadius = 10,
      Padding = 10
    }
    table.insert(graphics,{
      Type = "Text",
      Text = about_blurb,
      Position = {30,330},
      Size = {500,347},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Top",
      Color = {0,0,0}
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Developed by Jason Krasavage",
      Position = {367,781},
      Size = {189,19},
      Font = "Roboto",
      FontSize = 12,
      FontStyle = "Italic",
      HTextAlign = "Right",
      VTextAlign = "Center",
      Color = {230,230,230}
  
    })
  end
  return layout, graphics
end

--Start event based logic
if Controls then
  ------------------------------------------------------
  ---------------- Q-SYS Text to Speech ----------------
  ------------------------------------------------------
  -- Written by: Jason Krasavage (SPL, LLC.)
  -- Inspired by: The Farm AV 'FarmTTS' Plugin
  -- Initial prototype done 10/22/2022, and finally
  -- completed and made public around 12/15/2022 after
  -- rougly ~6 hours of total development
  ------------------------------------------------------
  ------------------------------------------------------
  
  
  -- Includes --
  
  rapidjson = require("rapidjson")
  
  -- QR Code Logic
  
  
  
  function generate()
    local mode = {"low", "medium", "quartile", "high"}
    local url = "https://github.com/jasonkrasavage/q-sys-text-to-speech"
    local svg = QRCode.GenerateSVG(url, mode[3])
    
    legend = {
      DrawChrome = false,
      IconData = Crypto.Base64Encode(svg)
    }
  
    Controls.QR.Legend = rapidjson.encode(legend)
  end
  
  generate()
  
  -- Base64 logic from: https://github.com/iskolbin/lbase64
  
  local base64 = {}
  
  local extract = _G.bit32 and _G.bit32.extract -- Lua 5.2/Lua 5.3 in compatibility mode
  if not extract then
  	if _G.bit then -- LuaJIT
  		local shl, shr, band = _G.bit.lshift, _G.bit.rshift, _G.bit.band
  		extract = function( v, from, width )
  			return band( shr( v, from ), shl( 1, width ) - 1 )
  		end
  	elseif _G._VERSION == "Lua 5.1" then
  		extract = function( v, from, width )
  			local w = 0
  			local flag = 2^from
  			for i = 0, width-1 do
  				local flag2 = flag + flag
  				if v % flag2 >= flag then
  					w = w + 2^i
  				end
  				flag = flag2
  			end
  			return w
  		end
  	else -- Lua 5.3+
  		extract = load[[return function( v, from, width )
  			return ( v >> from ) & ((1 << width) - 1)
  		end]]()
  	end
  end
  
  
  function base64.makeencoder( s62, s63, spad )
  	local encoder = {}
  	for b64code, char in pairs{[0]='A','B','C','D','E','F','G','H','I','J',
  		'K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y',
  		'Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n',
  		'o','p','q','r','s','t','u','v','w','x','y','z','0','1','2',
  		'3','4','5','6','7','8','9',s62 or '+',s63 or'/',spad or'='} do
  		encoder[b64code] = char:byte()
  	end
  	return encoder
  end
  
  function base64.makedecoder( s62, s63, spad )
  	local decoder = {}
  	for b64code, charcode in pairs( base64.makeencoder( s62, s63, spad )) do
  		decoder[charcode] = b64code
  	end
  	return decoder
  end
  
  local DEFAULT_ENCODER = base64.makeencoder()
  local DEFAULT_DECODER = base64.makedecoder()
  
  local char, concat = string.char, table.concat
  
  function base64.encode( str, encoder, usecaching )
  	encoder = encoder or DEFAULT_ENCODER
  	local t, k, n = {}, 1, #str
  	local lastn = n % 3
  	local cache = {}
  	for i = 1, n-lastn, 3 do
  		local a, b, c = str:byte( i, i+2 )
  		local v = a*0x10000 + b*0x100 + c
  		local s
  		if usecaching then
  			s = cache[v]
  			if not s then
  				s = char(encoder[extract(v,18,6)], encoder[extract(v,12,6)], encoder[extract(v,6,6)], encoder[extract(v,0,6)])
  				cache[v] = s
  			end
  		else
  			s = char(encoder[extract(v,18,6)], encoder[extract(v,12,6)], encoder[extract(v,6,6)], encoder[extract(v,0,6)])
  		end
  		t[k] = s
  		k = k + 1
  	end
  	if lastn == 2 then
  		local a, b = str:byte( n-1, n )
  		local v = a*0x10000 + b*0x100
  		t[k] = char(encoder[extract(v,18,6)], encoder[extract(v,12,6)], encoder[extract(v,6,6)], encoder[64])
  	elseif lastn == 1 then
  		local v = str:byte( n )*0x10000
  		t[k] = char(encoder[extract(v,18,6)], encoder[extract(v,12,6)], encoder[64], encoder[64])
  	end
  	return concat( t )
  end
  
  function base64.decode( b64, decoder, usecaching )
  	decoder = decoder or DEFAULT_DECODER
  	local pattern = '[^%w%+%/%=]'
  	if decoder then
  		local s62, s63
  		for charcode, b64code in pairs( decoder ) do
  			if b64code == 62 then s62 = charcode
  			elseif b64code == 63 then s63 = charcode
  			end
  		end
  		pattern = ('[^%%w%%%s%%%s%%=]'):format( char(s62), char(s63) )
  	end
  	b64 = b64:gsub( pattern, '' )
    
  	local cache = usecaching and {}
  	local t, k = {}, 1
  	local n = #b64
  	local padding = b64:sub(-2) == '==' and 2 or b64:sub(-1) == '=' and 1 or 0
    
  	for i = 1, padding > 0 and n-4 or n, 4 do
  		local a, b, c, d = b64:byte( i, i+3 )
  		local s
  		if usecaching then
  			local v0 = a*0x1000000 + b*0x10000 + c*0x100 + d
  			s = cache[v0]
  			if not s then
  				local v = decoder[a]*0x40000 + decoder[b]*0x1000 + decoder[c]*0x40 + decoder[d]
  				s = char( extract(v,16,8), extract(v,8,8), extract(v,0,8))
  				cache[v0] = s
  			end
  		else
  			local v = decoder[a]*0x40000 + decoder[b]*0x1000 + decoder[c]*0x40 + decoder[d]
  			s = char( extract(v,16,8), extract(v,8,8), extract(v,0,8))
  		end
  		t[k] = s
  		k = k + 1
  	end
  
  	if padding == 1 then
  		local a, b, c = b64:byte( n-3, n-1 )
  		local v = decoder[a]*0x40000 + decoder[b]*0x1000 + decoder[c]*0x40
  		t[k] = char( extract(v,16,8), extract(v,8,8))
  	elseif padding == 2 then
  		local a, b = b64:byte( n-3, n-2 )
  		local v = decoder[a]*0x40000 + decoder[b]*0x1000
  		t[k] = char( extract(v,16,8))
  	end
  
  	return concat( t )
  end
  
  
  local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/' -- You will need this for encoding/decoding
  function dec(data)
      data = string.gsub(data, '[^'..b..'=]', '')
      return (data:gsub('.', function(x)
          if (x == '=') then return '' end
          local r,f='',(b:find(x)-1)
          for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
          return r;
      end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
          if (#x ~= 8) then return '' end
          local c=0
          for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
              return string.char(c)
      end))
  end
  
  -- unfortunately we will error out with a max execution limits errors if we try to decode any base64 encoded strings that are longer than about ~12000 characters
  -- the solution to this problem is to piece through the encoding "chunk by chunk", and to do each chunk of decoding inside of a timer, becuase timers are special
  -- in qsys in that they use a new subprocess that is seperate from the main thread so you will not run into max execution limits when recursing through the string
  
  currently_decoding = false
  decoding_timer = Timer.New()
  current_data = ""
  
  decoding_timer.EventHandler = function()
    if currently_decoding == false then
      if audio_file~=nil then
        filedata = audio_file:write(current_data)
        io.close(audio_file)
        decoding_timer:Stop()
      end
    end
  end
  
  chunk_size = 12000
  
  function decodeByChunk(encoded, decoded)
    if #encoded > chunk_size then
      print("loop")
      decoded = decoded .. base64.decode(string.sub(encoded, 1, chunk_size)) --decode the subsequent chunk
      encoded = string.sub(encoded, chunk_size+1, -1)
      Timer.CallAfter(function() decodeByChunk(encoded, decoded) end, 0)
    else
      decoded = decoded .. base64.decode(encoded)
      current_data = decoded
      currently_decoding = false
    end
  end
  
  -- Control logic
  
  function findLanguageCode(code) --function for using lookup table below to map language codes provided by Google to languages for readability
    for x,y in ipairs(languages) do
      if code == y["code"] then
        return(y["language"])
      end
    end
  end
  
  languages = { -- Lookup table for language codes to languages, google API does not return the full language string
    {language = "Afrikaans (South Africa)", code = "af-ZA"}, 
    {language = "Arabic", code = "ar-XA"}, 
    {language = "Bengali (India)", code = "bn-IN"}, 
    {language = "Bulgarian (Bulgaria)", code = "bg-BG"}, 
    {language = "Catalan (Spain)", code = "ca-ES"}, 
    {language = "Chinese (Hong Kong)", code = "yue-HK"}, 
    {language = "Czech (Czech Republic)", code = "cs-CZ"}, 
    {language = "Danish (Denmark)", code = "da-DK"},
    {language = "Dutch (Belgium)", code = "nl-BE"},
    {language = "Dutch (Netherlands)", code = "nl-NL"},
    {language = "English (Australia)", code = "en-AU"},
    {language = "English (India)", code = "	en-IN"},
    {language = "English (UK)", code = "en-GB"},
    {language = "English (US)", code = "en-US"},
    {language = "Filipino (Philippines)", code = "fil-PH"},
    {language = "Finnish (Finland)", code = "fi-FI"},
    {language = "French (Canada)", code = "fr-CA"},
    {language = "French (France)", code = "fr-FR"},
    {language = "German (Germany)", code = "de-DE"},
    {language = "Greek (Greece)", code = "el-GR"},
    {language = "Gujarati (India)", code = "gu-IN"},
    {language = "Hindi (India)", code = "hi-IN"},
    {language = "Hungarian (Hungary)", code = "hu-HU"},
    {language = "Icelandic (Iceland)", code = "is-IS"},
    {language = "Indonesian (Indonesia)", code = "id-ID"},
    {language = "Italian (Italy)", code = "it-IT"},
    {language = "Japanese (Japan)", code = "ja-JP"},
    {language = "Kannada (India)", code = "kn-IN"},
    {language = "Korean (South Korea)", code = "ko-KR"},
    {language = "Latvian (Latvia)", code = "lv-LV"},
    {language = "Malay (Malaysia)", code = "ms-MY"},
    {language = "Malayalam (India)", code = "ml-IN"},
    {language = "Mandarin Chinese", code = "cmn-CN"},
    {language = "Norwegian (Norway)", code = "nb-NO"},
    {language = "Polish (Poland)", code = "pl-PL"},
    {language = "Portuguese (Brazil)", code = "pt-BR"},
    {language = "Portuguese (Portugal)", code = "pt-PT"},
    {language = "Punjabi (India)", code = "	pa-IN"},
    {language = "Romanian (Romania)", code = "ro-RO"},
    {language = "Russian (Russia)", code = "ru-RU"},
    {language = "Serbian (Cyrillic)", code = "sr-RS"},
    {language = "Slovak (Slovakia)", code = "sk-SK"},
    {language = "Spanish (Spain)", code = "es-ES"},
    {language = "Spanish (US)", code = "es-US"},
    {language = "Swedish (Sweden)", code = "sv-SE"},
    {language = "Tamil (India)", code = "ta-IN"},
    {language = "Telugu (India)", code = "te-IN"},
    {language = "Thai (Thailand)", code = "th-TH"},
    {language = "Turkish (Turkey)", code = "tr-TR"},
    {language = "Ukrainian (Ukraine)", code = "uk-UA"},
    {language = "Vietnamese (Vietnam)", code = "vi-VN"}
    }
  
  
  voices = {}
  
  voice_type = {
    "Standard",
    "Wavenet",
    "Neural2"
    }
    
  Controls.voice_type.Choices = voice_type
  temp_languages = {}
  
  for x,y in ipairs(languages) do
    table.insert(temp_languages, y["language"])
  end
  
  Controls.language.Choices = temp_languages
  
  
  
  Controls.voice_type.EventHandler = function()
    Controls.language.String = ""
    Controls.voice_name.String = ""
    local temp = {}
    local temp_2 = {}
    for x,y in ipairs(voices) do
      if y["voiceType"] == Controls.voice_type.String then
        table.insert(temp, y["name"])
        table.insert(temp_2, y["language"])
      end
    end
    local hash = {}
    local res = {}
    
    for _,v in ipairs(temp_2) do
       if (not hash[v]) then
           res[#res+1] = v -- you could print here instead of saving to result table if you wanted
           hash[v] = true
       end
    
    end
    
    table.sort(res)
    Controls.voice_name.Choices = temp
    Controls.language.Choices = res
    
    if Controls.voice_type.String ~= "" and Controls.language.String ~= "" and Controls.voice_name.String ~= "" then
      Controls.convert_tts.IsDisabled = false
    end
  end
  
  Controls.language.EventHandler = function(self)
    Controls.voice_name.String = ""
    local temp = {}
    for x,y in ipairs(voices) do
      if y["voiceType"] == Controls.voice_type.String then
        if y["language"] == self.String then
          table.insert(temp, y["name"])
        end
      end
    end
    Controls.voice_name.Choices = temp
    if Controls.voice_type.String ~= "" and Controls.language.String ~= "" and Controls.voice_name.String ~= "" then
      Controls.convert_tts.IsDisabled = false
    end
  end
  
  
  Controls.voice_name.EventHandler = function(self)
    for x,y in ipairs(voices) do
      if y["name"] == self.String then
        Controls.selected_name.String = y["name"]
        Controls.selected_gender.String = y["ssmlGender"]
        Controls.selected_language.String = y["language"]
        Controls.selected_language_code.String = y["languageCodes"][1]
      end
    end
    if Controls.voice_type.String ~= "" and Controls.language.String ~= "" and Controls.voice_name.String ~= "" then
      Controls.convert_tts.IsDisabled = false
    end
  end
  
  Controls.convert_tts.EventHandler = function()
    convertTTS()
  end
  
  Controls.text.EventHandler = function(self)
    if self.String ~= "" then
      if Controls.voice_type.String ~= "" and Controls.language.String ~= "" and Controls.voice_name.String ~= "" then
        Controls.convert_tts.IsDisabled = false
      end
    end
  end
  
  
  Controls.slot_selector.Choices = {1,2,3,4,5,6,7,8,9,10}
  
  function pluginError(text)
    print(text)
  end
  
  
  function processTTS(string, text)
    local selection = tonumber(Controls.slot_selector.String)
    audio_file = io.open("media/Audio/Slot-"..tostring(selection).."-tts.mp3","w+")
    if audio_file~=nil then
      decodeByChunk(string, "")
    else
      pluginError("file==nil")
    end
    text_file = io.open("media/Audio/Slot-"..tostring(selection).."-tts.txt","w+")
    if text_file~=nil then
      filedata = text_file:write(text)
      io.close(text_file)
    else
      pluginError("file==nil")
    end
    Controls.slot_text[selection].String = Controls.text.String
    updateControls()
  end
  
  function updateControls()
    if not System.IsEmulating then
      Controls.text.IsDisabled = false
      Controls.slot_selector.IsDisabled = false
      Controls.voice_type.IsDisabled = false
      Controls.language.IsDisabled = false
      Controls.voice_name.IsDisabled = false
      Controls.selected_gender.IsDisabled = false
      Controls.selected_name.IsDisabled = false
      Controls.selected_language.IsDisabled = false
      Controls.selected_language_code.IsDisabled = false
      Controls.text.String = ""
      for i=1, #Controls.slot_trigger do
        if io.open("media/Audio/Slot-"..tostring(i).."-tts.mp3","r") then
          Controls.slot_name[i].IsDisabled = false
          Controls.slot_text[i].IsDisabled = false
          Controls.slot_trigger[i].IsDisabled = false
          Controls.slot_delete[i].IsDisabled = false
          local file = io.open("media/Audio/Slot-"..tostring(i).."-tts.txt","r")
          local text = file:read("*a")
          Controls.slot_text[i].String = text
        else
          Controls.slot_text[i].String = ""
          Controls.slot_name[i].String = ""
          Controls.slot_name[i].IsDisabled = true
          Controls.slot_text[i].IsDisabled = true
          Controls.slot_trigger[i].IsDisabled = true
          Controls.slot_delete[i].IsDisabled = true
        end
      end
    else
      --system is emulating
      print("System is emulating. This plugin will not work in emulation mode.")
      for i=1, #Controls.slot_trigger do
        Controls.slot_name[i].IsDisabled = true
        Controls.slot_text[i].IsDisabled = true
        Controls.slot_trigger[i].IsDisabled = true
        Controls.slot_delete[i].IsDisabled = true
      end
      Controls.text.String = "This plugin will not work in emulation mode."
      Controls.text.IsDisabled = true
      Controls.slot_selector.IsDisabled = true
      Controls.voice_type.IsDisabled = true
      Controls.language.IsDisabled = true
      Controls.voice_name.IsDisabled = true
      Controls.selected_gender.IsDisabled = true
      Controls.selected_name.IsDisabled = true
      Controls.selected_language.IsDisabled = true
      Controls.selected_language_code.IsDisabled = true
    end
  end
  
  
  function clearControls()
    for i=1, #Controls.slot_trigger do
      Controls.slot_text[i].String = ""
      Controls.slot_name[i].IsDisabled = true
      Controls.slot_text[i].IsDisabled = true
      Controls.slot_trigger[i].IsDisabled = true
      Controls.slot_delete[i].IsDisabled = true
    end
    Controls.selected_name.String = ""
    Controls.selected_language.String = ""
    Controls.selected_gender.String = ""
    Controls.selected_language_code.String = ""
    
    Controls.voice_type.String = ""
    Controls.language.String = ""
    Controls.voice_name.String = ""
    
    Controls.text.String = ""
    Controls.convert_tts.IsDisabled = true
    
  end
  
  for i=1, #Controls.slot_delete do
    Controls.slot_delete[i].EventHandler = function()
      os.remove("media/Audio/Slot-"..tostring(i).."-tts.mp3")
      os.remove("media/Audio/Slot-"..tostring(i).."-tts.txt")
      updateControls()
    end
  end
  
  for i=1, #Controls.slot_trigger do
    audio_player["root"].String = "Audio/"
    audio_player["directory"].String = ""
    Controls.slot_trigger[i].EventHandler = function()
      audio_player["filename"].String = "Slot-"..tostring(i).."-tts.mp3"
      audio_player["play"]:Trigger()
    end
  end
  
  
  -- HTTP logic for the Google TTS API: https://cloud.google.com/text-to-speech
  
  function convertTTSResponseHandler(tbl, code, data, err, headers)
    --print( string.format("Response Code: %i\t\tErrors: %s\rData: %s",code, err or "None", data))
    response = rapidjson.decode(data)
    --print(response["audioContent"])
    if not System.IsEmulating then 
      currently_decoding = true
      decoding_timer:Start(.001)
      processTTS(response["audioContent"], Controls.text.String)
    end
  end
  
  function convertTTS() --HTTP POST for request a text to speech conversion
    local data = {
      input = {
        text = Controls.text.String
      },
      voice = {
        languageCode = Controls.selected_language_code.String,
        name = Controls.selected_name.String,
        ssmlGender = Controls.selected_gender.String
      },
      audioConfig = {
        audioEncoding = "MP3"
      }
    }
    
    local BaseURL = "https://texttospeech.googleapis.com/v1/text:synthesize"
    HttpClient.Upload {
      Url = BaseURL,
      Method = "POST",
      Data = rapidjson.encode(data),
      Headers = {
        ["Content-Type"] = "application/json; charset=utf-8",
        ["X-Goog-Api-Key"] = Controls.api_key.String
      },
      EventHandler = convertTTSResponseHandler
    }
  end
  
  
  function getVoicesResponseHandler(tbl, code, data, err, headers)
    --print( string.format("Response Code: %i\t\tErrors: %s\rData: %s",code, err or "None", data))
    response = rapidjson.decode(data)
    for x,y in ipairs(response["voices"]) do
      y["language"] = findLanguageCode(y["languageCodes"][1])
      if string.find(y["name"], voice_type[1]) ~= nil then
        y["voiceType"] = voice_type[1]
      elseif string.find(y["name"], voice_type[2]) ~= nil then
        y["voiceType"] = voice_type[2]
      elseif string.find(y["name"], voice_type[3]) ~= nil then
        y["voiceType"] = voice_type[3]
      end
      Controls.api_connected.Boolean = true
      Controls.api_connected.Color = "green"
      table.insert(voices, y)
    end
  end
  
  
  function getVoices(url) --HTTP GET for requesting complete list of available voices
    local BaseURL = "https://texttospeech.googleapis.com/v1/voices"
    HttpClient.Download {
      Url = BaseURL,
      Headers = {
        ["Content-Type"] = "application/json; charset=utf-8",
        ["X-Goog-Api-Key"] = Controls.api_key.String
      },
      EventHandler = getVoicesResponseHandler
    }
  end
  
  Controls.api_key.EventHandler = function(self)
    if self.String ~= "" then
      getVoices()
      clearControls()
      updateControls()
    else
      Controls.api_connected.Boolean = false
      Controls.api_connected.Color = "red"
    end
  end
  -- Runtime logic
  if Controls.api_key.String ~= "" then
    getVoices()
  else
    Controls.api_connected.Boolean = false
    Controls.api_connected.Color = "red"
  end
  
  clearControls()
  updateControls()
end
