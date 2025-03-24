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

echo python -m pip install -qq --upgrade pip
python -m pip install -qq --upgrade pip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

pip list --format=freeze | find "torchvision==" > nul
if %ERRORLEVEL% equ 0 ( goto :SKIP_TORCH_INSTALL )

@REM echo pip install torch==2.6.0+cu126 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu126
@REM pip install torch==2.6.0+cu126 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu126

@REM SageAttention wheel version
echo pip install -qq torch==2.5.1+cu124 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
pip install -qq torch==2.5.1+cu124 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

:SKIP_TORCH_INSTALL

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

@REM if not exist models\kgen\ ( mkdir models\kgen )
@REM if not exist models\LLM\ ( mkdir models\LLM )
@REM if not exist models\llm_gguf\ ( mkdir models\llm_gguf )
@REM if not exist models\mmaudio\ ( mkdir models\mmaudio )
if not exist models\ultralytics\ ( mkdir models\ultralytics )
if not exist user\default\workflows\ ( mkdir user\default\workflows )

popd rem %~dp0..\..\ComfyUI
