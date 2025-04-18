@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\clip_vision

@REM https://huggingface.co/Comfy-Org/sigclip_vision_384
call %HUGGING_FACE% Native\ sigclip_vision_patch14_384.safetensors Comfy-Org/sigclip_vision_384
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\clip_vision
