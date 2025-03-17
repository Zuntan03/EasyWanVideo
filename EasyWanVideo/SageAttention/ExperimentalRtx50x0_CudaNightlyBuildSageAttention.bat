@echo off
chcp 65001 > NUL
set CURL_CMD=C:\Windows\System32\curl.exe -kL
set EASY_TOOLS=%~dp0..\..\EasyTools
set GITHUB_CLONE_OR_PULL_HASH=%EASY_TOOLS%\Git\GitHub_CloneOrPull_Hash.bat
set PYTHON_ACTIVATE=%EASY_TOOLS%\Python\Python_Activate.bat
set EMBEDDABLE_PYTHON=%EASY_TOOLS%\Python\env\python310

echo "vs_buildtools.exe と cuda_12.8.0_windows_network.exe のインストールを先に済ませてください。"
echo "インストールしていない場合は、このウィンドウを閉じてください。"
echo.
echo "UninstallSageAttention.bat で SageAttention と Triton をアンインストールして、インストール前に戻せます。"
echo "UninstallPytorch.bat で PyTorch をアンインストールして、EasyWanVideo\Setup.bat で再インストールできます。"
pause

pushd %~dp0..\..\ComfyUI

call %PYTHON_ACTIVATE%
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )
popd rem %~dp0..\..\ComfyUI

pushd %~dp0

echo pip uninstall -qq -y torch torchvision torchaudio sageattention triton
pip uninstall -qq -y torch torchvision torchaudio sageattention triton
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu128
pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu128
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo pip install -U --pre triton-windows
pip install -U --pre triton-windows
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM https://github.com/thu-ml/SageAttention
call %GITHUB_CLONE_OR_PULL_HASH% thu-ml SageAttention main
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM cl.exe 用にパスを通す
if exist %EMBEDDABLE_PYTHON%\ (
	set "INCLUDE=%INCLUDE%;%EMBEDDABLE_PYTHON%\include"
	set "LIB=%LIB%;%EMBEDDABLE_PYTHON%\libs"
)

popd rem %~dp0
pushd %~dp0SageAttention

echo python setup.py install
python setup.py install
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0SageAttention
