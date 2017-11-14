Import-Module ActiveDirectory
$TargetOU =  "OU=PreSetup,OU=Users PC,DC=kyiv,DC=ciklum,DC=net";
Get-ADComputer $env:COMPUTERNAME | Move-ADObject -TargetPath $TargetOU