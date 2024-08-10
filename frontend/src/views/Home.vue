/* src/views\Home.vue */

<template>
  <div class="min-h-screen flex flex-col">
    

    <!-- 主內容 -->
    <main class="flex-grow container mx-auto p-8 text-center">
      <h1 class="text-4xl font-bold mb-4">歡迎使用藥品儲位管理系統</h1>
      <p class="text-lg text-gray-700 mb-8">快速且有效地管理藥品的存放位置，讓工作更輕鬆。</p>

      <!-- 功能入口 -->
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <router-link to="/add-drug" class="p-6 bg-blue-500 text-white rounded-lg shadow-md hover:bg-blue-700 transition">
          <h2 class="text-2xl font-semibold">新增藥品存放位置</h2>
          <p class="mt-2">通過條碼迅速建立藥品的存放位置檔案。</p>
        </router-link>
        <router-link to="/get-location" class="p-6 bg-green-500 text-white rounded-lg shadow-md hover:bg-green-700 transition">
          <h2 class="text-2xl font-semibold">查詢藥品存放位置</h2>
          <p class="mt-2">根據條碼查詢藥品的存放位置。</p>
        </router-link>
      </div>
    </main>

   
  </div>
</template>

<script>
export default {
  name: 'Home',
}
</script>

<style scoped>
/* 這裡可以放自定義的樣式 */
</style>
