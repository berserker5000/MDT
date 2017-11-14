# добавить определение пути откуда запускается скрипт
# ---------------------------------------------------------------------------------------------
# файл с новым паролем, читаем содержимое файла и передаем в переменою
$path_new_pass = Get-Content ".\new_pass.txt"
# получаем логин и пароль как строку
$cred_1 = Get-Content ".\cred.txt"
$name_leter = "B:"
# пробуем удалить диск, на свякий случай,
# добавить проверку буквы, чтобы лишний рас небыло ошибок
      
# проверить содержит ли файл новый пароль или файл пустой, отправить очет/записать лог
if ( ($st_cont = [string]::IsNullOrEmpty($path_new_pass)) -eq 'True' )
    {
        # тут будет логирование
        "File with password is empty"
    }
    else
    {
        # тут будет логирование
        "File with password is NOT empty"
        # получаем список IP-адресов серверов
        $ser_ip = Get-Content ".\server_ip.txt"
        # перебырем каждый адрес по очереди
        ForEach ($single_ip in $ser_ip)
            {
                net use $name_leter /delete
                # подключаем сетивой диск - решение временое
                net use $name_leter $single_ip $cred_1
                # получаем адрес формата \\server\CustomSettings.ini, созданим переменую и запихиваем путь
                $path_to_file = [string]::Join("\",$name_leter,"Control\CustomSettings.ini")
                # получим содержимое файла CustomSettings.ini
                $file_content = Get-Content $path_to_file
                #в переменой в которой содержится все содержимое файла CustomSettings.ini ищем 
                #параметр который отвечает за пароль и сохраняем
                [string]$found_pass = $file_content | Select-String -Pattern "AdminPassword="
                # делим строку DomainAdminPassword=password на масив из 2х елементов     
                $arr_pass = $found_pass.Split("=")
                #и дальше пойдет замена пароль
                $redy_pass = [string]::Join("=",$arr_pass[0],$path_new_pass)
                $file_content | ForEach-Object {$_ -replace $found_pass,$redy_pass} | Set-Content $path_to_file
                # удаляем подключеный диск
                net use $name_leter /delete
            }}