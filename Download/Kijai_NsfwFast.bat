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

call %~dp0diffusion_models\Native\Wan21-BothI2v-FastMix2-14B-Q3_K_M.bat
call %~dp0diffusion_models\Native\Wan21-BothI2vAnisora-FastMix2-14B-Q3_K_M.bat
call %~dp0diffusion_models\Native\Wan21-VACE-14B-FastMix-Q4_K_M.bat

call %~dp0text_encoders\Native\umt5_xxl_fp8_e4m3fn_scaled.bat

call %~dp0ultralytics\segm\AnimeNsfwDetectionAll_v4.bat

call %~dp0vae\Kijai\Wan2_1_VAE_bf16.bat

call %~dp0loras\Bundle\Nashikone.bat
call %~dp0loras\Bundle\NashikoneI2v720p.bat

call %~dp0loras\Fast\Wan21_PusaV1_LoRA_14B_rank512_bf16.bat

@REM call %~dp0loras\Fast\Wan21_AccVid_I2V_480P_14B_lora_rank32_fp16.bat
@REM call %~dp0loras\Fast\Wan21_AccVid_T2V_14B_lora_rank32_fp16.bat
@REM call %~dp0loras\Fast\Wan21_CausVid_14B_T2V_lora_rank32.bat
@REM call %~dp0loras\Fast\Wan21_CausVid_14B_T2V_lora_rank32_v1_5_no_first_block.bat
@REM call %~dp0loras\Fast\Wan21_CausVid_14B_T2V_lora_rank32_v2.bat
@REM call %~dp0loras\Fast\Wan21_I2V_14B_FusionX_LoRA.bat
@REM call %~dp0loras\Fast\Wan21_T2V_14B_FusionX_LoRA.bat
@REM call %~dp0loras\Fast\Wan21_T2V_14B_lightx2v_cfg_step_distill_lora_rank32.bat

@REM call %~dp0
call %~dp0loras\Motion\dabaichui_v10.bat
call %~dp0loras\Nsfw\BetterAnimeSexFaces_v40.bat
call %~dp0loras\Nsfw\nsfwsks_InAndOut_v014.bat
call %~dp0loras\Nsfw\her_breasts_are_bouncing_v01.bat
call %~dp0loras\Nsfw\BounceOfPleasure_v10.bat
call %~dp0loras\Nsfw\PovMissionary_v11.bat
call %~dp0loras\Nsfw\BulgePovMissionary_v11.bat
call %~dp0loras\Nsfw\c0wg1rl_v10.bat
call %~dp0loras\Nsfw\AssertiveCowgirl_v10.bat
call %~dp0loras\Nsfw\tribadism.bat
call %~dp0loras\Nsfw\DoubleSingleBlowjob_v10.bat
call %~dp0loras\Nsfw\deepthroat_blowjob_v10.bat
call %~dp0loras\Nsfw\tekoki_v028.bat
call %~dp0loras\Nsfw\shoejob_v10.bat
call %~dp0loras\Motion\l1v3w4llp4p3r_720p.bat
call %~dp0loras\Motion\GlassFloor_v09.bat
call %~dp0loras\Nsfw\DildoRide_v20.bat
call %~dp0loras\Nsfw\AnimeCumshotAesthetics_v10.bat
call %~dp0loras\Nsfw\AnimeCumshotEmotion_v11.bat
