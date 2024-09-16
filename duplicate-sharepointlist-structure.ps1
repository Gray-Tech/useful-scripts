# Import SharePoint module
Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking

# Credentials and URLs
$siteUrl = "https://yourdomain.sharepoint.com/sites/YourSite"
$sourceListName = "SourceList"
$targetListName = "TargetList"
$credential = Get-Credential

# Connect to SharePoint Online
Connect-SPOService -Url $siteUrl -Credential $credential

# Get source list and field details
$sourceList = Get-PnPList -Identity $sourceListName
$fields = Get-PnPField -List $sourceListName

# Create new list with the same template as the source
New-PnPList -Title $targetListName -Template $sourceList.BaseTemplate

# Duplicate fields from the source to the target list
foreach ($field in $fields) {
    if ($field.Hidden -eq $false -and $field.ReadOnlyField -eq $false) {
        Add-PnPField -List $targetListName -DisplayName $field.Title -InternalName $field.InternalName -Type $field.TypeDisplayName
    }
}

Write-Host "List structure copied successfully from $sourceListName to $targetListName."

# Disconnect session
Disconnect-SPOService
