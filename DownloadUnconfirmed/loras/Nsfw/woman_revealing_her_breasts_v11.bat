@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set CIVITAI_MODEL_DOWNLOAD=%EASY_TOOLS%\Civitai\Civitai_ModelDownload.bat
pushd %~dp0..\..\..\ComfyUI\models\loras

@REM https://civitai.com/models/1343093?modelVersionId=1541546
call %CIVITAI_MODEL_DOWNLOAD% Nsfw\ woman_revealing_her_breasts_v11.safetensors 1343093 1541546
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\loras
