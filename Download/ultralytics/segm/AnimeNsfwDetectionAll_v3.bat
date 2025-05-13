@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set CIVITAI_MODEL_DOWNLOAD_UNZIP=%EASY_TOOLS%\Civitai\Civitai_ModelDownloadUnzip.bat
pushd %~dp0..\..\..\ComfyUI\models\ultralytics

@REM https://civitai.com/models/1313556?modelVersionId=1749813
call %CIVITAI_MODEL_DOWNLOAD_UNZIP% segm\ ntd11_anime_nsfw_segm_v3_all.pt 1313556 1749813
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\ultralytics
