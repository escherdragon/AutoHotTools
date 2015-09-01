;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT/2k/7
; Author:         José A. Romero L.<escherdragon@gmail.com>
;
; Script Function:
;	Keynav for Windows
;

#SingleInstance force

#IfWinExist,_keynav
h::
	scWidth /= 2
        Draw( _keynav, posX, posY, scWidth, scHeight ) 
	Return
+h::
	posX -= %scWidth%
        Draw( _keynav, posX, posY, scWidth, scHeight ) 
	Return
l::
	scWidth /= 2
	posX += %scWidth%
        Draw( _keynav, posX, posY, scWidth, scHeight ) 
	Return
+l::
	posX += %scWidth%
        Draw( _keynav, posX, posY, scWidth, scHeight ) 
	Return
j::
	scHeight /= 2
	posY += %scHeight%
        Draw( _keynav, posX, posY, scWidth, scHeight ) 
	Return
+j::
	posY += %scHeight%
        Draw( _keynav, posX, posY, scWidth, scHeight ) 
	Return
k::
	scHeight /= 2
        Draw( _keynav, posX, posY, scWidth, scHeight ) 
	Return
+k::
	posY -= %scHeight%
        Draw( _keynav, posX, posY, scWidth, scHeight ) 
	Return
t::
        scWidth := A_ScreenWidth
        scHeight := A_ScreenHeight / 32
        posX := 0
        posY := 0
        Draw( _keynav, posX, posY, scWidth, scHeight ) 
	Return
v::
        scWidth := A_ScreenWidth
        scHeight := A_ScreenHeight / 16
        posX := 0
        posY := scHeight * 15
        Draw( _keynav, posX, posY, scWidth, scHeight ) 
	Return
g::
        Warp( posX, posY, scWidth, scHeight )
        Return
m:: 
        Gui,destroy
        Sleep,50
        MouseMove, 5, 5, 0
        Return
`;::
	Gui,destroy
	Return
Esc::
	Gui,destroy
	return
Space::
        Warp( posX, posY, scWidth, scHeight )
	MouseClick,Left
	Return
+Space::
        Warp( posX, posY, scWidth, scHeight )
	MouseClick,Left,,,2
	Return
1::
	MouseClick,Left
	Return
+1::
	MouseClick,Left,,,2
	Return
2::
	MouseClick,Middle
	Gui,destroy
	Return
+2::
	MouseClick,Middle,,,2
	Gui,destroy
	Return
3::
	MouseClick,Right
	Gui,destroy
	Return
+3::
	MouseClick,Right,,,2
	Gui,destroy
	Return
+a::
        Click Down
        Return
a::
        Click Up
        Return
#IfWinExist

^;::

#IfWinExist,_keynav
Gui, destroy
#IfWinExist

scWidth = %A_ScreenWidth%
scHeight = %A_ScreenHeight%
posX = 0
posY = 0

Gui +AlwaysOnTop -Caption +ToolWindow
Gui, Color, EEEEEE, _keynav
Gui, Show, X%A_ScreenWidth% Y%A_ScreenHeight% W%A_ScreenWidth% H%A_ScreenHeight% NoActivate, _keynav
WinSet, Transparent, 0, _keynav
WinSet, ExStyle, ^0x20, _keynav
WinSet, TransColor, EEEEEE, _keynav
Gui, Show, X0 Y0
CrossHair( scWidth, scHeight )
Return

GuiClose:
ExitApp

Draw( _keynav, posX, posY, scWidth, scHeight ) 
{
    CoordMode, Mouse, Screen
    WinMove, _keynav, , %posX%, %posY%, %scWidth%, %scHeight%
    CrossHair( scWidth, scHeight )
}

Warp( posX, posY, scWidth, scHeight )
{
    CoordMode, Mouse, Screen
    toX := posX + scWidth/2
    toY := posY + scHeight/2
    MouseMove, toX, toY, 0
}

CrossHair( scWidth, scHeight )
{
    Gui, Add, Text, % "x0 y" . scHeight/2 . " w" . scWidth . " h1 0x10 +BackgroundTrans"
    Gui, Add, Text, % "x" . scWidth/2 . " y0 w1 h" . scHeight . " 0x11 +BackgroundTrans"

    Gui, Add, Text, % "x0 y0 w" . scWidth .  " h1 0x10 +BackgroundTrans"
    Gui, Add, Text, % "x0 y0 w1 h" . scHeight . " 0x11 +BackgroundTrans"

    Gui, Add, Text, % "x0 y" . scHeight-1 . " w" . scWidth . " h1 0x10 +BackgroundTrans"
    Gui, Add, Text, % "x" . scWidth-1 . " y0 w1 h" . scHeight . " 0x11 +BackgroundTrans"
}
