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