@echo off
echo ------
echo 摆！
echo ------
echo Github：https://github.com/Mingming8886/Migrate-VRC-cache-locations
echo 注意:该操作会删除VRC的所有缓存
echo  之前加载过的物品都需重新加载
echo PS：如您是刚下载VRCHAT麻烦您启动一次再来操作
echo 是否操作？回车=确认，关闭程序=取消
PAUSE
net session >nul 2>&1
if %errorLevel% == 0 (
    rem Success: [日志] 确认管理员权限成功!
) else (
    echo [日志] 程序无管理员操作，取消所有操作!
    echo        操作已被取消!
    echo.
    echo [日志]:  请右键以管理员身份运行该脚本！
    echo.
    pause
    exit
)


set /p dpath=请输入目的路径（例如：D:\Temp ，工具会自动在你输入的路径下创建VRChat_Cache文件夹并建立软连接）:
echo 你输入的路径是 %dpath% 
pause
md %dpath%\VRChat_Cache
echo 复制文件......
echo=
xcopy %APPDATA%\..\LocalLow\VRChat %dpath%\VRChat_Cache /s /e /g /h
echo 删除原目录
echo=
rd /s /q %APPDATA%\..\LocalLow\VRChat
echo 创建软连接
echo=
mklink /d %APPDATA%\..\LocalLow\VRChat %dpath%\VRChat_Cache
echo 缓存转移完成
echo=
pause
