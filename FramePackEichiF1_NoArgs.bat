@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0EasyTools
set PYTHON_ACTIVATE=%EASY_TOOLS%\Python\Python_Activate.bat

if not exist %~dp0FramePack\venv\ (
	echo call %~dp0EasyWanVideo\SetupFramePack.bat
	call %~dp0EasyWanVideo\SetupFramePack.bat
)

pushd %~dp0FramePack

call %PYTHON_ACTIVATE%
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM --share, --port, --server
echo python endframe_ichi_f1.py %*
python endframe_ichi_f1.py %*
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0FramePack
