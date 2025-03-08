@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\EasyTools

call %EASY_TOOLS%\Civitai\Civitai_ApiKey.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0All\loras.bat
call %~dp0All\upscale_models.bat

call %~dp0clip_vision\Native\clip_vision_h.bat

call %~dp0diffusion_models\Native\wan2.1-i2v-14b-480p-Q3_K_M.bat

call %~dp0text_encoders\Native\umt5_xxl_fp8_e4m3fn_scaled.bat

call %~dp0vae\Native\wan_2.1_vae.bat
