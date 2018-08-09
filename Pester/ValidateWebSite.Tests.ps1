param (
    [String]$IISSite,
    [String]$IISPool
)

import-module C:\Users\TI\Documents\WindowsPowerShell\Modules\Remotely\Remotely.psd1
 
Describe "ValidateWebSite" {
 
    # Check if IIS is installed
    It "IIS Service Started" {
        $Result = Remotely { Get-Service W3SVC } 
	$Result.Status | Should be "Running"
    }
 
    # Check if Website is created
    It "IIS Web Site started" {
        $Result = Remotely { param($IISSite) Get-Website -Name $IISSite } -ArgumentList $IISSite
	$Result.State | Should be "Started"
    }
    
    # Check if Application exsists
    It "IIS Application Pool Started" {
        $Result = Remotely { param($IISPool) Get-WebAppPoolState -name $IISPool }  -ArgumentList $IISPool
	$Result.Value | Should be "Started"
    }
}