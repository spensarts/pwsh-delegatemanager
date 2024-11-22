function Check-SendOnBehalf {
  param (
    [string]$MailboxToChange,
    [string]$DelegateToAdd
  )
  $aNumber = (Get-Mailbox -Identity $DelegateToAdd).Identity
  $currentDelegates = (Get-Mailbox -Identity $MailboxToChange).GrantSendOnBehalfTo
  $isAlreadyDelegate = $currentDelegates.Contains($aNumber)
  #Write-Host "Is already delegate = $isAlreadyDelegate"

  return $isAlreadyDelegate
}
