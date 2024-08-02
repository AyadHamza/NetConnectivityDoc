Function PROMPT-USER-FOR-ADDRESS{
    param($serverIP)

    $serverIP = Read-Host -Prompt "Enter address to monitor connection"

    return $serverIP
}

Function TEST-CONNECTIVITY-AND-MONITOR{
    param($testConnectivity,$ipAdd)

    $testConnectivity = Test-Connection -ComputerName $ipAdd -ErrorAction SilentlyContinue

    return $testConnectivity

}

$serverIP = PROMPT-USER-FOR-ADDRESS

while($true){
    start-Sleep -Seconds 1
    
    $connection = TEST-CONNECTIVITY-AND-MONITOR -ipADD $serverIP

    if($connection -eq $null){
        "Connection to $($serverIP) has failed at: $(Get-Date)" | out-File .\NetConDocument.txt
        write-host ""Connection to $($serverIP) has failed.""

    }else{ 
        write-host "Successful Connection to $($serverIP) has been established."
    }

}