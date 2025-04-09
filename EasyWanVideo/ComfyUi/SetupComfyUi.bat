@echo off
chcp 65001 > NUL
set CURL_CMD=C:\Windows\System32\curl.exe -kL
set EASY_TOOLS=%~dp0..\..\EasyTools
set GITHUB_CLONE_OR_PULL_TAG=%EASY_TOOLS%\Git\GitHub_CloneOrPull_Tag.bat
set PYTHON_ACTIVATE=%EASY_TOOLS%\Python\Python_Activate.bat
pushd %~dp0..\..

@REM https://github.com/comfyanonymous/ComfyUI
call %GITHUB_CLONE_OR_PULL_TAG% comfyanonymous ComfyUI master v0.3.26
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0
pushd %~dp0..\..\ComfyUI

call %PYTHON_ACTIVATE%
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo python -m pip install -qq -U pip setuptools wheel
python -m pip install -qq -U pip setuptools wheel
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM https://github.com/woct0rdho/SageAttention/releases
@REM https://github.com/woct0rdho/triton-windows/releases
echo pip install -qq --pre torch==2.7.0.dev20250311+cu128 torchvision==0.22.0.dev20250312+cu128 torchaudio==2.6.0.dev20250312+cu128 --index-url https://download.pytorch.org/whl/nightly/cu128
pip install -qq --pre torch==2.7.0.dev20250311+cu128 torchvision==0.22.0.dev20250312+cu128 torchaudio==2.6.0.dev20250312+cu128 --index-url https://download.pytorch.org/whl/nightly/cu128
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )


echo pip install -qq --pre triton-windows==3.3.0a0.post14
pip install -qq --pre triton-windows==3.3.0a0.post14
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

set "TRITON_CACHE=C:\Users\%USERNAME%\.triton\cache"
set "TORCH_INDUCTOR_TEMP=C:\Users\%USERNAME%\AppData\Local\Temp\torchinductor_%USERNAME%"

if not exist "%TRITON_CACHE%" ( goto :EASY_TRITON_CACHE_NOT_FOUND )
echo rmdir /S /Q "%TRITON_CACHE%"
rmdir /S /Q "%TRITON_CACHE%"
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )
:EASY_TRITON_CACHE_NOT_FOUND

if not exist "%TORCH_INDUCTOR_TEMP%" ( goto :EASY_TORCH_INDUCTOR_TEMP_NOT_FOUND )
echo rmdir /S /Q "%TORCH_INDUCTOR_TEMP%"
rmdir /S /Q "%TORCH_INDUCTOR_TEMP%"
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )
:EASY_TORCH_INDUCTOR_TEMP_NOT_FOUND


echo pip install -qq https://github.com/woct0rdho/SageAttention/releases/download/v2.1.1-windows/sageattention-2.1.1+cu128torch2.7.0-cp310-cp310-win_amd64.whl
pip install -qq https://github.com/woct0rdho/SageAttention/releases/download/v2.1.1-windows/sageattention-2.1.1+cu128torch2.7.0-cp310-cp310-win_amd64.whl
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )


@REM pip list --format=freeze | find "torchvision==" > nul
@REM if %ERRORLEVEL% equ 0 ( goto :SKIP_TORCH_INSTALL )

@REM echo pip install torch==2.6.0+cu126 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu126
@REM pip install torch==2.6.0+cu126 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu126

@REM SageAttention wheel version
@REM echo pip install -qq torch==2.5.1+cu124 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
@REM pip install -qq torch==2.5.1+cu124 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
@REM if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM :SKIP_TORCH_INSTALL

echo pip install -qq -r requirements.txt
pip install -qq -r requirements.txt
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM bnb_nf4 
@REM echo pip install -qq bitsandbytes==0.45.3
@REM pip install -qq bitsandbytes==0.45.3
@REM if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM torchao
@REM echo pip install -qq torchao==0.7.0
@REM pip install -qq torchao==0.7.0
@REM if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

call %EASY_TOOLS%\Ffmpeg\Ffmpeg_Setup.bat venv\Scripts
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM if not exist models\kgen\ ( mkdir models\kgen )
@REM if not exist models\LLM\ ( mkdir models\LLM )
@REM if not exist models\llm_gguf\ ( mkdir models\llm_gguf )
@REM if not exist models\mmaudio\ ( mkdir models\mmaudio )
if not exist models\ultralytics\ ( mkdir models\ultralytics )
if not exist user\default\workflows\ ( mkdir user\default\workflows )

popd rem %~dp0..\..\ComfyUI
