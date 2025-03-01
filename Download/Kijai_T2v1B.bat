@echo off
chcp 65001 > NUL

call %~dp0text_encoders\Kijai\umt5-xxl-enc-fp8_e4m3fn.bat

call %~dp0vae\Kijai\Wan2_1_VAE_bf16.bat

call %~dp0diffusion_models\Kijai\Wan2_1-T2V-1_3B_fp8_e4m3fn.bat
