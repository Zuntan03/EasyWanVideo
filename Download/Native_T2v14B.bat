@echo off
chcp 65001 > NUL

call %~dp0All\upscale_models.bat

call %~dp0diffusion_models\Native\wan2.1-t2v-14b-Q3_K_M.bat

call %~dp0text_encoders\Native\umt5_xxl_fp8_e4m3fn_scaled.bat

call %~dp0vae\Native\wan_2.1_vae.bat
