function Save-CsvFilePath {
  $todaysDate = Get-Date -Format "yyyy-MM-dd"
  $sanitizedMailbox = $orphanMailbox -replace '[.@]', '_'
  $filename = "$($todaysDate)_$($sanitizedMailbox).csv"
  
  if ($IsWindows) {
      
      if (-not ([System.Windows.Forms.SaveFileDialog] -as [type])) {
        Add-Type -AssemblyName System.Windows.Forms
      }
      $savedialog = New-Object System.Windows.Forms.SaveFileDialog
      $savedialog.InitialDirectory = [System.Environment]::GetFolderPath('Desktop')
      $savedialog.Filter = "CSV Files (*.csv)|*.csv|All files (*.*)|*.*"
      $savedialog.DefaultExt = "csv"
      Title = "Select location to save CSV file"

      if ($savedialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
          return $savedialog.FileName
      } else {
            return $null
      }
  # MAC OS
  } elseif ($IsMacOs) {
    $appleScript = @"
      set defaultName to "$($filename)"
      set theFile to (choose file name with prompt "Save CSV file as:" default name defaultName)
      return (POSIX path of theFile)
"@
    $savepath = osascript -e $appleScript
    return $savepath
  }
}
