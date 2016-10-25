;send emailadress when pressing a key
  ![any key]::
	send [see@example.com]
return

;open program when pressing key combination, here ALT with any key
  ^+[any key]::
	run [any programpath]
return

;moves active window to left or right side of the screen when pressing 
;CTRL + < [left] 
;OR 
;CTRL + y [right]
  ^<::
	send #{Left}
return
	^y::
	send #{Right}
return

;toggles hidden files in windows when pressing WIN + h
	<#h::
	RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden
	If HiddenFiles_Status = 2 {
		Progress, b w200, SHOWING FILES
		Sleep 1000
		Progress OFF
		RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1
	}

	Else {
		Progress, b w200, HIDING FILES
		Sleep 1000
		Progress OFF
		RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2
	}
	sleep 500
	send {F5}
return
