/* src/App.vue */

<template>
  <div id="app" class="min-h-screen flex flex-col bg-white dark:bg-gray-900 text-black dark:text-white">
    <!-- 導航欄 -->
    <header class="bg-blue-600 dark:bg-blue-800 text-white shadow-lg">
      <nav class="container mx-auto p-4 flex justify-between items-center">
        <div class="text-xl font-bold">
          <router-link to="/" class="hover:underline">藥品儲位管理系統</router-link>
        </div>
        <ul class="flex space-x-4">
          <li><router-link to="/add-drug" class="hover:underline">新增藥品</router-link></li>
          <li><router-link to="/get-location" class="hover:underline">查詢藥品</router-link></li>
        </ul>
        <!-- 調用暗模式切換按鈕 -->
        <dark-mode-toggle />
      </nav>
    </header>

    <!-- 主內容區域 -->
    <main class="flex-grow container mx-auto p-4">
      <router-view></router-view>
    </main>
    
    <!-- 頁腳 -->
    <footer class="bg-gray-800 dark:bg-gray-950 text-white p-4">
      <div class="container mx-auto text-center">
        © 2024 藥品儲位管理系統. All rights reserved.
      </div>
    </footer>
  </div>
</template>

<script>
import DarkModeToggle from './components/DarkModeToggle.vue'

export default {
  name: 'App',
  components: {
    DarkModeToggle
  }
}
</script>

<style>
/* 全局樣式 */
#app {
  font-family: Inter, system-ui, Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

/* 白天模式文字顏色 */
.text-gray-700 {
  color: #4a5568;
}

/* 黑暗模式下的文字顏色 */
.dark .text-gray-700 {
  color: #d1d5db;
}

/* 按鈕樣式調整 */
.bg-blue-500 {
  background-color: #3b82f6;
}

.hover\\:bg-blue-700:hover {
  background-color: #2563eb;
}

.bg-green-500 {
  background-color: #10b981;
}

.hover\\:bg-green-700:hover {
  background-color: #059669;
}

/* 黑暗模式按鈕背景色 */
.dark .bg-blue-500 {
  background-color: #2563eb;
}

.dark .hover\\:bg-blue-700:hover {
  background-color: #1d4ed8;
}

.dark .bg-green-500 {
  background-color: #059669;
}

.dark .hover\\:bg-green-700:hover {
  background-color: #047857;
}

/* 黑暗模式頁腳背景色 */
.dark .bg-gray-950 {
  background-color: #111827;
}
</style>
