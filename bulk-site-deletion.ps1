# Parameters for SharePoint Online and the SharePoint Admin Center URL
$adminCenterURL = "https://yourdomain-admin.sharepoint.com"
$credential = Get-Credential

# Connect to SharePoint Online Admin Center
Connect-SPOService -Url $adminCenterURL -Credential $credential

# List of site URLs to delete
$sitesToDelete = @(
    "https://yourdomain.sharepoint.com/sites/site1",
    "https://yourdomain.sharepoint.com/sites/site2",
    "https://yourdomain.sharepoint.com/sites/site3"
)

# Loop through and delete sites
foreach ($site in $sitesToDelete) {
    Remove-SPOSite -Identity $site -Confirm:$false
    Write-Host "$site has been deleted."
}

# Disconnect session
Disconnect-SPOService
