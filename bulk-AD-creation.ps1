# Import Azure AD module
Import-Module AzureAD

# Get credentials and connect to Azure AD
$credential = Get-Credential
Connect-AzureAD -Credential $credential

# Path to CSV file containing user data
$csvPath = "C:\Users\YourName\Documents\NewUsers.csv"

# Read CSV file and create users in Azure AD
$userData = Import-Csv -Path $csvPath

foreach ($user in $userData) {
    New-AzureADUser -DisplayName $user.DisplayName `
                    -UserPrincipalName $user.UserPrincipalName `
                    -PasswordProfile (New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile -Property @{Password=$user.Password}) `
                    -AccountEnabled $true
    Write-Host "User $($user.DisplayName) has been created."
}

# Disconnect from Azure AD
Disconnect-AzureAD
