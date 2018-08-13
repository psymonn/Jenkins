[CmdletBinding()]
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
		Invoke-Pester .\CodeCoverage\CoverageTest.Tests.ps1 -CodeCoverage .\CodeCoverage\CoverageTest.ps1 -verbose -OutputFile "$Source\Pester\test2.xml"  -OutputFormat NUnitXml
        # Execute tests
 	    Invoke-Pester -verbose -OutputFile "$Source\Pester\$OutFile"  -OutputFormat NUnitXml `
                      -EnableExit -Script @{ Path = "$Source\Pester"; Parameters = @{
                                                             IISSite = $IISSite;
                                                             IISPool = $IISPool;};}
 
 }
 Catch {
    Exit 1
 }
 