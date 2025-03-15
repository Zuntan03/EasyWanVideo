@echo off
chcp 65001 > NUL
set CURL_CMD=C:\Windows\System32\curl.exe -kL
set EASY_TOOLS=%~dp0..\..\EasyTools
set PYTHON_ACTIVATE=%EASY_TOOLS%\Python\Python_Activate.bat

pushd %~dp0..\..\ComfyUI

call %PYTHON_ACTIVATE%
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo pip uninstall -qq -y sageattention triton
pip uninstall -qq -y sageattention triton
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI
