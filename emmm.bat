@echo off
title 自定义VRC缓存目录(禁止倒卖
echo ------
echo 摆！
echo ------
echo 作者博客：https://qmq.me
echo Github：https://github.com/Mingming8886/Migrate-VRC-cache-locations
echo 注意:该操作可能会删除VRC的所有缓存
echo 之前加载过的物品都需重新加载
echo PS：如您是刚下载VRCHAT麻烦您启动一次再来操作
echo 版本号V: 1.5
tasklist | find /i "VRChat.exe" >nul 2>nul && echo [日志] 检测到您的VRChat正在运行，请关闭再来操作！ || echo [日志] 未检测到你的VRChat请继续操作
PAUSE
net session >nul 2>&1
if %errorLevel% == 0 (
    rem Success: [日志] 确认管理员权限成功!
) else (
cls
    echo [日志] 无管理员操作权限，已取消操作(错误代码001
    echo [日志] 已取消运行
    echo.
    echo [日志] 解决方案：请右键以管理员身份运行该脚本！
    echo.
    pause
    exit
)

cls
set /p dpath=请输入目的路径（例如：E:\VRChat ，程序会自动在你输入的路径下创建VRChat_Cache文件夹并建立软连接）:
echo 你输入的路径是 %dpath% 
pause
md %dpath%\VRChat_Cache
echo [日志] 复制文件
echo=
xcopy %APPDATA%\..\LocalLow\VRChat %dpath%\VRChat_Cache /s /e /g /h
echo [日志] 删除原目录
echo=
rd /s /q %APPDATA%\..\LocalLow\VRChat
echo [日志] 创建软连接
echo=
mklink /d %APPDATA%\..\LocalLow\VRChat %dpath%\VRChat_Cache
echo [日志] 缓存转移完成
echo
pause
