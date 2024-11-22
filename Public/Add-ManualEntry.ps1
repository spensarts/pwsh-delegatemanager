function Add-ManualEntry {
    $MailboxToChange = Read-Host "Please enter the mailbox where delegate permissions will be changed"
    $DelegateToAdd = Read-Host "Please enter the user mailbox receiving permission changes"

    Write-Host "Getting current permissions..."
    Get-Delegate -MailboxToChange $MailboxToChange -DelegateToAdd $DelegateToAdd

    $right = Read-Host "Please enter the permission you would like to Add (FullAccess, SendAs, SendOnBehalfOf)"

    Add-AccessRight -right $right
}
