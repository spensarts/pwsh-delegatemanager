# DelegateManager
(Project is WIP. Not all functions are currently available.)
Version 0.0.1
- Available Features:
  - Add Delegate Permissions
  - Generate List of Current Delegate Permissions

- Planned Features (Not Available):
  - Remove Delegate Permissions
  - Change Existing Delegate Permissions
  - DelegateManager logging

## Requirements
- Powershell with ExchangeManagementOnline module
  - Note: Currently only tested with Powershell 7.x
- Role with applicable Exchange Online permissions

## Use
From within the directory that contains the it-ess-exo-delegatemanager folder:\
`Import-Module ./it-ess-exo-delegatemanager/`

Once imported:\
`Manage-Delegates`
