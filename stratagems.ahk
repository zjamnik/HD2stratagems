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
Numpad8:: EagleRearm()
Numpad9:: Resupply()

Numpad0:: EagleClusterBomb()
Numpad1:: OrbitalPrecisionStrike()
Numpad2:: MortarSentry()
Numpad3:: GatlingSentry()

Numpad4:: MachineGun()
Numpad5:: RailGun()
Numpad6:: AntiMaterielRifle()

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

; Default
Reinforce() {
    BlockInput "On"
    Send "{LControl down}wsdaw{LControl up}"
    BlockInput "Off"
}

SOSBeacon() {
    BlockInput "On"
    Send "{LControl down}wsdw{LControl up}"
    BlockInput "Off"
}

Resupply() {
    BlockInput "On"
    Send "{LControl down}sswd{LControl up}"
    BlockInput "Off"
}

EagleRearm() {
    BlockInput "On"
    Send "{LControl down}wwawd{LControl up}"
    BlockInput "Off"
}

Hellbomb() {
    BlockInput "On"
    Send "{LControl down}swaswdsw{LControl up}"
    BlockInput "Off"
}

SSSDDelivery() {
    BlockInput "On"
    Send "{LControl down}sssww{LControl up}"
    BlockInput "Off"
}

OrbitalIlluminationFlare() {
    BlockInput "On"
    Send "{LControl down}ddaa{LControl up}"
    BlockInput "Off"
}

; Support Weapons
MachineGun() {
    BlockInput "On"
    Send "{LControl down}saswd{LControl up}"
    BlockInput "Off"
}

AntiMaterielRifle() {
    BlockInput "On"
    Send "{LControl down}sadws{LControl up}"
    BlockInput "Off"
}

Stalwart() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

ExpendableAntiTank() {
    BlockInput "On"
    Send "{LControl down}ssawd{LControl up}"
    BlockInput "Off"
}

RecoillessRifle() {
    BlockInput "On"
    Send "{LControl down}sadda{LControl up}"
    BlockInput "Off"
}

Flamethrower() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

Autocannon() {
    BlockInput "On"
    Send "{LControl down}saswwd{LControl up}"
    BlockInput "Off"
}

RailGun() {
    BlockInput "On"
    Send "{LControl down}sdswad{LControl up}"
    BlockInput "Off"
}

Spear() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

GrenadeLauncher() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

LaserCannon() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

ArcThrower() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

; Support Equipement
JumpPack() {
    BlockInput "On"
    Send "{LControl down}swwsw{LControl up}"
    BlockInput "Off"
}

SupplyPack() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

GuardDog() {
    BlockInput "On"
    Send "{LControl down}swawds{LControl up}"
    BlockInput "Off"
}

GuardDogRover() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

BallisticShieldBackpack() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

ShieldGeneratorPack() {
    BlockInput "On"
    Send "{LControl down}swadad{LControl up}"
    BlockInput "Off"
}

; Orbital Cannons
OrbitalGatlingBarrage() {
    BlockInput "On"
    Send "{LControl down}dsaww{LControl up}"
    BlockInput "Off"
}

OrbitalAirburstStrike() {
    BlockInput "On"
    Send "{LControl down}ddd{LControl up}"
    BlockInput "Off"
}

Orbital120MMHEBarrage() {
    BlockInput "On"
    Send "{LControl down}ddsads{LControl up}"
    BlockInput "Off"
}

Orbital380MMHEBarrage() {
    BlockInput "On"
    Send "{LControl down}dswwass{LControl up}"
    BlockInput "Off"
}

OrbitalWalkingBarrage() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

OrbitalLaser() {
    BlockInput "On"
    Send "{LControl down}dswds{LControl up}"
    BlockInput "Off"
}

OrbitalRailcannonStrike() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

OrbitalPrecisionStrike() {
    BlockInput "On"
    Send "{LControl down}ddw{LControl up}"
    BlockInput "Off"
}

OrbitalGasStrike() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

OrbitalEMSStrike() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

OrbitalSmokeStrike() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

; Eagle Strike
EagleStrafingRun() {
    BlockInput "On"
    Send "{LControl down}wdd{LControl up}"
    BlockInput "Off"
}

EagleAirstrike() {
    BlockInput "On"
    Send "{LControl down}wdsd{LControl up}"
    BlockInput "Off"
}

EagleClusterBomb() {
    BlockInput "On"
    Send "{LControl down}wdssd{LControl up}"
    BlockInput "Off"
}

EagleNapalmAirstrike() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

EagleSmokeStrike() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

Eagle110MMRocketPods() {
    BlockInput "On"
    Send "{LControl down}wdwa{LControl up}"
    BlockInput "Off"
}

Eagle500KgBomb() {
    BlockInput "On"
    Send "{LControl down}wdsss{LControl up}"
    BlockInput "Off"
}

; Field Effects
AntiPersonnelMinefield() {
    BlockInput "On"
    Send "{LControl down}sawd{LControl up}"
    BlockInput "Off"
}

IncendiaryMines() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

HMGEmplacement() {
    BlockInput "On"
    Send "{LControl down}swadda{LControl up}"
    BlockInput "Off"
}

ShieldGeneratorRelay() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

TeslaTower() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

; Turrets
MachineGunSentry() {
    BlockInput "On"
    Send "{LControl down}swddw{LControl up}"
    BlockInput "Off"
}

GatlingSentry() {
    BlockInput "On"
    Send "{LControl down}swda{LControl up}"
    BlockInput "Off"
}

MortarSentry() {
    BlockInput "On"
    Send "{LControl down}swdds{LControl up}"
    BlockInput "Off"
}

AutocannonSentry() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}

RocketSentry() {
    BlockInput "On"
    Send "{LControl down}swdda{LControl up}"
    BlockInput "Off"
}

EMSMortarSentry() {
    BlockInput "On"
    Send "{LControl down}{LControl up}"
    BlockInput "Off"
}