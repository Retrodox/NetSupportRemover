# Define the path to the registry key
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

# Define the name of the registry value
$valueName = "EnableLUA"

# Check if the registry path exists
if (Test-Path $registryPath) {
    # Get the value from the registry
    $value = Get-ItemProperty -Path $registryPath -Name $valueName

    # Check if the value exists
    if ($value -and $value.$valueName -ne $null) {
        # Check the value and provide a descriptive output
        if ($value.$valueName -eq 0) {
            Write-Host "Regbang has already been completed and the registry file is updated. Proceeding with uninstallation. You will still need to reboot to fully uninstall Netsupport."
        } elseif ($value.$valueName -eq 1) {
            Write-Host "Regbang has not been completed."
            # Prompt the user to ask if they want to perform Regbang
            $userInput = Read-Host "Would you like to Regbang? (Y/N)"
            if ($userInput -eq "Y") {
                # Run the batch script
               & "T:\TechServices-FP3\Techs\Jared\Scripts - J\RegBangChecker\regRun.bat"
            }
        } else {
            Write-Host "Unexpected value: " $value.$valueName
        }
    } else {
        Write-Host "EnableLUA value not found"
    }
} else {
    Write-Host "Registry path not found"
}

