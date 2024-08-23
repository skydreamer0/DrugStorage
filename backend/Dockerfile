# 使用官方 Node.js 基礎映像
FROM node:20

# 設定工作目錄
WORKDIR /app

# 複製 package.json 和 package-lock.json
COPY package*.json ./

# 安裝後端依賴
RUN npm install

# 複製後端的代碼
COPY . .

# 曝露應用程序運行的端口
EXPOSE 3000

# 啟動應用程序
CMD ["node", "src/server.js"]
