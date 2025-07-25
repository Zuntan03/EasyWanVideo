@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set PYTHON_ACTIVATE=%EASY_TOOLS%\Python\Python_Activate.bat
set GITHUB_CLONE_OR_PULL_HASH=%EASY_TOOLS%\Git\GitHub_CloneOrPull_Hash.bat
set GITHUB_CLONE_OR_PULL_TAG=%EASY_TOOLS%\Git\GitHub_CloneOrPull_Tag.bat
set CURL_CMD=C:\Windows\System32\curl.exe -kL
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass

pushd %~dp0..\..\ComfyUI
call %PYTHON_ACTIVATE%
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )
popd

pushd %~dp0..\..\ComfyUI\custom_nodes

@REM pip UnicodeDecodeError: 'cp932' codec can't decode byte 0x97 in position 2879: illegal multibyte sequence
set PYTHONUTF8=1

@REM https://github.com/christian-byrne/audio-separation-nodes-comfyui
call :GITHUB_HASH_REQUIREMENTS christian-byrne audio-separation-nodes-comfyui master
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/chrisgoringe/cg-use-everywhere
@REM VAE と seed でのエラー回避
call :GITHUB_HASH_REQUIREMENTS chrisgoringe cg-use-everywhere main 8017bc6b063f45db6b986d9fc8bb76bd3234b838
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/Fannovel16/comfyui_controlnet_aux
call :GITHUB_HASH_REQUIREMENTS Fannovel16 comfyui_controlnet_aux main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/SeargeDP/ComfyUI_Searge_LLM
@REM call :GITHUB_HASH_REQUIREMENTS SeargeDP ComfyUI_Searge_LLM main
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/TTPlanetPig/Comfyui_TTP_Toolset
@REM call :GITHUB_HASH_REQUIREMENTS TTPlanetPig Comfyui_TTP_Toolset main
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/pythongosssss/ComfyUI-Custom-Scripts
call :GITHUB_HASH_REQUIREMENTS pythongosssss ComfyUI-Custom-Scripts main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/kijai/ComfyUI-DepthAnythingV2
call :GITHUB_HASH_REQUIREMENTS kijai ComfyUI-DepthAnythingV2 main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/cubiq/ComfyUI_essentials
call :GITHUB_HASH_REQUIREMENTS cubiq ComfyUI_essentials main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/kijai/ComfyUI-Florence2
call :GITHUB_HASH_REQUIREMENTS kijai ComfyUI-Florence2 main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/kijai/ComfyUI-FramePackWrapper
@REM https://github.com/nirvash/ComfyUI-FramePackWrapper
@REM 2025/04/29 fd2fcc2f1951982d4511f41ba644c3531718fe7b
call :GITHUB_HASH_REQUIREMENTS nirvash ComfyUI-FramePackWrapper main fd2fcc2f1951982d4511f41ba644c3531718fe7b
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

xcopy /SQY ComfyUI-FramePackWrapper\example_workflows\*.* ..\user\default\workflows\Kijai\

@REM https://github.com/Fannovel16/ComfyUI-Frame-Interpolation
call :GITHUB_HASH_REQUIREMENTS Fannovel16 ComfyUI-Frame-Interpolation main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo pip install -qq -r ComfyUI-Frame-Interpolation\requirements-no-cupy.txt
pip install -qq -r ComfyUI-Frame-Interpolation\requirements-no-cupy.txt
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM https://github.com/city96/ComfyUI-GGUF
call :GITHUB_HASH_REQUIREMENTS city96 ComfyUI-GGUF main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/kijai/ComfyUI-HunyuanVideoWrapper
call :GITHUB_HASH_REQUIREMENTS kijai ComfyUI-HunyuanVideoWrapper main 83f0bbb8694cf92e994189b045270aab4e5029b5
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/ltdrdata/ComfyUI-Impact-Pack
call :GITHUB_TAG_REQUIREMENTS ltdrdata ComfyUI-Impact-Pack Main 8.10
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/ltdrdata/ComfyUI-Impact-Subpack
call :GITHUB_TAG_REQUIREMENTS ltdrdata ComfyUI-Impact-Subpack main 1.2.9
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/kijai/ComfyUI-KJNodes
call :GITHUB_HASH_REQUIREMENTS kijai ComfyUI-KJNodes main 3e3a1a8aac61dc4515f6a7da74e026f05a80299f
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

if not exist ComfyUI-KJNodes\fonts\f910-shin-comic-2.04.otf (
	copy %~dp0f910-shin-comic-2.04\f910-shin-comic-2.04.otf ComfyUI-KJNodes\fonts\
)

