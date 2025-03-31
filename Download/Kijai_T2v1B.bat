@echo off
chcp 65001 > NUL

call %~dp0All\upscale_models.bat
call %~dp0All\vae_approx.bat

call %~dp0diffusion_models\Kijai\Wan2_1-T2V-1_3B_fp8_e4m3fn.bat

call %~dp0diffusion_models\Native\wan2.1_t2v_1.3B_fp16.bat

call %~dp0loras\T2v1B\T2v1B_Tile_v10.bat

call %~dp0text_encoders\Kijai\umt5-xxl-enc-fp8_e4m3fn.bat

call %~dp0vae\Kijai\Wan2_1_VAE_bf16.bat
