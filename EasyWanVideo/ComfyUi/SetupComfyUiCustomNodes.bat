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
call :GITHUB_HASH_REQUIREMENTS christian-byrne audio-separation-nodes-comfyui master 31a4567726e035097cc2d1f767767908a6fda2ea
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/chrisgoringe/cg-use-everywhere
@REM VAE と seed でのエラー回避
call :GITHUB_HASH_REQUIREMENTS chrisgoringe cg-use-everywhere main 8017bc6b063f45db6b986d9fc8bb76bd3234b838
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/Fannovel16/comfyui_controlnet_aux
call :GITHUB_HASH_REQUIREMENTS Fannovel16 comfyui_controlnet_aux main 59b027e088c1c8facf7258f6e392d16d204b4d27
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/SeargeDP/ComfyUI_Searge_LLM
@REM call :GITHUB_HASH_REQUIREMENTS SeargeDP ComfyUI_Searge_LLM main
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/TTPlanetPig/Comfyui_TTP_Toolset
@REM call :GITHUB_HASH_REQUIREMENTS TTPlanetPig Comfyui_TTP_Toolset main
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/pythongosssss/ComfyUI-Custom-Scripts
call :GITHUB_HASH_REQUIREMENTS pythongosssss ComfyUI-Custom-Scripts main aac13aa7ce35b07d43633c3bbe654a38c00d74f5
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/kijai/ComfyUI-DepthAnythingV2
call :GITHUB_HASH_REQUIREMENTS kijai ComfyUI-DepthAnythingV2 main d505cbca99803fc63327b8305618a23e59a18b42
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/cubiq/ComfyUI_essentials
call :GITHUB_HASH_REQUIREMENTS cubiq ComfyUI_essentials main 9d9f4bedfc9f0321c19faf71855e228c93bd0dc9
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/kijai/ComfyUI-Florence2
call :GITHUB_HASH_REQUIREMENTS kijai ComfyUI-Florence2 main de485b65b3e1b9b887ab494afa236dff4bef9a7e
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/kijai/ComfyUI-FramePackWrapper
@REM https://github.com/nirvash/ComfyUI-FramePackWrapper
@REM 2025/04/29 fd2fcc2f1951982d4511f41ba644c3531718fe7b
call :GITHUB_HASH_REQUIREMENTS nirvash ComfyUI-FramePackWrapper main fd2fcc2f1951982d4511f41ba644c3531718fe7b
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

xcopy /SQY ComfyUI-FramePackWrapper\example_workflows\*.* ..\user\default\workflows\Kijai\

@REM https://github.com/Fannovel16/ComfyUI-Frame-Interpolation
call :GITHUB_HASH_REQUIREMENTS Fannovel16 ComfyUI-Frame-Interpolation main a969c01dbccd9e5510641be04eb51fe93f6bfc3d
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo pip install -qq -r ComfyUI-Frame-Interpolation\requirements-no-cupy.txt
pip install -qq -r ComfyUI-Frame-Interpolation\requirements-no-cupy.txt
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM https://github.com/city96/ComfyUI-GGUF
call :GITHUB_HASH_REQUIREMENTS city96 ComfyUI-GGUF main b3ec875a68d94b758914fd48d30571d953bb7a54
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
call :GITHUB_HASH_REQUIREMENTS kijai ComfyUI-MMAudio main 61f03a65a62dfeeb4687787104809f0e8028073a
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/1038lab/ComfyUI-RMBG
call :GITHUB_HASH_REQUIREMENTS 1038lab ComfyUI-RMBG main 4b2e8ce688386cca1257ae3aea94cb7c6bfca09f
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/kijai/ComfyUI-segment-anything-2
call :GITHUB_HASH_REQUIREMENTS kijai ComfyUI-segment-anything-2 main c59676b008a76237002926f684d0ca3a9b29ac54
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/SeanScripts/ComfyUI-Unload-Model
call :GITHUB_HASH_REQUIREMENTS SeanScripts ComfyUI-Unload-Model main ac5ffb4ed05546545ce7cf38e7b69b5152714eed
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite
@REM 2025/05/07 38fbe354b1eff10ef8066a580402ae3e33a59f5d
call :GITHUB_HASH_REQUIREMENTS Kosinkadink ComfyUI-VideoHelperSuite main 38fbe354b1eff10ef8066a580402ae3e33a59f5d
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/kijai/ComfyUI-WanVideoWrapper
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
call :GITHUB_HASH_REQUIREMENTS rgthree rgthree-comfy main 944d5353a1b0a668f40844018c3dc956b95a67d7
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
