# Variable entry Set desired log location here
$LogLocation = "c:\Logs\"

#Do not alter script below this line

#Collects base date for log file name
$DT = Get-date -format FileDate

#Gets Citrix delivery Groups with the false flag set and writes output to log file
$reusemach = get-brokerdesktopgroup | where-object {$_.ReuseMachinesWithoutShutdownInOutage -like "false"}
$reusemach | select Name,ReuseMachinesWithoutShutdownInOutage | Out-file "$LogLocation\$DT.txt"

#sets the Citrix delivery groups with the false flags to true
get-brokerdesktopgroup | where-object {$_.ReuseMachinesWithoutShutdownInOutage -like "False" } | set-brokerdesktopgroup -ReuseMachinesWithoutShutdownInoutage $True


#runs a final scan if false flags are still detected an event log is written 
If ((get-brokerdesktopgroup | where-object {$_.ReuseMachinesWithoutShutdownInOutage -eq $False}).count -ne 0){
 eventcreate.exe /id 666 /D "The followling delivery groups still have the false flag within the citrix powershell SDK please investigate" /T Information /l Application /SO CitrixOutageMode}