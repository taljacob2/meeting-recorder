# Specify the Execution times
$TriggerTimes = @(
    # '4:12:00pm',
    # '4:12:10pm',
    # '4:12:20pm',
    # '2:00:00pm',
    '11:11:30am'
)

# Sort in chronologic order
#  assuming the times format are the same
$TriggerTimes = $TriggerTimes | Sort-Object

foreach ($t in $TriggerTimes)
{
    if((Get-Date -Date $t) -lt (Get-Date))
    {
        "Belong to the past: '$t'"
        continue
    }

    # Sleep for the remaining time
    (Get-Date -Date $t) - (Get-Date) | Start-Sleep

    # Trigger event
    #  insert your code here
    "# TriggerTime: '$t' - Executing my code here!"
}