@echo off
chcp 65001 > NUL

call %~dp0All\upscale_models.bat

call %~dp0diffusion_models\Kijai\Wan2_1-T2V-1_3B_fp8_e4m3fn.bat

call %~dp0text_encoders\Native\umt5_xxl_fp8_e4m3fn_scaled.bat

call %~dp0vae\Native\wan_2.1_vae.bat
