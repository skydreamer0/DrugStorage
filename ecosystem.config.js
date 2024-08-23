module.exports = {
    apps: [
      {
        name: "backend",        // 你的後端服務名稱
        script: "backend/src/server.js", // 啟動後端的腳本
        watch: true,            // 監控檔案變更，自動重啟
        env: {
          NODE_ENV: "development",
        },
        env_production: {
          NODE_ENV: "production",
        }
      },
      {
        name: "frontend",       // 你的前端服務名稱
        script: "npm",          // 指定要執行的命令為 npm
        args: "run dev --prefix frontend", // 傳遞的參數
        interpreter: "none",    // 告訴 PM2 不需要使用 Node.js 來解釋這個命令
        watch: true
      }
    ]
  };
