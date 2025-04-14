@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\ComfyUI\models\mmaudio

if exist nvidia\bigvgan_v2_44khz_128band_512x\ ( popd & exit /b 0 )
mkdir nvidia\bigvgan_v2_44khz_128band_512x

popd rem %~dp0..\..\ComfyUI\models\mmaudio
pushd %~dp0..\..\ComfyUI\models\mmaudio\nvidia\bigvgan_v2_44khz_128band_512x

@REM https://huggingface.co/nvidia/bigvgan_v2_44khz_128band_512x

call %HUGGING_FACE% .\ bigvgan_generator.pt nvidia/bigvgan_v2_44khz_128band_512x
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% .\ bigvgan_discriminator_optimizer.pt nvidia/bigvgan_v2_44khz_128band_512x
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% .\ config.json nvidia/bigvgan_v2_44khz_128band_512x
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models\mmaudio\nvidia\bigvgan_v2_44khz_128band_512x
