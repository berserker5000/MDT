# Get the TS variables
$tsenv = New-Object -COMObject Microsoft.SMS.TSEnvironment
$ScriptRoot = $tsenv.Value('ScriptRoot')
$OSDTargetSystemRoot =  $tsenv.Value('OSDTargetSystemRoot')
 
# Rename default wallpaper
#Rename-Item C:\Windows\Web\Wallpaper\Windows\img0.jpg img1.jpg -Force
 
# Copy new default wallpaper
Copy-Item $ScriptRoot\img133.jpg C:\Windows\Web\Wallpaper\Windows -Force