function Check-ExchangeOnline {
  try {
    $exoConnection = Get-EXOConnection
    if($exoConnection) {
      Write-Host "Already connected to Exchange Online. Continuing..."
      Start-Sleep -Seconds 2
    } else {
      Write-Host "You are not connected to Exchange Online. Connecting now..."
      Connect-ExchangeOnline
    }
  } catch {
    Write-Host "You are not connected to Exchange Online. Connecting now..."
    Connect-ExchangeOnline
  }
}
