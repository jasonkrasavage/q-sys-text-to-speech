# Open Source Text to Speech for Q-SYS

![MIT License](https://img.shields.io/badge/license-MIT-green)&nbsp;![9.4.3](https://img.shields.io/badge/tested%20on-9.4.3-blue)&nbsp;![9.4.3](https://img.shields.io/badge/tested%20on-9.6.0-blue)&nbsp;![Downloads](https://img.shields.io/github/downloads/jasonkrasavage/q-sys-text-to-speech/total)

<img src="/q-sys_logo_transparent_bg.png" width="300px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/deepmind_transparent_bg.png" width="300px">


This plugin was developed to be a free and open-source method to leverage Google's (paid) Deepmind-powered Text to Speech API. This plugin has been deployed under an MIT license, so you are free to reuse, distribute and profit from this code. You must generate a valid Google API key to use this plugin, and once you do you will be subject to Google's own pricing for API usage. See the next session below for help on generating your own Google API key. The cost is very cheap, and currently at the time of development is the following:

* Standard voices: $4.00 USD per 1 million characters
* WaveNet voices: $16.00 USD per 1 million characters
* Neural2 voices: $16.00 USD per 1 million characters
      
Audio files are only generated when you press the generate button. They are stored locally on the core in 1 of the 10 slots. When played back, the API is not used, and after converting your strings of text to audio, and saving them in the slots, the API key can happily be removed, and the core does not need access to the internet. I would advise deploying the plugin to shared environments in this manner so your API key cannot be abused by a third party. 

If you have any problems or suggestions for improvements, please open an issue [here](https://github.com/jasonkrasavage/q-sys-text-to-speech/issues).

## Generate a Google API Key

* Navigate to [console.cloud.google.com/apis/library/texttospeech.googleapis.com](https://console.cloud.google.com/apis/library/texttospeech.googleapis.com) and get signed in with your Google account if you aren't already.
* Click the blue "Enable" button to enable access to the Text to Speech API on your account, this will take a minute for it to be enabled.
* If you don't already have billing enabled on your account, a popup will appear asking you to enable billing. Complete this process, and return to the URL above and try again.
* Once enabled, from that same URL click the button that now says "Manage".
* Click "Credentials" in the navigation bar on the left.
* At the top, click "Create Credentials"and then "API Key", and let it generate the key.
* That's it! Use this key in the Q-SYS plugin to genereate text to speech audio using the API, and be sure that you to not share it with anything who shouldn't have access to it.
