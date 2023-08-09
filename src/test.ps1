<#
    .DESCRIPTION
    A script that launches a meeting (e.g. Zoom meeting), and records it in
    video.

    .PARAMETER StartDateList
    Specify the dates to launch the meeting at.

    .PARAMETER Url
    Specify the URL of the meeting, to be launched.

    .INPUTS
    None. You cannot pipe objects to this script.

    .OUTPUTS
    None. This script does not generate any output.

    .NOTES
    MIT License
    Author: Tal Jacob

    .EXAMPLE
    PS> # Single date:
    PS> .\test.ps1 (Get-Date) "https://zoom.us/j/97936905301?pwd=NHJkNnZpRCtPakNPL2tnVmJiVEJnZz09"

    .EXAMPLE
    PS> # Multiple dates:
    PS> .\test.ps1 (Get-Date), (Get-Date), (Get-Date) "https://zoom.us/j/97936905301?pwd=NHJkNnZpRCtPakNPL2tnVmJiVEJnZz09"

    .LINK
    Online version: https://github.com/taljacob2/meeting-recorder
#>

param (
    [parameter(mandatory)][DateTime[]]$StartDateList,
    [parameter(mandatory)][string]$Url
)

# Imports
. "$PSScriptRoot\misc.ps1"

# ------------------ Code ------------------

# Launch-ZoomMeeting $Url
RunWith-NirCmd "setcursor 1400 890"

# Sort in chronologic order
#  assuming the times format are the same
$StartDateList = $StartDateList | Sort-Object

$jobs = @()

# See https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/start-job
# See https://learn.microsoft.com/en-us/powershell/module/threadjob/start-threadjob
foreach ($startDate in $StartDateList) {

    # Open thread here.
    $jobs += Start-Job -Name $startDate -ScriptBlock {
        if(($using:startDate) -lt (Get-Date))
        {
            Write-Output "Belong to the past: '$using:startDate'"
            continue
        }

        # Sleep for the remaining time
        ($using:startDate) - (Get-Date) | Start-Sleep

        # Trigger event
        #  insert your code here
        Write-Output "# TriggerTime: '$using:startDate' - Executing my code here!"
    }
}

Write-Host "Jobs started..."
Wait-Job -Job $jobs

foreach ($job in $jobs) {
    Receive-Job -Job $job
}
