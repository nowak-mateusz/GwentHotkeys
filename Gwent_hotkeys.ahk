;    ___                     _                 _   _                  
;   / _ \__      _____ _ __ | |_    /\  /\___ | |_| | _____ _   _ ___ 
;  / /_\/\ \ /\ / / _ \ '_ \| __|  / /_/ / _ \| __| |/ / _ \ | | / __|
; / /_\\  \ V  V /  __/ | | | |_  / __  / (_) | |_|   <  __/ |_| \__ \
; \____/   \_/\_/ \___|_| |_|\__| \/ /_/ \___/ \__|_|\_\___|\__, |___/
;                                                           |___/     
; by matej
; 

#SingleInstance force
#NoEnv
SetDefaultMouseSpeed, 0

Menu, tray, Tip, Gwent Hotkeys
TrayTip, Gwent Hotkeys, running...,,1

#IfWinActive Gwent ahk_class UnityWndClass 

; Emote "Bad move"
F1:: ; F1 function key on top of the keyboard
Numpad1:: ; 1 on Numpad
NumpadEnd:: ; 1 on Numpad when Numlock is off
Emote(0.46, 0.60)
return

; Emote "Well played"
F2::
Numpad2::
NumpadDown::
Emote(0.42, 0.50)
return

; Emote "Thanks"
F3::
Numpad3::
NumpadPgDn::
Emote(0.46, 0.40)
return

; Emote "Watch this"
F4::
Numpad4::
NumpadLeft::
Emote(0.54, 0.40)
return

; Emote "Dammit"
F5::
Numpad5::
NumpadClear::
Emote(0.56, 0.50)
return

; Emote "You're going down"
F6::
Numpad6::
NumpadRight::
Emote(0.54, 0.60)
return

;; FUNCTIONS
; Convert relative positions of buttons on screen into absolute 
; pixels for AHK commands. Allows for different resolutions.
GetAbsolutePixels(RatioX, RatioY) {
	WinGetPos,,, Width, Height
	AbsoluteX := Round(Width * RatioX)
	AbsoluteY := Round(Height * RatioY)
	return [AbsoluteX, AbsoluteY]
}

; Emote takes relative position of emote to click
Emote(EmoteX, EmoteY) {
	BlockInput, On
	CancelSpace := GetAbsolutePixels(0.5, 0.64)
	Emote := GetAbsolutePixels(EmoteX, EmoteY)
	Send {f}
    Sleep, 120 ; Wait until bubbles have popped up	
	MouseGetPos, MouseX, MouseY
	MouseClick, left, Emote[1], Emote[2]
	Sleep, 100
	MouseClick, left, CancelSpace[1], CancelSpace[2]
	MouseMove, %MouseX%, %MouseY%
	BlockInput, Off
}