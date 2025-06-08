@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\EasyTools

call %EASY_TOOLS%\Civitai\Civitai_ApiKey.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0All\upscale_models.bat

call %~dp0clip\Kijai\open-clip-xlm-roberta-large-vit-huge-14_visual_fp16.bat

@REM call %~dp0diffusion_models\Kijai\Wan2_1-I2V-14B-480P_fp8_e4m3fn.bat
@REM call %~dp0diffusion_models\Kijai\Wan2_1-Fun1_1-InP-14B_fp8_e4m3fn.bat
@REM call %~dp0diffusion_models\Kijai\Wan2_1-SkyReelsV2-I2V-14B-540P_fp8_e4m3fn.bat
call %~dp0diffusion_models\Kijai\WanNsfwI2v-14B-480p_fp8_e4m3fn.bat
call %~dp0diffusion_models\Kijai\WanNsfwI2vEnd-14B-480p_fp8_e4m3fn.bat

@REM call %~dp0text_encoders\Kijai\umt5-xxl-enc-fp8_e4m3fn.bat
call %~dp0text_encoders\Native\umt5_xxl_fp8_e4m3fn_scaled.bat

call %~dp0ultralytics\segm\AnimeNsfwDetectionAll_v4.bat

call %~dp0vae\Kijai\Wan2_1_VAE_bf16.bat

call %~dp0loras\Bundle\NashikoneI2v720p.bat

call %~dp0loras\Fast\Wan21_CausVid_14B_T2V_lora_rank32.bat

@REM call %~dp0
call %~dp0loras\Nsfw\BulgePovMissionary_v11.bat
call %~dp0loras\Nsfw\Cowgirl_v13.bat
call %~dp0loras\Nsfw\deepthroat_blowjob_v10.bat
call %~dp0loras\Nsfw\DoubleSingleBlowjob_v10.bat
call %~dp0loras\Nsfw\nsfwsks_InAndOut_v014.bat
call %~dp0loras\Nsfw\PovMissionary_v11.bat
call %~dp0loras\Nsfw\tekoki_v028.bat
