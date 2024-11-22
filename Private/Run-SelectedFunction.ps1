function Run-SelectedFunction {
  param (
    [hashtable]$Function
  )

  $Command = $Function.Command
  $Arguments = $Function.Arguments

  if (Get-Command -Name $Command -ErrorAction SilentlyContinue) {
      if ($Arguments.Count -gt 0) {
          & $Command @Arguments
      } else {
        & $Command
      }
  } else {
      Write-Error "Invalid Selection!"
  }
}
