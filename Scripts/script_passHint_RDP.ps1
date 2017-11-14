$hintline= Get-Content hint.txt

$acl= get-acl -path "hklm:\SAM\SAM"
$inherit = [system.security.accesscontrol.InheritanceFlags]"ContainerInherit, ObjectInherit"
$propagation = [system.security.accesscontrol.PropagationFlags]"None"
$rule=new-object system.security.accesscontrol.registryaccessrule "Administrators","FullControl",$inherit,$propagation,"Allow"
$acl.addaccessrule($rule)
$acl|set-acl

Set-ItemProperty -Path 'HKLM:\SAM\SAM\Domains\Account\Users\000001F4' -Name UserPasswordHint -Value $hintline