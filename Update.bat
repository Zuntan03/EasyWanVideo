@echo off
chcp 65001 > NUL

call %~dp0EasyTools\Git\Git_SetPath.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

@REM echo "動作に必要なモデルなどをダウンロードします。よろしいですか？ [y/n]（空欄なら y）"
@REM echo.
@REM echo "Download Model etc. Are you sure? [y/n] (default: y)"
@REM set /p DOWNLOAD_MDOEL_YES_OR_NO=

pushd %~dp0EasyTools
echo.
echo git pull https://github.com/Zuntan03/EasyTools
git pull
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo git reset --hard origin/main
git reset --hard origin/main
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )
popd

pushd %~dp0
echo.
echo git pull https://github.com/Zuntan03/EasyWanVideo
git pull
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo git reset --hard origin/main
git reset --hard origin/main
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )
popd

call %~dp0EasyWanVideo\Setup.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

@REM if /i "%DOWNLOAD_MDOEL_YES_OR_NO%" == "n" ( exit /b 0 )
@REM call %~dp0Download.bat
