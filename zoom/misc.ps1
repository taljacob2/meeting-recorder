$wshell = New-Object -ComObject wscript.shell;

function Launch-Chrome {
    param (
        [parameter(mandatory)][string]$Url
    )

    $wshell.Run("chrome")
    Sleep 2
    $wshell.SendKeys($Url)
    $wshell.SendKeys("{ENTER}")
}

function Launch-ZoomMeeting {
    param (
        [parameter(mandatory)][string]$Url
    )

    Launch-Chrome $Url
    Sleep 4
    $wshell.SendKeys("{LEFT}")
    $wshell.SendKeys("{ENTER}")
}