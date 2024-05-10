#SingleInstance Force


Suspend true
pitch := 0


Key(key, sharp1, sharp7, sharp12)
{
    if (sharp1)
        Send "{Shift Down}"
    else
        Send "{Shift Up}"
    if (sharp7)
        Send "{z Down}"
    else
        Send "{z Up}"
    if (sharp12)
        Send "{x Down}"
    else
        Send "{x Up}"
    Sleep 30
    Send "{" key " Down}"
    Sleep 30
    Send "{" key " Up}"
}


Sound(note_id, alt := 0)
{
    switch note_id {
        case 0: Key("s", false, false, false)
        case 1: Key("s", true, false, false)
        case 2: Key("a", false, false, false)
        case 3: Key("a", true, false, false)
        case 4: Key("w", false, false, false)
        case 5: Key("d", false, false, false)   ; WIP: support alternative key pattern Key("w", true, false, false)
        case 6: Key("d", true, false, false)
        case 7: Key("s", false, true, false)
        case 8: Key("s", true, true, false)
        case 9: Key("a", false, true, false)
        case 10: Key("a", true, true, false)
        case 11: Key("w", false, true, false)
        case 12: Key("s", false, false, true)   ; WIP: support alternative key pattern Key("d", false, true, false) and Key("w", true, true, false)
        case 13: Key("s", true, false, true)
        case 14: Key("a", false, false, true)
        case 15: Key("a", true, false, true)
        case 16: Key("w", false, false, true)
        case 17: Key("d", false, false, true)   ; WIP: support alternative key pattern Key("w", true, false, true)
        case 18: Key("d", true, false, true)
        case 19: Key("s", false, true, true)
        case 20: Key("s", true, true, true)
        case 21: Key("a", false, true, true)
        case 22: Key("a", true, true, true)
        case 23: Key("w", false, true, true)
        case 24: Key("d", false, true, true)   ; WIP: support alternative key pattern Key("d", false, true, true) and Key("w", true, true, true)
    }
}


Note(note)
{
    global pitch
    note_id := note + pitch
    if (0 <= note_id and note_id <= 24)
        Sound(note_id)
}


AllModifierKeysUp()
{
    Send "{Shift Up}"
    Send "{z Up}"
    Send "{x Up}"
}


SuspendScript()
{
    Key("d", true, true, true)
    Sleep 25
    AllModifierKeysUp()
    Suspend true
}


UnsuspendScript()
{
    Suspend false
}


ExitScript()
{
    AllModifierKeysUp()
    ExitApp
}


; for jis keyboards
$*Down::{
    global pitch
    pitch := 0
}
$*Left::{
    global pitch
    if (pitch > -6)
        pitch := pitch - 1
}
$*Right::{
    global pitch
    if (pitch < 5)
        pitch := pitch + 1
}

$*LShift::Note(-5)
$*a::Note(-4)
$*z::Note(-3)
$*s::Note(-2)
$*x::Note(-1)
$*d::return
$*c::Note(0)
$*f::Note(1)
$*v::Note(2)
$*g::Note(3)
$*b::Note(4)
$*h::return
$*n::Note(5)
$*j::Note(6)
$*m::Note(7)
$*k::Note(8)
$*,::Note(9)
$*l::Note(10)
$*.::Note(11)
$*;::return
$*/::Note(12)
$*SC028::Note(13)
$*SC073::Note(14)
$*]::Note(15)
$*RShift::Note(16)

$*1::Note(10)
$*q::Note(11)
$*2::return
$*w::Note(12)
$*3::Note(13)
$*e::Note(14)
$*4::Note(15)
$*r::Note(16)
$*5::return
$*t::Note(17)
$*6::Note(18)
$*y::Note(19)
$*7::Note(20)
$*u::Note(21)
$*8::Note(22)
$*i::Note(23)
$*9::return
$*o::Note(24)
$*0::Note(25)
$*p::Note(26)
$*-::Note(27)
$*@::Note(28)
$*^::return
$*[::Note(29)
$*\::Note(30)


$*PgDn::SuspendScript()


#SuspendExempt
$*PgUp::UnsuspendScript()
$*Esc::ExitScript()
#SuspendExempt false


return
