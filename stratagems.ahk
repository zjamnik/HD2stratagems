#singleInstance force
SendMode "Event"
SetKeyDelay 100, 50

; Macro keys definition
; https://www.autohotkey.com/docs/v2/Hotkeys.htm - how hotkeys work
; https://www.autohotkey.com/docs/v2/KeyList.htm - key names to use
; Modificators:
; ^ - Ctrl - combinations with Ctrl might need some modifications, better not use
; + - Shift
; ! - Alt
; # - Win
;
; v-----v key combination, can be single key or combination of keys, examples: ^x, +a, !q
; Numpad7:: Reinforce()
;        ^^ - needs to be there
;           ^---------^ stratagem function name, same as below
HotIfWinActive "Helldivers™ 2"
Numpad7:: Reinforce()
Numpad9:: Resupply()

Numpad0:: OrbitalPrecisionStrike()
Numpad3:: GatlingSentry()
Numpad2:: MachineGunSentry()
Numpad1:: AntiPersonnelMinefield()

Numpad4:: MachineGun()
Numpad5:: RailGun()

NumpadAdd:: Hellbomb()

; Stratagem definition, copy the template, change name to stratagem name and fill in the sequence same as in game.
; v-------v change the name
; Template() {
;     BlockInput "On" ;    v enter the sequence between the brackets
;     Send "{LControl down}{LControl up}"
;     BlockInput "Off"
; }

Template() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

Reinforce() {
    BlockInput "On"
    Send "{LControl down}wsdaw{LControl up}"
    BlockInput "Off"
}

Resupply() {
    BlockInput "On"
    Send "{LControl down}sswd{LControl up}"
    BlockInput "Off"
}

OrbitalPrecisionStrike() {
    BlockInput "On"
    Send "{LControl down}ddw{LControl up}"
    BlockInput "Off"
}

GatlingSentry() {
    BlockInput "On"
    Send "{LControl down}swda{LControl up}"
    BlockInput "Off"
}

MachineGunSentry() {
    BlockInput "On"
    Send "{LControl down}swddw{LControl up}"
    BlockInput "Off"
}

AntiPersonnelMinefield() {
    BlockInput "On"
    Send "{LControl down}sawd{LControl up}"
    BlockInput "Off"
}

Hellbomb() {
    BlockInput "On"
    Send "{LControl down}swaswdsw{LControl up}"
    BlockInput "Off"
}

RailGun() {
    BlockInput "On"
    Send "{LControl down}sdswad{LControl up}"
    BlockInput "Off"
}

MachineGun() {
    BlockInput "On"
    Send "{LControl down}saswd{LControl up}"
    BlockInput "Off"
}