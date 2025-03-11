@echo off
chcp 65001 > NUL

set "TRITON_CACHE=C:\Users\%USERNAME%\.triton\cache"
set "TORCH_INDUCTOR_TEMP=C:\Users\%USERNAME%\AppData\Local\Temp\torchinductor_%USERNAME%"

echo "以下の triton のキャッシュフォルダを削除します。よろしいですか？ [y/n]（空欄なら n）"
echo "%TRITON_CACHE%"
echo "%TORCH_INDUCTOR_TEMP%"
set /p DELETE_CACHE_YES_OR_NO=

if /i not "%DELETE_CACHE_YES_OR_NO%" == "y" ( exit /b 0 )

if not exist "%TRITON_CACHE%" ( goto :TRITON_CACHE_NOT_FOUND )
echo rmdir /S /Q "%TRITON_CACHE%"
rmdir /S /Q "%TRITON_CACHE%"
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )
:TRITON_CACHE_NOT_FOUND

if not exist "%TORCH_INDUCTOR_TEMP%" ( goto :TORCH_INDUCTOR_TEMP_NOT_FOUND )
echo rmdir /S /Q "%TORCH_INDUCTOR_TEMP%"
rmdir /S /Q "%TORCH_INDUCTOR_TEMP%"
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )
:TORCH_INDUCTOR_TEMP_NOT_FOUND
