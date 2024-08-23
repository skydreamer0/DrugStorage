@echo off
color 0A
title PM2 ���ε{���޲z�u��

echo ======================================
echo        �w�˩M�]�m���ε{��
echo ======================================

echo.
echo ���b�ˬd Node.js �M npm...
node -v >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Node.js ���w�ˡA�}�l�U��...
    powershell -Command "Start-BitsTransfer -Source https://nodejs.org/dist/v18.17.1/node-v18.17.1-x64.msi -Destination nodejs.msi"
    msiexec /i nodejs.msi /quiet /norestart
    del nodejs.msi
    echo Node.js �w�˧����I
) ELSE (
    echo Node.js �w�w�ˡA�~��U�@�B�C
)


echo.
echo ���b�ˬd MongoDB...
where mongod >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo MongoDB ���w�ˡA�}�l�U��...
    powershell -Command "Start-BitsTransfer -Source https://fastdl.mongodb.org/windows/mongodb-windows-x86_64-6.0.4-signed.msi -Destination mongodb.msi"
    msiexec /i mongodb.msi /quiet /norestart
    del mongodb.msi
    net start MongoDB
    echo MongoDB �w�˨ñҰʧ����I
) ELSE (
    echo MongoDB �w�w�ˡA�~��U�@�B�C
)

echo.
echo �]�m MongoDB ���t�αҰʮɦ۰ʱҰ�...
sc config MongoDB start= auto

echo.
echo ���b�w�����ε{���� npm �̿ඵ...

:: �w�ˮڥؿ����̿ඵ
npm install

:: �w�˫e�ݨ̿ඵ
cd frontend
npm install
cd ..

:: �w�˫�ݨ̿ඵ
cd backend
npm install
cd ..

echo.
echo ======================================
echo        ���ε{���]�m�����I
echo ======================================

:menu
cls
echo ======================================
echo        PM2 ���ε{���޲z�u��
echo ======================================
echo.
echo ��ܤ@�Ӿާ@�G
echo 1. �Ұ����ε{��
echo 2. �������ε{��
echo 3. �������ε{��
echo 4. �˵����Ϊ��A
echo 5. �h�X
echo.
set /p choice=�п�� [1-5]:

if "%choice%"=="1" goto start_app
if "%choice%"=="2" goto stop_app
if "%choice%"=="3" goto restart_app
if "%choice%"=="4" goto status_app
if "%choice%"=="5" goto exit

:start_app
cls
echo ======================================
echo        �Ұ����ε{��
echo ======================================
echo.
echo ���b�Ұ����ε{��...
pm2 start ecosystem.config.js
pause
goto menu

:stop_app
cls
echo ======================================
echo        �������ε{��
echo ======================================
echo.
echo ���b�������ε{��...
pm2 stop all
pause
goto menu

:restart_app
cls
echo ======================================
echo        �������ε{��
echo ======================================
echo.
echo ���b�������ε{��...
pm2 restart all
pause
goto menu

:status_app
cls
echo ======================================
echo        ���Ϊ��A
echo ======================================
echo.
pm2 list
pause
goto menu

:exit
cls
echo ======================================
echo        �w�h�X PM2 �޲z�u��
echo ======================================
pause
exit