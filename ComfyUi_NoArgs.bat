@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0EasyTools
set GIT_SET_PATH=%EASY_TOOLS%\Git\Git_SetPath.bat
set PYTHON_ACTIVATE=%EASY_TOOLS%\Python\Python_Activate.bat
set EMBEDDABLE_PYTHON=%EASY_TOOLS%\Python\env\python310

if not exist %~dp0ComfyUI\venv\ (
	echo call %~dp0Update.bat
	call %~dp0Update.bat
)
if not exist %~dp0ComfyUI\venv\ (
	echo "[Error] %~dp0ComfyUI\venv\ が見つかりません。"
	pause & exit /b 1
)

call %GIT_SET_PATH%
if %ERRORLEVEL% neq 0 ( exit /b 1 )

pushd %~dp0ComfyUI

call %PYTHON_ACTIVATE%
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo python %~dp0EasyWanVideo\ComfyUi\src\comfy_ui_update_config.py user\default\comfy.settings.json
python %~dp0EasyWanVideo\ComfyUi\src\comfy_ui_update_config.py user\default\comfy.settings.json
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

if exist %EMBEDDABLE_PYTHON%\ (
	@REM tcc.exe & VS Build Tools cl.exe
	if not exist %~dp0ComfyUI\venv\Scripts\Include\Python.h (
		echo xcopy /SQY %EMBEDDABLE_PYTHON%\include\*.* %~dp0ComfyUI\venv\Scripts\Include\
		xcopy /SQY %EMBEDDABLE_PYTHON%\include\*.* %~dp0ComfyUI\venv\Scripts\Include\

		echo xcopy /SQY %EMBEDDABLE_PYTHON%\libs\*.* %~dp0ComfyUI\venv\Scripts\libs\
		xcopy /SQY %EMBEDDABLE_PYTHON%\libs\*.* %~dp0ComfyUI\venv\Scripts\libs\
	)

	@REM VS Build Tools
	@REM echo set "INCLUDE=%INCLUDE%;%EMBEDDABLE_PYTHON%\include"
	@REM set "INCLUDE=%INCLUDE%;%EMBEDDABLE_PYTHON%\include"
)

@REM Cuda 2.6.0 以降の Ultratics Error 回避
echo set TORCH_FORCE_NO_WEIGHTS_ONLY_LOAD=1
set TORCH_FORCE_NO_WEIGHTS_ONLY_LOAD=1

echo python main.py %*
python main.py %*
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0ComfyUI
