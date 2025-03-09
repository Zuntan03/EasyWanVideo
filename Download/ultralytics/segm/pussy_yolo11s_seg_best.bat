@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set CIVITAI_MODEL_DOWNLOAD_UNZIP=%EASY_TOOLS%\Civitai\Civitai_ModelDownloadUnzip.bat
pushd %~dp0..\..\..\ComfyUI\models\ultralytics

@REM https://civitai.com/models/150234?modelVersionId=1128067
call %CIVITAI_MODEL_DOWNLOAD_UNZIP% segm\ pussy_yolo11s_seg_best.pt 150234 1128067
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

if not exist segm\pussy_yolo11s_seg_best.pt (
	move /Y segm\Pussy-Adetailer\model\adetailer\*.pt segm\
	rmdir /S /Q segm\Pussy-Adetailer
)

popd rem %~dp0..\..\..\ComfyUI\models\ultralytics
