#!/bin/bash

echo "請選擇操作:"
echo "1. 啟動所有服務"
echo "2. 停止所有服務"
echo "3. 重啟所有服務"
echo "4. 查看服務狀態"
echo "5. 查看後端日誌"
echo "6. 查看前端日誌"
echo "請輸入選擇的數字:"

read choice

case $choice in
    1)
        echo "正在啟動所有服務..."
        pm2 start ecosystem.config.js
        ;;
    2)
        echo "正在停止所有服務..."
        pm2 stop all
        ;;
    3)
        echo "正在重啟所有服務..."
        pm2 restart all
        ;;
    4)
        echo "查看服務狀態..."
        pm2 list
        ;;
    5)
        echo "查看後端日誌..."
        pm2 logs backend
        ;;
    6)
        echo "查看前端日誌..."
        pm2 logs frontend
        ;;
    7)
        echo "刪除所有服務..."
        pm2 delete all
        ;;
    *)
        echo "無效的選擇，請輸入1到7之間的數字。"
        ;;
esac