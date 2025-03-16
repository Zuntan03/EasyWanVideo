@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set CIVITAI_MODEL_DOWNLOAD=%EASY_TOOLS%\Civitai\Civitai_ModelDownload.bat
pushd %~dp0..\..\..\ComfyUI\models\loras

@REM https://civitai.com/models/1335738?modelVersionId=1514116
call %CIVITAI_MODEL_DOWNLOAD% Nsfw720p\ TittyDrop_v10_14b.safetensors 1335738 1514116
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\loras
