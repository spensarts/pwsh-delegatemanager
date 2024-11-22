function Sub-Menu {
    param (
      [string]$Title, 
      [array]$Options, 
      [array]$Functions
    )
    Clear-Host
    Menu-Title -Title $Title
    $separatorLine = "-" * ($Title.Length + 6)
    while ($true) {
      $choice = Show-Menu -MenuOptions $Options
      if ($choice -eq $Options.Count) {
        break
      } elseif ($choice -gt 0 -and $choice -le $Functions.Count) {
        try {
          $selectedFunction = $Functions[$choice-1]
          Write-Host "Selected $($Options[$choice-1]). Running..."
          & Run-SelectedFunction -Function $selectedFunction
        } catch {
          Write-Host "Error running function: $($_.Exception.Message)" -ForegroundColor Red
        }
        Start-Sleep -Seconds 2
      } else {
        Write-Host "Invalid choice. Please try again."
        Start-Sleep -Seconds 2
      }
      Write-Host $separatorLine -ForegroundColor DarkCyan
    }
}

