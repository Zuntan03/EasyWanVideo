@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\EasyTools

call %EASY_TOOLS%\Civitai\Civitai_ApiKey.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0upscale_models\2x-AnimeSharpV4_Fast_RCAN_PU.bat
call %~dp0upscale_models\2x-AnimeSharpV4_RCAN.bat
call %~dp0upscale_models\4x-AnimeSharp.bat
call %~dp0upscale_models\4x-UltraSharpV2_Lite.bat
call %~dp0upscale_models\4x-UltraSharpV2.bat

call %~dp0clip\Kijai\open-clip-xlm-roberta-large-vit-huge-14_visual_fp16.bat

call %~dp0diffusion_models\Kijai\I2v-WanSkyRel07-14B-fp8_e4m3fn.bat
call %~dp0diffusion_models\Kijai\Wan2_1-T2V-14B_fp8_e4m3fn.bat
call %~dp0diffusion_models\Kijai\Wan2_1-VACE_module_14B_fp8_e4m3fn.bat

call %~dp0text_encoders\Native\umt5_xxl_fp8_e4m3fn_scaled.bat

call %~dp0ultralytics\segm\AnimeNsfwDetectionAll_v4.bat

call %~dp0vae\Kijai\Wan2_1_VAE_bf16.bat

call %~dp0loras\Bundle\Nashikone.bat
call %~dp0loras\Bundle\NashikoneI2v720p.bat

@REM CausVid v1.5 のみ不使用
call %~dp0loras\Fast\Wan21_AccVid_T2V_14B_lora_rank32_fp16.bat
call %~dp0loras\Fast\Wan21_CausVid_14B_T2V_lora_rank32.bat
call %~dp0loras/Fast/Wan21_CausVid_14B_T2V_lora_rank32_v1_5_no_first_block.bat
call %~dp0loras/Fast/Wan21_CausVid_14B_T2V_lora_rank32_v2.bat

@REM call %~dp0
call %~dp0loras\Nsfw\nsfwsks_InAndOut_v014.bat
call %~dp0loras\Nsfw\her_breasts_are_bouncing_v01.bat
call %~dp0loras\Nsfw\BounceOfPleasure_v10.bat
call %~dp0loras\Nsfw\PovMissionary_v11.bat
call %~dp0loras\Nsfw\BulgePovMissionary_v11.bat
call %~dp0loras\Nsfw\c0wg1rl_v10.bat
call %~dp0\loras\Nsfw\AssertiveCowgirl_v10.bat
call %~dp0loras\Nsfw\tribadism.bat
call %~dp0loras\Nsfw\DoubleSingleBlowjob_v10.bat
call %~dp0loras\Nsfw\deepthroat_blowjob_v10.bat
call %~dp0loras\Nsfw\tekoki_v028.bat
call %~dp0loras\Nsfw\shoejob_v10.bat
call %~dp0loras\Motion\l1v3w4llp4p3r_720p.bat
