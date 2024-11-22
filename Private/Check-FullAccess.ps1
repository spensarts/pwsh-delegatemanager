function Check-FullAccess {
  param (
    [string]$MailboxToChange,
    [string]$DelegateToAdd
  )

  #Get current perms
  $currentDelegates = Get-MailboxPermission -Identity $MailboxToChange | Where-Object {
    $_.User -notmatch "NT AUTHORITY\\SELF" -and $_.AccessRights -contains "FullAccess"
  }

  #Check if user already exists with requested permissions
  $isAlreadyDelegate = $currentDelegates | Where-Object { $_.User -like "$DelegateToAdd*" }

  return $isAlreadyDelegate
}
