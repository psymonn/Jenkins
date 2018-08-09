﻿[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [String]$Source,
    [String]$IISRoot,
    [String]$OutFile,
    [String]$IISSite,
    [String]$IISPool,
    [String]$Target
 )
 
 Try {
 
     Write-verbose "Executing Pester tests"
       
        # Create a machineconfig.csv file
        $ConfigFile = "C:\Users\TI\Documents\WindowsPowerShell\Modules\Remotely\machineConfig.csv"
        Remove-item $ConfigFile -force
        echo "ComputerName,Username,Password" > $ConfigFile
        echo $target >> $ConfigFile
    
        # Go to the Pester tests directory
 	cd "$source\Pester"
 
        # Execute tests
 	    Invoke-Pester -verbose -OutputFile "$Source\$OutFile"  -OutputFormat NUnitXml `
                      -EnableExit -Script @{ Path = "$Source\Pester"; Parameters = @{
                                                             IISSite = $IISSite;
                                                             IISPool = $IISPool;};}
 
 }
 Catch {
    Exit 1
 }
 