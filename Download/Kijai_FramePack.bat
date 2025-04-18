@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\EasyTools

call %~dp0clip_vision\Native\sigclip_vision_patch14_384.bat

call %~dp0diffusion_models\Kijai\FramePack-I2V-HY_fp8_e4m3fn.bat
@REM call %~dp0diffusion_models\Kijai\FramePack-I2V-HY_bf16.bat

call %~dp0text_encoders\Native\clip_l.bat
call %~dp0text_encoders\Native\llava_llama3_fp8_scaled.bat
@REM call %~dp0text_encoders\Native\llava_llama3_fp16.bat

call %~dp0vae\Native\hunyuan_video_vae_bf16.bat
