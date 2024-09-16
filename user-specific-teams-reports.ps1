# Import Microsoft Teams PowerShell module
Import-Module MicrosoftTeams

# Get user credentials
$credential = Get-Credential

# Connect to Microsoft Teams
Connect-MicrosoftTeams -Credential $credential

# Define output file path for the CSV report
$outputFile = "C:\Users\YourName\Documents\TeamsUserActivityReport.csv"

# Get the list of users in the organization
$users = Get-TeamUser -GroupId "Your-Team-Group-Id"

# Initialize an array to hold user activity data
$userActivity = @()

# Loop through each user and gather activity information
foreach ($user in $users) {
    $activity = New-Object PSObject -Property @{
        User = $user.UserPrincipalName
        Role = $user.Role
        TeamsJoined = (Get-TeamUser -User $user.UserPrincipalName).Count
        MessagesSent = (Get-TeamChatMessage -User $user.UserPrincipalName).Count
    }
    $userActivity += $activity
}

# Export data to CSV
$userActivity | Export-Csv -Path $outputFile -NoTypeInformation

Write-Host "User activity report generated successfully."

# Disconnect from Teams
Disconnect-MicrosoftTeams
