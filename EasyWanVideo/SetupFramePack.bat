@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\EasyTools
set GITHUB_CLONE_OR_PULL_HASH=%EASY_TOOLS%\Git\GitHub_CloneOrPull_Hash.bat
set PYTHON_ACTIVATE=%EASY_TOOLS%\Python\Python_Activate.bat
set EMBEDDABLE_PYTHON=%EASY_TOOLS%\Python\env\python310

pushd %~dp0..

@REM https://github.com/lllyasviel/FramePack/commits/main/
@REM 2025/05/03 0f4df006cf38a47820514861e0076977967e6d51
@REM 2025/05/04 c5d375661a2557383f0b8da9d11d14c23b0c4eaf
call %GITHUB_CLONE_OR_PULL_HASH% lllyasviel FramePack main c5d375661a2557383f0b8da9d11d14c23b0c4eaf
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..
pushd %~dp0..\FramePack

@REM echo git fetch https://github.com/nirvash/FramePack main
@REM git fetch https://github.com/nirvash/FramePack main
@REM if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM https://github.com/nirvash/FramePack/commits/main/
@REM 2025/04/18 0dcb0cab8d9e0a131c9121abbed98320fe4801c7
@REM echo git switch -C 0dcb0ca 0dcb0cab8d9e0a131c9121abbed98320fe4801c7
@REM git switch -C 0dcb0ca 0dcb0cab8d9e0a131c9121abbed98320fe4801c7
@REM if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM https://github.com/git-ai-code/FramePack-eichi/commits/main/
call %GITHUB_CLONE_OR_PULL_HASH% git-ai-code FramePack-eichi main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo xcopy /SQY FramePack-eichi\webui\*.* .\
xcopy /SQY FramePack-eichi\webui\*.* .\
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

call %PYTHON_ACTIVATE%
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo python -m pip install -qq -U pip setuptools wheel
python -m pip install -qq -U pip setuptools wheel
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM https://github.com/woct0rdho/SageAttention/releases
@REM https://github.com/woct0rdho/triton-windows/releases
@REM torch 2.7.1 != xformers 0.0.30
echo pip install -qq torch==2.7.0+cu128 torchvision==0.22.0+cu128 torchaudio==2.7.0+cu128 xformers==0.0.30 --index-url https://download.pytorch.org/whl/cu128
pip install -qq torch==2.7.0+cu128 torchvision==0.22.0+cu128 torchaudio==2.7.0+cu128 xformers==0.0.30 --index-url https://download.pytorch.org/whl/cu128
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM triton
echo pip install -qq triton-windows==3.3.1.post19
pip install -qq triton-windows==3.3.1.post19
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

set "TRITON_CACHE=C:\Users\%USERNAME%\.triton\cache"
set "TORCH_INDUCTOR_TEMP=C:\Users\%USERNAME%\AppData\Local\Temp\torchinductor_%USERNAME%"

if not exist "%TRITON_CACHE%" ( goto :EASY_TRITON_CACHE_NOT_FOUND )
echo rmdir /S /Q "%TRITON_CACHE%"
rmdir /S /Q "%TRITON_CACHE%"
@REM if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )
:EASY_TRITON_CACHE_NOT_FOUND

if not exist "%TORCH_INDUCTOR_TEMP%" ( goto :EASY_TORCH_INDUCTOR_TEMP_NOT_FOUND )
echo rmdir /S /Q "%TORCH_INDUCTOR_TEMP%"
rmdir /S /Q "%TORCH_INDUCTOR_TEMP%"
@REM if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )
:EASY_TORCH_INDUCTOR_TEMP_NOT_FOUND

@REM sageattention
@REM torch 2.7.0 != 2.7.1
echo pip install -qq https://github.com/woct0rdho/SageAttention/releases/download/v2.1.1-windows/sageattention-2.1.1+cu128torch2.7.1-cp310-cp310-win_amd64.whl
pip install -qq https://github.com/woct0rdho/SageAttention/releases/download/v2.1.1-windows/sageattention-2.1.1+cu128torch2.7.1-cp310-cp310-win_amd64.whl
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM requirements.txt
echo pip install -qq -r requirements.txt
pip install -qq -r requirements.txt
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM compile
if exist %EMBEDDABLE_PYTHON%\ (
	@REM tcc.exe & VS Build Tools cl.exe
	if not exist venv\Scripts\Include\Python.h (
		echo xcopy /SQY %EMBEDDABLE_PYTHON%\include\*.* venv\Scripts\Include\
		xcopy /SQY %EMBEDDABLE_PYTHON%\include\*.* venv\Scripts\Include\

		echo xcopy /SQY %EMBEDDABLE_PYTHON%\libs\*.* venv\Scripts\libs\
		xcopy /SQY %EMBEDDABLE_PYTHON%\libs\*.* venv\Scripts\libs\
	)
)

popd rem %~dp0..\FramePack
