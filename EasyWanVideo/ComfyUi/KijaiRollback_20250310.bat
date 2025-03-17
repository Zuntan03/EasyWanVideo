@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set PYTHON_ACTIVATE=%EASY_TOOLS%\Python\Python_Activate.bat
set GITHUB_CLONE_OR_PULL_HASH=%EASY_TOOLS%\Git\GitHub_CloneOrPull_Hash.bat

pushd %~dp0..\..\ComfyUI
call %PYTHON_ACTIVATE%
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )
popd

pushd %~dp0..\..\ComfyUI\custom_nodes

@REM https://github.com/kijai/ComfyUI-WanVideoWrapper
@REM https://github.com/kijai/ComfyUI-WanVideoWrapper/commit/2f085b8511aa0668926283adaa75317b364202f8 OOM
call :GITHUB_HASH_REQUIREMENTS kijai ComfyUI-WanVideoWrapper main 1fe746bb9d61f3befd86d6ac1b552ee52a99e121
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\custom_nodes
exit /b 0

:GITHUB_HASH_REQUIREMENTS
set "GITHUB_AUTHOR=%1"
set "GITHUB_REPO=%2"
set "GITHUB_BRANCH=%3"
set "GITHUB_HASH=%4"

call %GITHUB_CLONE_OR_PULL_HASH% %GITHUB_AUTHOR% %GITHUB_REPO% %GITHUB_BRANCH% %GITHUB_HASH%
if %ERRORLEVEL% neq 0 ( exit /b 1 )

if exist %GITHUB_REPO%\requirements.txt (
	setlocal enabledelayedexpansion
	echo pip install -qq -r %GITHUB_REPO%\requirements.txt
	pip install -qq -r %GITHUB_REPO%\requirements.txt
	if !ERRORLEVEL! neq 0 ( pause & endlocal & exit /b 1 )
	endlocal
)
exit /b 0
