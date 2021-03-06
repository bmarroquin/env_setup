function Add-ToCurrentUserAllHostsProfile{

    param (
        $ContentToAdd
    )

    $profile_content = Get-Content $PROFILE.CurrentUserAllHosts
    $content_in_profile = $profile_content | ForEach-Object{$_ -eq $ContentToAdd}
    if($content_in_profile -notcontains $true){
        Add-Content -Path $PROFILE.CurrentUserAllHosts -Value $ContentToAdd -Encoding UTF8
    }
}

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module oh-my-posh -Scope CurrentUser -Force
Install-Module posh-git -Scope CurrentUser -Force

if (!(Test-Path -Path $PROFILE.CurrentUserAllHosts)){
  New-Item -ItemType File -Path $PROFILE.CurrentUserAllHosts -Force > $null
}

# copy to home dir so we don't lost the configuration if repo is deleted after install
Copy-Item "$PSScriptRoot\.plain.omp.json" -Destination "~"

Add-ToCurrentUserAllHostsProfile -ContentToAdd "Import-Module posh-git"
Add-ToCurrentUserAllHostsProfile -ContentToAdd "`$env:POSH_GIT_ENABLED = `$true"
Add-ToCurrentUserAllHostsProfile -ContentToAdd "Import-Module oh-my-posh"
Add-ToCurrentUserAllHostsProfile -ContentToAdd "Set-PoshPrompt -Theme  ~/.plain.omp.json"