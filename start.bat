@echo off
color 0A

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
pause
cd /d C:\myapp
npm install

echo.
echo ======================================
echo        ���ε{���]�m�����I
echo ======================================

echo.
echo ���b�Ұ����ε{��...
pm2 start server.js

echo.
echo ======================================
echo        �Ҧ��B�J�w�����I
echo ======================================
pause
