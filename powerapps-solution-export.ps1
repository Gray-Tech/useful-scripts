# Power Platform Admin Module
Import-Module Microsoft.PowerPlatform.Admin.PowerShell

# Credentials for Power Platform Admin
$credential = Get-Credential

# Connect to Power Platform environment
$environmentName = "your-environment-name"
Connect-PowerPlatformAdminService -Credential $credential

# Define the solution name and export path
$solutionName = "YourSolutionName"
$exportPath = "C:\Backup\PowerPlatformSolutions\YourSolution.zip"

# Export the solution
Export-CrmSolution -SolutionName $solutionName -OutFile $exportPath -Managed $false

Write-Host "Solution $solutionName has been successfully exported to $exportPath."

# Disconnect from Power Platform Admin Service
Disconnect-PowerPlatformAdminService
