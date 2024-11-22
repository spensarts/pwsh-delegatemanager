# DIALOG - Open Explorer on Windows or Mac, manual entry for Linux if CSV was not provided during script call
function Get-CSVFilePath {
  # WINDOWS
  if ($IsWindows) {
      Add-Type -AssemblyName System.Windows.Forms
      $dialog = New-Object System.Windows.Forms.OpenFileDialog
      $dialog.InitialDirectory = [System.Environment]::GetFolderPath('Desktop')
      $dialog.Filter = "CSV Files (*.csv)|*.csv|All files (*.*)|*.*"
      $dialog.Title = "Select a CSV file"

      if ($dialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
          return $dialog.FileName
      } else {
            Write-Host "No file selected."
            return $null
      }
  # MAC OS
  } elseif ($IsMacOs) {
    $filepath = & osascript -e 'set theFile to choose file' -e 'POSIX path of theFile' 2>/dev/null

    if ($filePath) {
      return $filePath
    } else {
      Write-Host "No file selected."
      return $null
    }
  # LINUX
  } elseif ($IsLinux) {
    $filePath = Read-Host "Please enter the full path to the CSV file"
    if (Test-Path $filePath) {
        return $filePath
    } else {
      Write-Host "File not found. Please check the path and try again."
      return $null
    }
  }
}
