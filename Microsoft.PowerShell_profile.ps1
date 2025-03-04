## 为powershell更新配置

. $env:USERPROFILE/.config/powershell/user_profile.ps1

## 傻逼omp
#oh-my-posh init pwsh | Invoke-Expression

#oh-my-posh init pwsh --config 'D:\Applications\Scoop\apps\oh-my-posh\current\themes\tokyonight_storm.omp.json' | Invoke-Expression

#Import-Module Terminal-Icons

# 一言
# 使用一言网 API 获取一句话
<#
Write-host "喜欢就买,不行就分;多喝热水,重启电脑!"  -ForegroundColor Yellow
function Get-Hitokoto {
    $apiUrl = 'https://v1.hitokoto.cn/'
    $response = Invoke-RestMethod -Uri $apiUrl -Method Get

    return $response.hitokoto
}

# 获取一言并显示
$hitokoto = Get-Hitokoto

Write-Host "Mufenxy: $hitokoto" -ForegroundColor Green

# 输出一个空行
Write-Host ""
#>

<#
# 设置保存一言和标识符的文件路径
$storageFilePath = Join-Path $env:USERPROFILE 'hitokoto_storage.txt'

# 定义获取一言的函数
function Get-Hitokoto {
    $apiUrl = 'https://v1.hitokoto.cn/'
    $response = Invoke-RestMethod -Uri $apiUrl -Method Get
    return $response.hitokoto
}

# 检查文件是否存在
if (Test-Path $storageFilePath) {
    # 如果文件存在，读取保存的标识符和句子
    $storedData = Get-Content $storageFilePath | ConvertFrom-Json
    $storedIdentifier = $storedData.Identifier
    $storedHitokoto = $storedData.Hitokoto
} else {
    # 如果文件不存在，生成新的标识符
    $storedIdentifier = [Guid]::NewGuid().ToString()
    $storedHitokoto = Get-Hitokoto

    # 保存标识符和句子到文件
    $dataToStore = @{
        Identifier = $storedIdentifier
        Hitokoto = $storedHitokoto
    } | ConvertTo-Json
    $dataToStore | Out-File -FilePath $storageFilePath -Force
}

# 显示保存的句子
Write-Host ""
Write-Host "Mufenxy: $storedHitokoto" -ForegroundColor Green
Write-Host ""
#>

Write-Host "---"
Write-Host ""
Write-Host "🤖 多喝热水,重启电脑!"
# Display-Hitokoto.ps1


# 设置保存一言和标识符的文件路径
$storageFilePath = Join-Path $env:USERPROFILE 'hitokoto_storage.txt'

# 检查文件是否存在
if (Test-Path $storageFilePath) {
    # 如果文件存在，读取保存的标识符和句子
    $storedData = Get-Content $storageFilePath | ConvertFrom-Json
    $storedIdentifier = $storedData.Identifier
    $storedHitokoto = $storedData.Hitokoto
} else {
    Write-Host "No stored Hitokoto found." -ForegroundColor Yellow
    return
}

Write-Host "Mufenxy: $storedHitokoto" -ForegroundColor Green
Write-host ""
Write-Host "---"

function Update-Hitokoto {
    $scriptPath = 'C:\Users\genius\Update-Hitokoto.ps1'
    & $scriptPath
}

Set-Alias -Name yiyan -Value Update-Hitokoto

# starship
Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "~/.config/starship1.toml"
# 默认配置

#$Env:http_proxy="http://127.0.0.1:10809";$Env:https_proxy="http://127.0.0.1:10809"
$Env:http_proxy="http://127.0.0.1:7897";$Env:https_proxy="http://127.0.0.1:7897"
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewstyle Listview
