function Add-FullAccess {
  param (
    [string]$MailboxToChange,
    [string]$DelegateToAdd
  )

  Write-Host "Adding $DelegateToAdd as delegate on $MailboxToChange"
  try {
    Add-MailboxPermission -Identity $MailboxToChange -User $DelegateToAdd -AccessRights FullAccess -InheritanceType All
    Write-Host "$DelegateToAdd has been added as a FullAccess delegate on $MailboxToChange."
  } catch {
    Write-Host "An error occurred while adding FullAccess permissions for: $_"
  }
}
