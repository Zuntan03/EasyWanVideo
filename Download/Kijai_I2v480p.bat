@echo off
chcp 65001 > NUL

call %~dp0All\upscale_models.bat

call %~dp0clip\Kijai\open-clip-xlm-roberta-large-vit-huge-14_fp16.bat
call %~dp0clip\Kijai\open-clip-xlm-roberta-large-vit-huge-14_visual_fp32.bat

call %~dp0diffusion_models\Kijai\Wan2_1-I2V-14B-480P_fp8_e5m2.bat
call %~dp0diffusion_models\Kijai\Wan2_1-I2V-14B-480P_fp8_e4m3fn.bat

call %~dp0text_encoders\Kijai\umt5-xxl-enc-fp8_e4m3fn.bat

call %~dp0vae\Kijai\Wan2_1_VAE_bf16.bat
