function Add-SendOnBehalfOf {
  param (
    [string]$MailboxToChange,
    [string]$DelegateToAdd
  )
  $aNumber = (Get-Mailbox -Identity $DelegateToAdd).Identity

  Write-Host "Adding $DelegateToAdd as SendOnBehalf delegate on $MailboxToChange"
  try {
      Set-Mailbox -Identity $MailboxToChange -GrantSendOnBehalfTo @{Add=$DelegateToAdd}
  } catch {
    Write-Host "An error occurred while adding SendOnBehalf permissions for: $_"
  }
}
