@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE_HUB=%EASY_TOOLS%\Download\HuggingFaceHub.bat
set JUNCTION=%EASY_TOOLS%\Link\Junction.bat

pushd %~dp0

echo.
echo https://huggingface.co/nims1/my_test_model
echo call %HUGGING_FACE_HUB% %~n0\ nims1/my_test_model model test/**
call %HUGGING_FACE_HUB% %~n0\ nims1/my_test_model model test/**
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo call %JUNCTION% %~dp0..\..\..\Model\loras\nims1 .\%~n0\test
call %JUNCTION% %~dp0..\..\..\Model\loras\nims1 .\%~n0\test
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0
