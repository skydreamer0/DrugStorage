@echo off
title NPM �i���ƱҰʤ���
color 0A

:menu
cls
echo  ==========================================
echo  ||          NPM �Ұʺ޲z�u��           ||
echo  ==========================================
echo  ||  1. �Ұʫe��ݪA�� (npm start)     ||
echo  ||  2. ��W�Ұʫe�� (npm run dev)     ||
echo  ||  3. ��W�Ұʫ�� (npm run server)  ||
echo  ||  4. ����Ҧ��A��                   ||
echo  ||  5. �h�X                           ||
echo  ==========================================
echo.
set /p choice=�п�� [1-5]:

if "%choice%"=="1" goto start_all
if "%choice%"=="2" goto start_frontend
if "%choice%"=="3" goto start_backend
if "%choice%"=="4" goto stop_all
if "%choice%"=="5" goto exit

:start_all
cls
echo  ==========================================
echo  ||       ���b�Ұʫe��ݪA��...         ||
echo  ==========================================
npm start
pause
goto menu

:start_frontend
cls
echo  ==========================================
echo  ||        ���b�Ұʫe�ݪA��...          ||
echo  ==========================================
npm run dev
pause
goto menu

:start_backend
cls
echo  ==========================================
echo  ||        ���b�Ұʫ�ݪA��...          ||
echo  ==========================================
npm run server
pause
goto menu

:stop_all
cls
echo  ==========================================
echo  ||      ����Ҧ��A�� (Ctrl+C)          ||
echo  ==========================================
pause
goto menu

:exit
cls
echo  ==========================================
echo  ||         �P�¨ϥΡA�A���I            ||
echo  ==========================================
pause
exit
