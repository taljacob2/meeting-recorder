Option Explicit

Dim wshell : Set wshell = CreateObject("wscript.shell")

' FIXME: Doesn't work everytime.
Function LaunchApowersoftScreenRecorder()

    ' Kill the old task of `Apowersoft Online Launcher.exe` if exists.
    wshell.Run "taskkill /F /IM " & chr(34) & "Apowersoft Online Launcher.exe" & chr(34)
    
    ' Launch a new task of `Apowersoft Online Launcher.exe`    
    wscript.Sleep 2000 ' Sleep main thread
    wshell.Run("chrome.exe")
    wscript.Sleep 2000 ' Sleep main thread
    wshell.SendKeys "apowersoft-launcher://online-screen-recorder"
    wshell.SendKeys "{ENTER}"
    wscript.Sleep 2000 ' Sleep main thread
    wshell.SendKeys "{LEFT}"
    wshell.SendKeys "{ENTER}"
End Function

Function LaunchZoomSession(fullZoomUrl)
    wshell.Run("chrome.exe")
    wscript.Sleep 2000 ' Sleep main thread
    wshell.SendKeys fullZoomUrl
    wshell.SendKeys "{ENTER}"
    wscript.Sleep 4000 ' Sleep main thread
    wshell.SendKeys "{LEFT}"
    wshell.SendKeys "{ENTER}"
End Function

Function StartRecordWithApowersoft()
    wshell.SendKeys "^%{F1}" ' CTRL + ALT + F1
End Function

Function StopRecordWithApowersoft()
    wshell.SendKeys "^%{F2}" ' CTRL + ALT + F2
End Function

Function ExitWindow(windowTitle)
    wshell.AppActivate windowTitle ' Activate window
    wscript.Sleep 5000 ' Sleep main thread
    wshell.SendKeys "%{F4}" ' ALT + F4
End Function

' ' Sleeps the main thread untile a specific scheduled time.
' ' For example:
' ' SleepTillScheduledTime("13-Feb-22 08:51:00")
' Function SleepTillScheduledTime(scheduledTime)
'     do while Now <> scheduledTime
'         wscript.Sleep 900 ' Sleep main thread for 0.9 second
'     loop
' End Function

' -----------------------------------------------------------------------------

do while Now <> "20-Feb-22 09:55:00"
    wscript.Sleep 900 ' Sleep main thread for 0.9 second
loop

' LaunchApowersoftScreenRecorder()
' LaunchZoomSession("https://zoom.us/j/97936905301?pwd=NHJkNnZpRCtPakNPL2tnVmJiVEJnZz09")
wscript.Sleep 2000 ' Sleep main thread
StartRecordWithApowersoft()

' Join meeting of an already-opened window of google-meets.
wshell.Run "I:\Tal\NirCmd\nircmd.exe setcursor 1650 730", 0, True
wscript.Sleep 1000 ' Sleep main thread
' wshell.Run "I:\Tal\NirCmd\nircmd.exe sendmouse right click", 0, True
wshell.Run "I:\Tal\NirCmd\nircmd.exe sendmouse left click", 0, True

do while Now <> "20-Feb-22 12:35:00"
    wscript.Sleep 900 ' Sleep main thread for 0.9 second
loop

StopRecordWithApowersoft()
wscript.Sleep 5000 ' Sleep main thread
ExitWindow("Save recording")
