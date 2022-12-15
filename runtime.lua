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
