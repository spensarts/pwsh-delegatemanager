function Add-SendAs {
  param (
    [string]$MailboxToChange,
    [string]$DelegateToAdd
  )

  Write-Host "Adding $DelegateToAdd as SendAs delegate on $MailboxToChange"
  try {
      Add-RecipientPermission -Identity $MailboxToChange -Trustee $DelegateToAdd -AccessRights SendAs -Confirm:$false
      Write-Host "$DelegateToAdd has been added as a SendAs delegate on $MailboxToChange."
  } catch {
      Write-Host "An error occurred while adding SendAs permissions for: $_"
  }
}