@REM https://github.com/ltdrdata/ComfyUI-Manager
call :GITHUB_TAG_REQUIREMENTS ltdrdata ComfyUI-Manager main 3.31.4
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/kijai/ComfyUI-MMAudio
call :GITHUB_HASH_REQUIREMENTS kijai ComfyUI-MMAudio main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/1038lab/ComfyUI-RMBG
call :GITHUB_HASH_REQUIREMENTS 1038lab ComfyUI-RMBG main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/kijai/ComfyUI-segment-anything-2
call :GITHUB_HASH_REQUIREMENTS kijai ComfyUI-segment-anything-2 main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/SeanScripts/ComfyUI-Unload-Model
call :GITHUB_HASH_REQUIREMENTS SeanScripts ComfyUI-Unload-Model main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite
call :GITHUB_HASH_REQUIREMENTS Kosinkadink ComfyUI-VideoHelperSuite main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/kijai/ComfyUI-WanVideoWrapper
@REM 2025/07/22 70fcdff3c535d09eb1cfc92425728796433752c5
@REM 2025/07/23 838803d0536c0750cfc26d38b39f175dda9df52a
@REM 2025/07/24 d6425cab02d052e3d39732e56df7f7e6a52d4d50 要 patch
@REM 2025/07/26 34c2cc23a9b450c836f235b824a5f140e44a3501 lora key not loaded
call :GITHUB_HASH_REQUIREMENTS kijai ComfyUI-WanVideoWrapper main d6425cab02d052e3d39732e56df7f7e6a52d4d50
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM Patch 2025/07/25 から不要
echo %PS_CMD% -c %PS_CMD% -c "(gc ComfyUI-WanVideoWrapper/gguf/gguf.py) -replace 'lora_diffs = \[p\[1\]\.weights for p in patch\]', 'lora_diffs = [p[1][1] for p in patch]' | sc ComfyUI-WanVideoWrapper/gguf/gguf.py"
%PS_CMD% -c "(gc ComfyUI-WanVideoWrapper/gguf/gguf.py) -replace 'lora_diffs = \[p\[1\]\.weights for p in patch\]', 'lora_diffs = [p[1][1] for p in patch]' | sc ComfyUI-WanVideoWrapper/gguf/gguf.py"
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

xcopy /SQY ComfyUI-WanVideoWrapper\example_workflows\*.* ..\user\default\workflows\Kijai\

@REM https://github.com/raindrop313/ComfyUI-WanVideoStartEndFrames
@REM call :GITHUB_HASH_REQUIREMENTS raindrop313 ComfyUI-WanVideoStartEndFrames main
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/chengzeyi/Comfy-WaveSpeed
@REM call :GITHUB_HASH_REQUIREMENTS chengzeyi Comfy-WaveSpeed main
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/pythongosssss/ComfyUI-WD14-Tagger
@REM call :GITHUB_HASH_REQUIREMENTS pythongosssss ComfyUI-WD14-Tagger main
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/rgthree/rgthree-comfy
call :GITHUB_HASH_REQUIREMENTS rgthree rgthree-comfy main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/KohakuBlueleaf/z-tipo-extension
@REM call :GITHUB_HASH_REQUIREMENTS KohakuBlueleaf z-tipo-extension main
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\custom_nodes
exit /b 0


:MOVE_TO_BACKUP
set "SRC_DIR=%1"
if not exist %SRC_DIR% ( exit /b 0 )

if not exist ..\custom_nodes-backup\ (
	echo mkdir ..\custom_nodes-backup
	mkdir ..\custom_nodes-backup
)

set "DST_DIR=..\custom_nodes-backup\%~nx1"
if exist %DST_DIR%\ (
	echo rmdir /S /Q %DST_DIR%
    rmdir /S /Q %DST_DIR%
)

echo move /Y %SRC_DIR% %DST_DIR%
move /Y %SRC_DIR% %DST_DIR%
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


:GITHUB_TAG_REQUIREMENTS
set "GITHUB_AUTHOR=%1"
set "GITHUB_REPO=%2"
set "GITHUB_BRANCH=%3"
set "GITHUB_TAG=%4"

call %GITHUB_CLONE_OR_PULL_TAG% %GITHUB_AUTHOR% %GITHUB_REPO% %GITHUB_BRANCH% %GITHUB_TAG%
if %ERRORLEVEL% neq 0 ( exit /b 1 )

if exist %GITHUB_REPO%\requirements.txt (
	setlocal enabledelayedexpansion
	echo pip install -qq -r %GITHUB_REPO%\requirements.txt
	pip install -qq -r %GITHUB_REPO%\requirements.txt
	if !ERRORLEVEL! neq 0 ( pause & endlocal & exit /b 1 )
	endlocal
)
exit /b 0
