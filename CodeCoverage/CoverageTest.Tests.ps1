$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe 'Demonstrating Code Coverage' {
    It 'Calls FunctionOne with no switch parameter set' {
        FunctionOne | Should Be 'SwitchParam was not set'
    }
    
    It 'Calls FunctionTwo' {
        FunctionTwo | Should Be 'I get executed'
    }

     It 'Calls FunctionTwo2' {
        FunctionTwo | Should Be 'I do not'
    }
}

#Invoke-Pester .\CoverageTest.Tests.ps1 
#Invoke-Pester .\CoverageTest.Tests.ps1 -CodeCoverage .\CoverageTest.ps1
#Invoke-Pester .\CoverageTest.Tests.ps1 -CodeCoverage .\CoverageTest.ps1 -OutputFile TestResults.xml -OutputFormat NUnitXml
#Invoke-Pester .\CoverageTest.Tests.ps1 -OutputFile TestResults2.xml -OutputFormat NUnitXml
#Invoke-Pester .\CoverageTest.Tests.ps1 -CodeCoverage @{Path = '.\CoverageTest.ps1'; Function = 'FunctionOne' }
#Invoke-Pester .\CoverageTest.Tests.ps1 -CodeCoverage @{Path = '.\CoverageTest.ps1'; StartLine = 7; EndLine = 14 }