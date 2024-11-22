function Add-AccessRight {
  param (
    [string]$right
  )
  $DelegateToAdd = (Get-ExoMailbox -Identity $DelegateToAdd).UserPrincipalName
  switch ($right) {
      "FullAccess" {
        $isFullAccess = Check-FullAccess -MailboxToChange $MailboxToChange -DelegateToAdd $DelegateToAdd
        
        if ($isFullAccess) {
          Write-Host "$DelegateToAdd is already FullAccess delegate on $MailboxToChange."
        } else {
          Add-FullAccess -MailboxToChange $MailboxToChange -DelegateToAdd $DelegateToAdd
        }
      }
      "SendAs" {
        $isSendAs = Check-SendAs -MailboxToChange $MailboxToChange -DelegateToAdd $DelegateToAdd

        if ($isSendAs) {
            Write-Host "$DelegateToAdd is already SendAs delegate on $MailboxToChange."
        } else {
          Add-SendAs -MailboxToChange $MailboxToChange -DelegateToAdd $DelegateToAdd
        }
      }
      "SendOnBehalf" {
        $isSendOnBehalf = Check-SendOnBehalf -MailboxToChange $MailboxToChange -DelegateToAdd $DelegateToAdd

        if ($isSendOnBehalf -eq $True) {
            Write-Host "$DelegateToAdd is already SendOnBehalf delegate on $MailboxToChange."
        } elseif ($isSendOnBehalf -eq $False) {
          Add-SendOnBehalf -MailboxToChange $MailboxToChange -DelegateToAdd $DelegateToAdd
        }
      }
      Default {
        "Invalid AccessRight defined."
      }
  }
}
