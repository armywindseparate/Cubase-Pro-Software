; Simple Calculator in AutoHotkey
; Calculator GUI Application

#SingleInstance Force
#NoEnv
SetBatchLines, -1

; Create GUI window
Gui, Add, Text, x10 y10 w200 h20, Simple Calculator in AHK
Gui, Add, Text, x10 y40 w80 h20, First number:
Gui, Add, Edit, x90 y40 w100 h20 vNum1
Gui, Add, Text, x10 y70 w80 h20, Operator (+, -, *, /):
Gui, Add, Edit, x90 y70 w30 h20 vOperator
Gui, Add, Text, x10 y100 w80 h20, Second number:
Gui, Add, Edit, x90 y100 w100 h20 vNum2
Gui, Add, Button, x10 y130 w90 h30 gCalculate, Calculate
Gui, Add, Text, x10 y170 w300 h20 vResultText, Result will appear here
Gui, Show, w320 h220, Calculator
return

Calculate:
    ; Get input values
    Gui, Submit, NoHide

    ; Validate input
    if Num1 = or Num2 = or Operator =
    {
        MsgBox, Please fill in all fields!
        return
    }

    ; Convert to numbers
    Num1 := Float(Num1)
    Num2 := Float(Num2)

    ; Perform calculation
    if (Operator = "+")
        Result := Num1 + Num2
    else if (Operator = "-")
        Result := Num1 - Num2
    else if (Operator = "*")
        Result := Num1 * Num2
    else if (Operator = "/")
    {
        if (Num2 = 0)
        {
            MsgBox, Error: Division by zero is not allowed!
            return
        }
        Result := Num1 / Num2
    }
    else
    {
        MsgBox, Invalid operator! Please use +, -, * or /
        return
    }

    ; Display result
    GuiControl, , ResultText, Result: %Num1% %Operator% %Num2% = %Result%
return

; Close GUI
GuiClose:
ExitApp
