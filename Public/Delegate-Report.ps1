function Delegate-Report {
    param (
      [string]$ReportMailbox,
      [string]$ReportType
    )
      
    #Get mailbox name and permissions
    if ($ReportMailbox) {
      $orphanMailbox = $ReportMailbox
    } else {
      $orphanMailbox = Read-Host "Please enter the Orphan Mailbox"
    }

    $delegates = Get-MailboxPermission -Identity $orphanMailbox | Where-Object { ($_.IsInherited -eq $false) -and ($_.User -ne "NT AUTHORITY\SELF") }

    #Get delegate ID, delegate name, and delegate permissions
    $delegatesReport = @()

    foreach ($delegate in $delegates) {
        $delegateUser = Get-User -Identity $delegate.User
        $delegateDisplayName = $delegateUser.DisplayName

        $delegatesReport += [PSCustomObject]@{
            Mailbox = $orphanMailbox
            Delegate = $delegate.User
            DisplayName = $delegateDisplayName
            AccessRights = ($delegate.AccessRights -join ", ")
        }
    }

    switch ($ReportType) {
        'Console' {
          $delegatesReport | Format-Table
        }
        'CSV' {
          $savePath = Save-CsvFilePath

          if ($savePath) {
            $delegatesReport | Export-Csv -Path $savePath -NoTypeInformation
          } else {
              Write-Host "Save operation cancelled."
          }
        }
    }
}
