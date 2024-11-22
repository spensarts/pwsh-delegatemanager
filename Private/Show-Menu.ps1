function Show-Menu {
  param (
    [array]$MenuOptions
  )

  for ($i = 0; $i -lt $MenuOptions.Count; $i++) {
    Write-Host "$($i + 1). $($MenuOptions[$i])"
  }
  Write-Host
  [int]$Selection = Read-Host "Please make a selection (1-$($MenuOptions.Count))"
  return $Selection
}
