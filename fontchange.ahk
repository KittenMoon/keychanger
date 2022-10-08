bigDick := {}
indi := 0
indexes := []
icount := 0
zw := 0

Gui, +AlwaysOnTop
Gui, Add, ListBox, gActionz vChoice w200 h350

Loop, Read, db.🐸sv
{
	if (indi == 0)
	{
		indexes := StrSplit(A_LoopReadLine, ",")
	}
	Else
	{
		row := StrSplit(A_LoopReadLine, "🐸")
		key := row[1]
		row.RemoveAt(1)
		bigDick[key] := row
	}
	
	indi += 1
}

ini := ""
Loop % indexes.Length()
{
	icount += 1
	inijr := indexes[icount]
	ini = %ini%|%inijr%
}
GuiControl,, Choice, %ini%

pickstring = 4

disabledTxt = -1

temp := indexes[pickstring]
MsgBox Starting funny discord text overide with : %temp%

return

Actionz:
If ((A_GuiEvent = "DoubleClick") || (Trigger_Action))
{
    Gui, Submit
	for i, val in indexes 
	{
		if (val == Choice)
			pickstring := i
	}
	MsgBox Switching Font to: %Choice%
}
return

DefaultTime()
{
	global disabledTxt, pickstring
	if (disabledTxt == -1)
	{
		disabledTxt = %pickstring%
		pickstring := 1
		
		MsgBox Disabled Funny Text
	}
	Else
	{
		pickstring = %disabledTxt%
		disabledTxt := -1
		
		MsgBox Enabled Funny Text
	}
}

ZeroWidthToggle()
{
	global zw
	if (zw == 0)
	{
		zw := 1
		MsgBox Zero Width Spaces Enabled
	}
	else
	{
		zw := 0
		MsgBox Zero Width Spaces Disabled
	}
}

ChangeFontGUI()
{
	global disabledTxt
	
	if (disabledTxt == -1)
	{
		Gui, Show, x860 y300, Font Select
	}
	Else
	{
		MsgBox Changing Fonts is Disabled
	}
}

ChangeFont(way)
{
	global indexes, pickstring, icount
	
	pickstring += way
	if (pickstring > icount) 
	{
		pickstring := 1
	}
	if (pickstring <= 0) 
	{
		pickstring := icount
	}
	
	pickeI := indexes[pickstring]
	
	MsgBox Current Characters: %pickeI%
}

ChangeKey(key)
{
	global bigDick, pickstring, icount, zw
	
	keyC := bigDick[key]
	
	out := "" keyC[pickstring]
	
	if (out == "!")
	{
		Send {!}
	}
	else if (out == "#")
	{
		Send {#}
	}
	else if (out == "^")
	{
		Send {^}
	}
	else if (out == "+")
	{
		Send {+}
	}
	else if (out == "{")
	{
		SendRaw {
	}
	else if (out == "}")
	{
		SendRaw }
	}
	else if (key == "Space")
	{
		if (zw == 0)
		{
			if (out == " ")
				Send { Space }
			else
				Send % out
		}
		else
			Send ​
	}
	else 
	{
		Send % out
	}
	
	
	if (pickstring == icount || pickstring == icount - 1)
	{
		if (key == "BSpace")
		{
			Send { Delete }
		}
		Else
		{
			Send { Left }
		}
	}
	else if (key == "BSpace")
	{
		Send { BackSpace }
	}
}

#If WinActive("Font Select ahk_class AutoHotkeyGUI")

    Enter::
        Trigger_Action := true
        GoSub, Actionz
        Trigger_Action := false
    return
    
#If

#IfWinActive ahk_exe discord.exe
;#IfWinActive ahk_exe HD-Player.exe

`::ChangeKey("TIL")
1::ChangeKey("1")
2::ChangeKey("2")
3::ChangeKey("3")
4::ChangeKey("4")
5::ChangeKey("5")
6::ChangeKey("6")
7::ChangeKey("7")
8::ChangeKey("8")
9::ChangeKey("9")
0::ChangeKey("0")
-::ChangeKey("MIN")
=::ChangeKey("EQL")

q::ChangeKey("Lq")
w::ChangeKey("Lw")
e::ChangeKey("Le")
r::ChangeKey("Lr")
t::ChangeKey("Lt")
y::ChangeKey("Ly")
u::ChangeKey("Lu")
i::ChangeKey("Li")
o::ChangeKey("Lo")
p::ChangeKey("Lp")
[::ChangeKey("LBR")
]::ChangeKey("RBR")
\::ChangeKey("BSL")

a::ChangeKey("La")
s::ChangeKey("Ls")
d::ChangeKey("Ld")
f::ChangeKey("Lf")
g::ChangeKey("Lg")
h::ChangeKey("Lh")
j::ChangeKey("Lj")
k::ChangeKey("Lk")
l::ChangeKey("Ll")
SC027::ChangeKey("SCO")
'::ChangeKey("SQU")

z::ChangeKey("Lz")
x::ChangeKey("Lx")
c::ChangeKey("Lc")
v::ChangeKey("Lv")
b::ChangeKey("Lb")
n::ChangeKey("Ln")
m::ChangeKey("Lm")
,::ChangeKey("CMA")
.::ChangeKey("PRD")
/::ChangeKey("FSL")

~::ChangeKey("ABT")
!::ChangeKey("EXC")
@::ChangeKey("ATT")
#::ChangeKey("NUM")
%::ChangeKey("PER")
$::ChangeKey("DOL")
^::ChangeKey("CRT")
&::ChangeKey("AND")
*::ChangeKey("STR")
(::ChangeKey("LPR")
)::ChangeKey("RPR")
_::ChangeKey("USC")
+::ChangeKey("PLS")

+q::ChangeKey("q")
+w::ChangeKey("w")
+e::ChangeKey("e")
+r::ChangeKey("r")
+t::ChangeKey("t")
+y::ChangeKey("y")
+u::ChangeKey("u")
+i::ChangeKey("i")
+o::ChangeKey("o")
+p::ChangeKey("p")
{::ChangeKey("LCB")
}::ChangeKey("RCB")
|::ChangeKey("LNE")

+a::ChangeKey("a")
+s::ChangeKey("s")
+d::ChangeKey("d")
+f::ChangeKey("f")
+g::ChangeKey("g")
+h::ChangeKey("h")
+j::ChangeKey("j")
+k::ChangeKey("k")
+l::ChangeKey("l")
+SC027::ChangeKey("COL")
+SC028::ChangeKey("QOT")

+z::ChangeKey("z")
+x::ChangeKey("x")
+c::ChangeKey("c")
+v::ChangeKey("v")
+b::ChangeKey("b")
+n::ChangeKey("n")
+m::ChangeKey("m")
<::ChangeKey("LTH")
>::ChangeKey("GRT")
?::ChangeKey("QUE")

Space::ChangeKey("Space")
BackSpace::ChangeKey("BSpace")

#IfWinActive

F9::DefaultTime()
;F10::ChangeFont(-1)
;F11::ChangeFont(1)
F10::ZeroWidthToggle()
F11::ChangeFontGUI()
F12::ExitApp
return