@echo off
color 0A
title PM2 ���ε{���޲z�u��

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
echo.
set /p choice=�п�� [1-4]:

if "%choice%"=="1" goto start_app
if "%choice%"=="2" goto stop_app
if "%choice%"=="3" goto restart_app
if "%choice%"=="4" goto status_app

:start_app
cls
echo ======================================
echo        �Ұ����ε{��
echo ======================================
echo.
echo ���b�Ұ����ε{��...
pm2 start ecosystem.config.js
pause

:stop_app
cls
echo ======================================
echo        �������ε{��
echo ======================================
echo.
echo ���b�������ε{��...
pm2 stop all
pause

:restart_app
cls
echo ======================================
echo        �������ε{��
echo ======================================
echo.
echo ���b�������ε{��...
pm2 restart all
pause

:status_app
cls
echo ======================================
echo        ���Ϊ��A
echo ======================================
echo.
pm2 list
pause
