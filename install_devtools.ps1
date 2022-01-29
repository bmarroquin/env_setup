choco install vscode
refreshenv
code --install-extension rust-lang.rust
code --install-extension ms-vscode.powershell
code --install-extension ms-python.python

choco install git --params "/NoShellIntegration /Editor:VisualStudioCode"
choco install python3 --version=3.9.10 --params "/InstallDir:C:\ProgramData\python\python39"
choco install visualstudio2022community
choco install visualstudio2022-workload-nativedesktop
choco install visualstudio2022-workload-netweb
choco install visualstudio2022-workload-manageddesktop
refreshenv
curl.exe "https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/rustup-init.exe" --output rustup-init.exe
.\rustup-init.exe --profile default -y
rm .\rustup-init.exe

pip install pipx
pipx ensurepath
pipx install poetry
