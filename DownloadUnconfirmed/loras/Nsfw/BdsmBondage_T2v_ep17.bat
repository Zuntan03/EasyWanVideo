@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set CIVITAI_MODEL_DOWNLOAD=%EASY_TOOLS%\Civitai\Civitai_ModelDownload.bat
pushd %~dp0..\..\..\ComfyUI\models\loras

@REM https://civitai.com/models/1305489?modelVersionId=1473201
call %CIVITAI_MODEL_DOWNLOAD% Nsfw\ BdsmBondage_T2v_ep17.safetensors 1305489 1473201
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\loras
