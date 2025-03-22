@echo off
chcp 65001 > NUL
set CURL_CMD=C:\Windows\System32\curl.exe -kL
set EASY_TOOLS=%~dp0..\..\EasyTools
set GITHUB_CLONE_OR_PULL_TAG=%EASY_TOOLS%\Git\GitHub_CloneOrPull_Tag.bat
set PYTHON_ACTIVATE=%EASY_TOOLS%\Python\Python_Activate.bat

call %~dp0DeleteTritonCache.bat

pushd %~dp0..\..\ComfyUI

call %PYTHON_ACTIVATE%
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )
popd rem %~dp0..\..\ComfyUI

pushd %~dp0

@REM https://github.com/pytorch/pytorch/pull/138992
echo copy /Y pytorch\torch\_inductor\codecache.py %~dp0..\..\ComfyUI\venv\Lib\site-packages\torch\_inductor\codecache.py
copy /Y pytorch\torch\_inductor\codecache.py %~dp0..\..\ComfyUI\venv\Lib\site-packages\torch\_inductor\codecache.py
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

if not exist triton-3.1.0-cp310-cp310-win_amd64.whl ( 
	setlocal enabledelayedexpansion
	echo.
	echo %CURL_CMD% -O https://github.com/woct0rdho/triton-windows/releases/download/v3.1.0-windows.post9/triton-3.1.0-cp310-cp310-win_amd64.whl
	%CURL_CMD% -O https://github.com/woct0rdho/triton-windows/releases/download/v3.1.0-windows.post9/triton-3.1.0-cp310-cp310-win_amd64.whl
	if !ERRORLEVEL! neq 0 ( pause & endlocal & popd & exit /b 1 )
	endlocal
)
echo pip install -qq triton-3.1.0-cp310-cp310-win_amd64.whl
pip install -qq triton-3.1.0-cp310-cp310-win_amd64.whl
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM if not exist triton-3.2.0-cp310-cp310-win_amd64.whl ( 
@REM 	setlocal enabledelayedexpansion
@REM 	echo.
@REM 	echo %CURL_CMD% -O https://github.com/woct0rdho/triton-windows/releases/download/v3.2.0-windows.post10/triton-3.2.0-cp310-cp310-win_amd64.whl
@REM 	%CURL_CMD% -O https://github.com/woct0rdho/triton-windows/releases/download/v3.2.0-windows.post10/triton-3.2.0-cp310-cp310-win_amd64.whl
@REM 	if !ERRORLEVEL! neq 0 ( pause & endlocal & popd & exit /b 1 )
@REM 	endlocal
@REM )
@REM echo pip install -qq triton-3.2.0-cp310-cp310-win_amd64.whl
@REM pip install -qq triton-3.2.0-cp310-cp310-win_amd64.whl
@REM if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

if not exist "sageattention-2.1.1+cu124torch2.5.1-cp310-cp310-win_amd64.whl" (
	setlocal enabledelayedexpansion
	echo.
	echo %CURL_CMD% -O https://github.com/sdbds/SageAttention-for-windows/releases/download/2.1.1/sageattention-2.1.1+cu124torch2.5.1-cp310-cp310-win_amd64.whl
	%CURL_CMD% -O https://github.com/sdbds/SageAttention-for-windows/releases/download/2.1.1/sageattention-2.1.1+cu124torch2.5.1-cp310-cp310-win_amd64.whl
	if !ERRORLEVEL! neq 0 ( pause & endlocal & popd & exit /b 1 )
	endlocal
)
echo pip install -qq "sageattention-2.1.1+cu124torch2.5.1-cp310-cp310-win_amd64.whl"
pip install -qq "sageattention-2.1.1+cu124torch2.5.1-cp310-cp310-win_amd64.whl"
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM Experimental
if not exist "spas_sage_attn-0.1.0+cu124torch2.5.1-cp310-cp310-win_amd64.whl" (
	setlocal enabledelayedexpansion
	echo.
	echo %CURL_CMD% -O https://github.com/sdbds/SpargeAttn-for-windows/releases/download/0.1.0/spas_sage_attn-0.1.0+cu124torch2.5.1-cp310-cp310-win_amd64.whl
	%CURL_CMD% -O https://github.com/sdbds/SpargeAttn-for-windows/releases/download/0.1.0/spas_sage_attn-0.1.0+cu124torch2.5.1-cp310-cp310-win_amd64.whl
	if !ERRORLEVEL! neq 0 ( pause & endlocal & popd & exit /b 1 )
	endlocal
)
echo pip install -qq "spas_sage_attn-0.1.0+cu124torch2.5.1-cp310-cp310-win_amd64.whl"
pip install -qq "spas_sage_attn-0.1.0+cu124torch2.5.1-cp310-cp310-win_amd64.whl"
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

set CUDA_TOOLKIT_DL_VERSION=12.8.1
setlocal enabledelayedexpansion
if not exist cuda_%CUDA_TOOLKIT_DL_VERSION%_windows_network.exe (
	echo.
	echo %CURL_CMD% -O https://developer.download.nvidia.com/compute/cuda/%CUDA_TOOLKIT_DL_VERSION%/network_installers/cuda_%CUDA_TOOLKIT_DL_VERSION%_windows_network.exe
	%CURL_CMD% -O https://developer.download.nvidia.com/compute/cuda/%CUDA_TOOLKIT_DL_VERSION%/network_installers/cuda_%CUDA_TOOLKIT_DL_VERSION%_windows_network.exe
	if !ERRORLEVEL! neq 0 ( pause & endlocal & exit /b 1 )
)

if not exist vs_BuildTools.exe (
	echo.
	echo %CURL_CMD% -O https://aka.ms/vs/17/release/vs_buildtools.exe
	%CURL_CMD% -O https://aka.ms/vs/17/release/vs_buildtools.exe
	if !ERRORLEVEL! neq 0 ( pause & endlocal & exit /b 1 )
)
endlocal

@REM call vs_BuildTools.exe
@REM start cuda_%CUDA_TOOLKIT_DL_VERSION%_windows_network.exe

popd rem %~dp0
