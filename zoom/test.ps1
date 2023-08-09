# Specify the Execution times
$TriggerTimes = @(
    # '4:12:00pm',
    # '4:12:10pm',
    # '4:12:20pm',
    # '2:00:00pm',
    '11:00:50am'
)

# Sort in chronologic order
#  assuming the times format are the same
$TriggerTimes = $TriggerTimes | Sort-Object

foreach ($t in $TriggerTimes)
{
    # Past time ?
    if((Get-Date) -lt (Get-Date -Date $t))
    {
        # Sleeping
        if ((Get-Date -Date $t) -gt (Get-Date))
        {
            # Sleep for the remaining time
            (Get-Date -Date $t) - (Get-Date) | Start-Sleep
            echo "here"
        }

        # Trigger event
        #  insert your code here
        "# TriggerTime: '$t' - Executing my code here!"

    }else{"Belong to the past: '$t'"}
}