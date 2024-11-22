############
#MENU TEXT
############
$mainMenu = @(
  "Add Delegate Permissions to Mailbox", 
  "Remove Delegate Permissions from Mailbox", 
  "Generate Report of Current Delegates", 
  "View Delegate Action Log History", 
  "Exit"
)

$addDelegateMenu = @(
  "Add Delegate Permissions - Manual Entry", 
  "Add Delegate Permissions - CSV File", 
  "Return to Main Menu"
)

$removeDelegateMenu = @(
  "Remove Delegate Permissions - Manual Entry", 
  "Return to Main Menu"
)

$delegateReportMenu = @(
  "Generate Delegate Report - Output to Console", 
  "Generate Delegate Report - Export to CSV", 
  "Return to Main Menu"
)

$delegateLogMenu = @(
  "Return to Main Menu"
)

################
#MENU SCRIPTS
################
$addFunctions = @(
  @{ Command = "Add-ManualEntry"; Arguments = @{} }, 
  @{ Command = "Add-CSVEntry"; Arguments = @{} }
)

$removeFunctions = @(
  @{ Command = "Remove-ManualEntry"; Arguments = @{} }, 
  @{ Command = "Remove-CSVEntry"; Arguments = @{} }
)

$reportFunctions = @(
  @{ Command = "Delegate-Report"; Arguments = @{ ReportType = "Console" } },
  @{ Command = "Delegate-Report"; Arguments = @{ ReportType = "CSV" } }
)

$logFunctions = @(
  @{ Command = "Log-History"; Arguments = @{} }
)
