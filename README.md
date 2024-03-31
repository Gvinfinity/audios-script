# Requirements
- Pipewire
- `chmod +x audios.sh`

# Usage
`./audios.sh <input program> <output program>` <br />

# Inputs/Outputs
The i/o parameters should be part of a string that uniquely* identifies the program from the output you get with the command `pw-link -Io`|`pw-link -Ii`, for output and input respectively. <br />
*Not necessarily unique, but be aware it may link outputs to multiple inputs if not unique <br />
**Input and output is refering to the internal interfaces, microphones/loopbacks are outputs and headphones/voice-chat mic are input

# Example
My most common use is to redirect browser audio to Discord (WebRTC): <br />
`audios.sh firefox web`
