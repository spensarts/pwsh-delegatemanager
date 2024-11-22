function Validate-CSV {
    param (
      [string]$csvPath
    )

    try {
      $csvContent = Import-Csv -Path $csvPath

      #Check for required column
      if (
        $csvContent -and 
        $csvContent[0].PSObject.Properties.Name -contains "MailboxToChange" -and 
        $csvContent[0].PSObject.Properties.Name -contains "DelegateToAdd" -and 
        $csvContent[0].PSObject.Properties.Name -contains "AccessRights") {
        return $csvContent
      } else {
        Write-Host "CSV format is invalid. It must contain columns 'MailboxToChange','DelegateToAdd', and 'AccessRights'."
        return $null
      }
    } catch {
      Write-Host "Error reading CSV: $_"
      return $null
    }
}


