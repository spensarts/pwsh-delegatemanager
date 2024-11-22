function Menu-Title {
  param (
    [string]$Title
  )

  $SeparatorLine = "-" * ($Title.Length + 6)

  Write-Host $Title.PadLeft($Title.Length + 3)
  Write-Host $SeparatorLine -ForegroundColor DarkCyan
  Write-Host ""
}
