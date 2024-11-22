function Add-CSVEntry {
  #OPTIONAL - Allow CSV to be specified when running script command
  param (
    [string]$csvFilePath
  )
  # Verify whether CSV was provided at run. Prompt for file if not.
  if ($csvFilePath -and (Test-Path $csvFilePath)) {
    Write-Host "File provided: $csvFilePath"
  } elseif ($csvFilePath -and -not (Test-Path $csvFilePath)) {
    Write-Host "The specified file does not exist. Please check the path and try again."
  } else {
    $csvFilePath = Get-CSVFilePath
  }

  # Validate CSV
  $csvData = Validate-CSV -csvPath $csvFilePath

  # Proceed if Valid
  if($csvData) {

    foreach ($row in $csvData) {
      $MailboxToChange = $row.MailboxToChange
      #CLEAN FORMAT - Take A#, A#@usu.edu, A#@aggies.usu.edu, first.last@usu.edu and change to A#@aggies.usu.edu
      $DelegateToAdd = $row.DelegateToAdd
      $RightsToAdd = $row.AccessRights -split ','

      foreach ($right in $RightsToAdd) {
        Add-AccessRight -right $right
      }

     # # Check for existing AccessRights
     # $isFullAccess = Check-FullAccess -MailboxToChange $MailboxToChange -DelegateToAdd $DelegateToAdd
     # $isSendAs = Check-SendAs -MailboxToChange $MailboxToChange -DelegateToAdd $DelegateToAdd
     # #$isSendOnBehalf = Check-SendOnBehalf -MailboxToChange $MailboxToChange -DelegateToAdd $DelegateToAdd

     # if ($isFullAccess) {
     #   Write-Host "$DelegateToAdd is already FullAccess delegate on $MailboxToChange"

     # } else {
     #   Add-FullAccess -MailboxToChange $MailboxToChange -DelegateToAdd $DelegateToAdd
     # }

     # if ($isSendAs) {
     #   Write-Host "$DelegateToAdd is already SendAs delegate on $MailboxToChange"
     # } else {
     #   Add-SendAs -MailboxToChange $MailboxToChange -DelegateToAdd $DelegateToAdd
     # }

     # #if ($)
    }
  } else {
    Write-Host "The file '$csvFilePath' is invalid. Please check formatting and try again."
  }
}
