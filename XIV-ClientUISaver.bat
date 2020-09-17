@echo off
:START
::Made by NevendyND
echo Welcome to FF14 Client UI Settings Saver.
timeout 2 > nul
echo Please read the text carefully!

set /p laufwerkbuchstabe=I need your USB-Letter from your USB, where you want to save your files (Example: G):
echo Your USB-Letter: "%laufwerkbuchstabe%"

set /p name=I need only your Username from your Pc (Example: C:\Users\*name*):
echo Your Path: "C:\Users\%name%\Documents\My Games\FINAL FANTASY XIV - A Realm Reborn"

:LWBS
echo "Type '1' for 'Import': To Import your Save-Files to your Main Pc."
echo "Type '2' for 'Export': To export your Save-Files from your Main Pc."
echo "Type '3' for 'Clean': To clean your Main-Settings-Folder."
echo "Type '4' for 'Delete': To delete your Save-Settings-Folder inside your USB-Folder."
echo "Type '5' for 'Abort': To close this Program.

set /p importexport=Please select one Number:
IF "%importexport%"=="1" ( 
	echo You are About to Import the Files.
	echo Press Space to move on!
	PAUSE
) ELSE IF "%importexport%"=="2" ( 
	echo You are About to Export the Files.
	echo Press Space to move on!
	PAUSE
) ELSE IF "%importexport%"=="3" ( 
	echo You are About to Clean the Files from your Pc.
	echo Press Space to move on!
	PAUSE
) ELSE IF "%importexport%"=="4" ( 
	echo You are About to Delete the Files from your USB.
	echo Press Space to move on!
	PAUSE
) ELSE IF "%importexport%"=="5" ( 
	EXIT
) ELSE IF "%importexport%"=="" (
	echo [Error] You need to type 1, 2, 3, 4.
	GOTO LWBS
)

IF "%importexport%"=="1" (
	echo "CAUTION: You are about to delete your Main "FINAL FANTASY XIV - A Realm Reborn"-Folder at your Pc, if you want that press Space, if not, close this Window!"
	echo "Think about it, you are copy your old Folder from your USB to your Main-Folder, these Files are maybe older!"
	PAUSE
	echo "Are you Sure? (If you want to move forward press Space, if not, close this Window, its your last chance, think about your Screenshots!)"
	PAUSE
	echo okay!
	echo Starting importing the Files..
	
	mkdir "C:\Users\%name%\Documents\My Games\FINAL FANTASY XIV - A Realm Reborn"
	echo "If the Folder is there, its ok"
	
	xcopy %laufwerkbuchstabe%:\FF14-Settings-Export "C:\Users\%name%\Documents\My Games\FINAL FANTASY XIV - A Realm Reborn" /E
	
	echo Open your Main-Folder...
	%SystemRoot%\explorer.exe "C:\Users\%name%\Documents\My Games\FINAL FANTASY XIV - A Realm Reborn"
	::Nevn
	echo Done
	GOTO FERTIG
	PAUSE
	EXIT
) 
IF "%importexport%"=="2" (
	echo "CAUTION: You are about to delete your Settings-Save "FINAL FANTASY XIV - A Realm Reborn"-Folder at your USB, if you want that press Space, if not, close this Window!"
	PAUSE
	echo Starting exporting the Files...
	
	mkdir %laufwerkbuchstabe%:\FF14-Settings-Export
	echo "If the Folder is there, its ok"
	
	xcopy "C:\Users\%name%\Documents\My Games\FINAL FANTASY XIV - A Realm Reborn"  %laufwerkbuchstabe%:\FF14-Settings-Export /E
	
	echo Open your USB-Folder...
	%SystemRoot%\explorer.exe %laufwerkbuchstabe%:\FF14-Settings-Export
	
	echo Done
	GOTO FERTIG
	PAUSE
	EXIT
)
IF "%importexport%"=="3" (
	echo "CAUTION: You are about to delete your Main "FINAL FANTASY XIV - A Realm Reborn"-Folder at your Pc, if you want that press Space, if not, close this Window!"
	PAUSE
	echo Starting deleting the Files...
	
	rmdir /s /q "C:\Users\%name%\Documents\My Games\FINAL FANTASY XIV - A Realm Reborn"
	
	echo Done
	GOTO FERTIG
	PAUSE
	EXIT
)
IF "%importexport%"=="4" (
	echo "ATTENTION: You are about to delete your Save "FINAL FANTASY XIV - A Realm Reborn"-Folder at your USB, if you want that press Space, if not, close this Window!"
	PAUSE
	echo Starting deleting the Files...
	
	rmdir /s /q %laufwerkbuchstabe%:\FF14-Settings-Export
	
	echo Done
	GOTO FERTIG
	PAUSE
	EXIT
) ELSE (
	echo [Error]
	GOTO START
)
:FERTIG

echo Thanks for using this Program.
PAUSE
::Made by NevendyND
EXIT
