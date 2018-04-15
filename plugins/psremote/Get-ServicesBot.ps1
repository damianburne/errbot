<#
.Synopsis
   Gets all service in bot format
#>
function Get-ServicesBot
{
    [CmdletBinding()]
    Param
    (
        # Name of the service
        [Parameter(Mandatory=$true)]
        $Name
    )

    $ErrorActionPreference = 'Stop'

    # Check connection
    try
    {
        $conn = Test-Connection $Name -Count 1
        Write-Output "System ``$(([System.Net.Dns]::GetHostByName("$Name")).hostname)``@ ``$($conn.IPV4Address)`` is up. Response time: ``$($conn.ResponseTime)``"
    }

    catch
    {
        Write-Output ":fire: System ``$($name)`` is not reachable by ping! Possible causes: Wrong name? Firewall? Server down?"
        break
    }

    # Check Services
    try
    {
        $proc = Get-Process -ComputerName $name | sort ProcessName
        Write-Output "`n*----CURRENT PROCESSES----*"
        Write-Output "$($proc | foreach {" :black_small_square:$($_.name + '@' + [math]::Round($_.CPU))%"})"
        
        $svc = Get-Service -ComputerName $name
        Write-Output "`n*----SERVICES RUNNING----*"
        Write-Output "$($svc | where {$_.Status -eq 'Running'} | foreach {" :heavy_check_mark:$($_.name)"})"
        Write-Output "`n*----STOPPED SERVICES----*"
        Write-Output "$($svc | where {$_.Status -ne 'Running'} | foreach {" :x:$($_.name)"})"

    }

    catch
    {
        Write-Output ":fire: System ``$($name)`` is not answering WinRM! Is it configured? (winrm quickconfig)"
    }
    
}
