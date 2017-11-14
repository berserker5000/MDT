copy %SCRIPTROOT%\script_passHint_RDP.ps1 C:\
copy %SCRIPTROOT%\hint.txt C:\
copy %SCRIPTROOT%\enableRDP.ps1 C:\
copy %SCRIPTROOT%\disableRDP.cmd C:\

%SCRIPTROOT%\admin.cmd
%SCRIPTROOT%\psexec.exe /accepteula -i -s powershell -ExecutionPolicy Bypass -Command %SCRIPTROOT%\script_passHint_RDP.ps1
%SCRIPTROOT%\psexec.exe -i -s powershell -ExecutionPolicy Bypass -Command %SCRIPTROOT%\enableRDP.ps1
netsh advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" protocol=icmpv4:8,any dir=in action=allow

del c:\script_passHint_RDP.ps1
del c:\hint.txt
del C:\enableRDP.ps1