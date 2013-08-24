

cd /d %~dp0

set ANDROID_STUDIO_PATH=%cd%
set ANDROID_STUDIO_PATH=%ANDROID_STUDIO_PATH:\=\\%

echo Windows Registry Editor Version 5.00>@卸载.reg
echo.>>@卸载.reg

echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Android Studio]>>@卸载.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Android Studio\Components]>>@卸载.reg
echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Android Studio]>>@卸载.reg
echo.>>@卸载.reg

echo Windows Registry Editor Version 5.00>@绿化.reg
echo.>>@绿化.reg

echo [HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Android Studio]>>@绿化.reg
echo "Path"="%ANDROID_STUDIO_PATH%">>@绿化.reg
echo "StartMenuGroup"="Android Studio">>@绿化.reg
echo.>>@绿化.reg

echo [HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Android Studio\Components]>>@绿化.reg
echo "Main"="1">>@绿化.reg
echo.>>@绿化.reg

echo [HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Android Studio]>>@绿化.reg
echo "DisplayName"="Android Studio">>@绿化.reg
echo "DisplayVersion"="1.0">>@绿化.reg
echo "Publisher"="Google Inc.">>@绿化.reg
echo "URLInfoAbout"="http://developer.android.com">>@绿化.reg
echo "DisplayIcon"="%ANDROID_STUDIO_PATH%\\uninstall.exe">>@绿化.reg
echo "UninstallString"="%ANDROID_STUDIO_PATH%\\uninstall.exe">>@绿化.reg
echo "NoModify"=dword:00000001>>@绿化.reg
echo "NoRepair"=dword:00000001>>@绿化.reg
echo.>>@绿化.reg

@regedit /s @卸载.reg
@regedit /s @绿化.reg

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
