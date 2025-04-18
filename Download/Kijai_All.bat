@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\EasyTools
set RECURSIVE_BAT_CALL=%EASY_TOOLS%\Bat\RecursiveBatCall_NoErrorCheck.bat

call %EASY_TOOLS%\Civitai\Civitai_ApiKey.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0All\loras.bat
call %~dp0All\ultralytics.bat
call %~dp0All\upscale_models.bat
call %~dp0All\vae_approx.bat

call %RECURSIVE_BAT_CALL% %~dp0All\Kijai

call %~dp0Kijai_FramePack.bat
call %~dp0diffusion_models\Kijai\FramePack-I2V-HY_bf16.bat
call %~dp0text_encoders\Native\llava_llama3_fp16.bat
