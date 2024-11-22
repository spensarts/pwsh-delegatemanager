function Get-Delegate {
    param (
      [string]$MailboxToChange,
      [string]$DelegateToAdd
    )
    #Clean/Uniform address
    $DelegateToAdd = (Get-ExoMailbox -Identity $DelegateToAdd).UserPrincipalName
    
    #Get User Name and Permissions
    $mailUser = (Get-User -Identity $DelegateToAdd).DisplayName
    $FullStatus = Check-FullAccess -MailboxToChange $MailboxToChange -DelegateToAdd $DelegateToAdd
    $SendStatus = Check-SendAs -MailboxToChange $MailboxToChange -DelegateToAdd $DelegateToAdd
    $BehalfStatus = Check-SendOnBehalf -MailboxToChange $MailboxToChange -DelegateToAdd $DelegateToAdd
    
    # Debug
    #Write-Host "FullStatus = $FullStatus"
    #Write-Host "SendStatus = $SendStatus"
    #Write-Host "BehalfStatus = $BehalfStatus"

    $CurrentPermissions = @()

    if($FullStatus) {
     # Write-Host $FullStatus
        $CurrentPermissions += "FullAccess"
    }
    if($SendStatus) {
     # Write-Host $SendStatus
        $CurrentPermissions += "SendAs"
    }
    if($BehalfStatus -eq $True) {
     # Write-Host $BehalfStatus
        $CurrentPermissions += "SendOnBehalfOf"
    }

   $delegateReport = [PSCustomObject]@{
      UserName = $mailUser
      UserMailbox = $DelegateToAdd
      Mailbox = $MailboxToChange
      Permissions = $CurrentPermissions 
    }

    $delegateReport | Format-Table

  }
