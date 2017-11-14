Option Explicit

Function InitializeAssetTag
If len(AssetTag.Value) <> 13 then
AssetTag.Value = ""
oEnvironment.Item("AssetTag") = ""
End If
End Function

Function ValidateLoginName
	If OSDManagedBy.Value <> "" then
		ValidateLoginName = True
	End If
	ButtonNext.disabled = not ValidateLoginName
End Function

Function ValidateAssetTag

	If Len(AssetTag.value) <> 13 then
		ValidateAssetTag = false
		ButtonNext.disabled = true
	Else
		oEnvironment.Item("AssetTag") = AssetTag.value
		ValidateAssetTag = true
		ButtonNext.disabled = false
	End if

End function