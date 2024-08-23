# 使用官方 Node.js 基礎映像來構建前端
FROM node:14 AS  build-stage

# 設定工作目錄
WORKDIR /app

# 複製 package.json 和 package-lock.json
COPY package*.json ./

# 安裝前端依賴
RUN npm install

# 複製前端的代碼
COPY . .

# 構建前端應用
RUN npm run build

# 使用 Nginx 來提供靜態文件
FROM nginx:stable-alpine AS  production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
