@echo off
color 0A
title PM2 應用程式管理工具

echo ======================================
echo        安裝和設置應用程式
echo ======================================

echo.
echo 正在檢查 Node.js 和 npm...
node -v >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Node.js 未安裝，開始下載...
    powershell -Command "Start-BitsTransfer -Source https://nodejs.org/dist/v18.17.1/node-v18.17.1-x64.msi -Destination nodejs.msi"
    msiexec /i nodejs.msi /quiet /norestart
    del nodejs.msi
    echo Node.js 安裝完成！
) ELSE (
    echo Node.js 已安裝，繼續下一步。
)


echo.
echo 正在檢查 MongoDB...
where mongod >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo MongoDB 未安裝，開始下載...
    powershell -Command "Start-BitsTransfer -Source https://fastdl.mongodb.org/windows/mongodb-windows-x86_64-6.0.4-signed.msi -Destination mongodb.msi"
    msiexec /i mongodb.msi /quiet /norestart
    del mongodb.msi
    net start MongoDB
    echo MongoDB 安裝並啟動完成！
) ELSE (
    echo MongoDB 已安裝，繼續下一步。
)

echo.
echo 設置 MongoDB 為系統啟動時自動啟動...
sc config MongoDB start= auto

echo.
echo 正在安裝應用程式的 npm 依賴項...

:: 安裝根目錄的依賴項
npm install

:: 安裝前端依賴項
cd frontend
npm install
cd ..

:: 安裝後端依賴項
cd backend
npm install
cd ..

echo.
echo ======================================
echo        應用程式設置完成！
echo ======================================

:menu
cls
echo ======================================
echo        PM2 應用程式管理工具
echo ======================================
echo.
echo 選擇一個操作：
echo 1. 啟動應用程式
echo 2. 停止應用程式
echo 3. 重啟應用程式
echo 4. 檢視應用狀態
echo 5. 退出
echo.
set /p choice=請選擇 [1-5]:

if "%choice%"=="1" goto start_app
if "%choice%"=="2" goto stop_app
if "%choice%"=="3" goto restart_app
if "%choice%"=="4" goto status_app
if "%choice%"=="5" goto exit

:start_app
cls
echo ======================================
echo        啟動應用程式
echo ======================================
echo.
echo 正在啟動應用程式...
pm2 start ecosystem.config.js
pause
goto menu

:stop_app
cls
echo ======================================
echo        停止應用程式
echo ======================================
echo.
echo 正在停止應用程式...
pm2 stop all
pause
goto menu

:restart_app
cls
echo ======================================
echo        重啟應用程式
echo ======================================
echo.
echo 正在重啟應用程式...
pm2 restart all
pause
goto menu

:status_app
cls
echo ======================================
echo        應用狀態
echo ======================================
echo.
pm2 list
pause
goto menu

:exit
cls
echo ======================================
echo        已退出 PM2 管理工具
echo ======================================
pause
exit