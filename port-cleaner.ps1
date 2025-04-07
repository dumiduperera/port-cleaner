$port = Read-Host "Enter port"
 $port = $(":" + $port)

$hasPort = $(netstat -aon | findstr $port )

echo $hasPort 
if ($hasPort -eq $null) 
{
	echo "Port Not Found".
	exit
}
else 
{
	echo "----------------------------------------------" + "`n" + "`n"
	echo "Killing port ..."
	$killPID = $($(netstat -aon | findstr $port )[0] -split '\s+')[5]
	echo $killPID
	taskkill /PID $killPID /F
	#echo "Killing port ..."
}
