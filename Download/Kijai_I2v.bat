@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\EasyTools

call %EASY_TOOLS%\Civitai\Civitai_ApiKey.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0All\loras.bat
call %~dp0All\ultralytics.bat
call %~dp0All\upscale_models.bat
call %~dp0All\vae_approx.bat

call %~dp0clip\Kijai\open-clip-xlm-roberta-large-vit-huge-14_visual_fp16.bat

call %~dp0diffusion_models\Kijai\Wan2_1-I2V-14B-480P_fp8_e4m3fn.bat
call %~dp0diffusion_models\Kijai\Wan2_1-I2V-14B-720P_fp8_e4m3fn.bat

call %~dp0diffusion_models\Kijai\Wan2_1-FunControl-1_3B_bf16.bat

call %~dp0text_encoders\Kijai\umt5-xxl-enc-fp8_e4m3fn.bat

call %~dp0vae\Kijai\Wan2_1_VAE_bf16.bat
