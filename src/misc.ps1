$wshell = New-Object -ComObject wscript.shell;
$nircmdPath = "$PSScriptRoot\..\resources\NirCmd\nircmd.exe"

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

function RunWith-NirCmd {
    <#
        .DESCRIPTION
        Executes a command via "nircmd.exe".

        .PARAMETER Command
        The command to send to "nircmd.exe" to execute.

        .INPUTS
        None. You cannot pipe objects to this function.

        .OUTPUTS
        None. This function does not generate any output.

        .EXAMPLE
        RunWith-NirCmd "setcursor 1400 890"
    #>

    param (
        [parameter(mandatory)][string]$Command
    )

    $wshell.Run("$nircmdPath $Command")
}