

cd /d %~dp0

set ANDROID_STUDIO_PATH=%cd%
set ANDROID_STUDIO_PATH=%ANDROID_STUDIO_PATH:\=\\%

echo Windows Registry Editor Version 5.00>@ж��.reg
echo.>>@ж��.reg

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Android Studio]>>@ж��.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Android Studio\Components]>>@ж��.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Android Studio]>>@ж��.reg
echo.>>@ж��.reg

echo Windows Registry Editor Version 5.00>@�̻�.reg
echo.>>@�̻�.reg

echo [HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Android Studio]>>@�̻�.reg
echo "Path"="%ANDROID_STUDIO_PATH%">>@�̻�.reg
echo "StartMenuGroup"="Android Studio">>@�̻�.reg
echo.>>@�̻�.reg

echo [HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Android Studio\Components]>>@�̻�.reg
echo "Main"="1">>@�̻�.reg
echo.>>@�̻�.reg

echo [HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Android Studio]>>@�̻�.reg
echo "DisplayName"="Android Studio">>@�̻�.reg
echo "DisplayVersion"="1.0">>@�̻�.reg
echo "Publisher"="Google Inc.">>@�̻�.reg
echo "URLInfoAbout"="http://developer.android.com">>@�̻�.reg
echo "DisplayIcon"="%ANDROID_STUDIO_PATH%\\uninstall.exe">>@�̻�.reg
echo "UninstallString"="%ANDROID_STUDIO_PATH%\\uninstall.exe">>@�̻�.reg
echo "NoModify"=dword:00000001>>@�̻�.reg
echo "NoRepair"=dword:00000001>>@�̻�.reg
echo.>>@�̻�.reg

@regedit /s @ж��.reg
@regedit /s @�̻�.reg

:__subCall_Status_Code__
if "%errorlevel%"=="0" ( 
	echo Done Sucessful.
	pause
	goto :EOF
) else (
  if "%errorlevel%"=="1" (
  	echo Done Failed.
  	pause
  	goto :EOF
  ) else (
    echo Not Found Error.
    echo "errorlevel=%errorlevel%"
    pause
  	goto :EOF
  )
)

:DisableUAC
reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f

:EnableUAC
reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f
