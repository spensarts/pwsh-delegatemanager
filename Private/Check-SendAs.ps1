function Check-SendAs {
  param (
    [string]$MailboxToChange,
    [string]$DelegateToAdd
  )

  $currentDelegates = Get-RecipientPermission -Identity $MailboxToChange | Where-Object {
      $_.Trustee -notmatch "NT AUTHORITY\\SELF" -and $_.AccessRights -contains "SendAs"
  }

  $isAlreadyDelegate = $currentDelegates | Where-Object { $_.Trustee -like "$DelegateToAdd*"}

  return $isAlreadyDelegate
}
