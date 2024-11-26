function Main-Menu {
    Clear-Host
    Menu-Title -Title "Mailbox Delegate Management Tool"
    while ($true) {
        $choice = Show-Menu -MenuOptions $mainMenu
        switch ($choice) {
            1 {
              Sub-Menu "Add Delegate Permission(s)" $addDelegateMenu $addFunctions
            }
            2 {
              Sub-Menu "Remove Delegate Permission(s)" $removeDelegateMenu $removeFunctions
            }
            3 {
              Sub-Menu "Generate Report of Current Delegates" $delegateReportMenu $reportFunctions
            }
            4 {
              Sub-Menu "View Delegate Action Log History" $delegateLogMenu $logFunctions
            }
            5 {
              Write-Host "Exiting script."
              return
            }
            default {
              Write-Host "Invalid choice. Please try again."; Start-Sleep -Seconds 2
            }
        }
    }
}
