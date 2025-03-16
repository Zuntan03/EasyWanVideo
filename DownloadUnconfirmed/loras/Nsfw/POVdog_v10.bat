@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set CIVITAI_MODEL_DOWNLOAD=%EASY_TOOLS%\Civitai\Civitai_ModelDownload.bat
pushd %~dp0..\..\..\ComfyUI\models\loras

@REM https://civitai.com/models/1361228?modelVersionId=1537782
call %CIVITAI_MODEL_DOWNLOAD% Nsfw\ POVdog_v10.safetensors 1361228 1537782
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\loras
