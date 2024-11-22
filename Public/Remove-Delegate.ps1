function Remove-Delegate {


  param (
    [Parameter(Mandatory=$true)]
    [string]$csvFilePath
  )

  if (Test-Path $csvFilePath) {
    $csvData = Validate-CSV -csvPath $csvFilePath

    if($csvData) {
        foreach ($row in $csvData) {
          $MailboxToChange = $row.MailboxToChange
          $DelegateToRemove = $row.DelegateToAdd

          $isDelegate = Check-Delegate -MailboxToChange $MailboxToChange -DelegateToAdd $DelegateToRemove

          if ($isDelegate) {
              Write-Host "Removing $DelegateToRemove from $MailboxToChange."
              try {
                  Remove-MailboxPermission -Identity $MailboxToChange -User $DelegateToRemove -AccessRights FullAccess -InheritanceType All
                  Write-Host "$DelegateToRemove has been removed as a delegate of $MailboxToChange"
              } catch {
                Write-Host "An error occurred while removing the delegate: $_"
              }
          } else {
            Write-Host "$DelegateToRemove is not a delegate on $MailboxToChange"
          }
        }
    } else {
      Write-Host "The file '$csvFilePath' does not exist."
    }
  }
}
