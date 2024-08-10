@echo off
color 0A

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
pause
cd /d C:\myapp
npm install

echo.
echo ======================================
echo        應用程式設置完成！
echo ======================================

echo.
echo 正在啟動應用程式...
pm2 start server.js

echo.
echo ======================================
echo        所有步驟已完成！
echo ======================================
pause
