param (
    [parameter(mandatory)][DateTime[]]$StartDateList,
    [parameter(mandatory)][string]$Url
)

# Imports
. "$PSScriptRoot\misc.ps1"

# ------------------ Code ------------------

Launch-ZoomMeeting $Url

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
