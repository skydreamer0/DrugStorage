<template>
  <div class="container mx-auto p-8">
    <h2 class="text-3xl font-bold mb-6">新增藥品存放位置</h2>
    <form @submit.prevent="addDrugs" class="space-y-4">
      <div>
        <label for="barcode" class="block text-lg font-medium text-gray-700 dark:text-gray-300">條碼</label>
        <input 
          v-model="currentBarcode" 
          id="barcode" 
          type="text" 
          required 
          class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm 
                 focus:ring-indigo-500 focus:border-indigo-500 
                 dark:bg-gray-700 dark:text-gray-200 dark:border-gray-600 
                 dark:focus:ring-indigo-400 dark:focus:border-indigo-400">
      </div>
      <div>
        <label for="location" class="block text-lg font-medium text-gray-700 dark:text-gray-300">存放位置</label>
        <input 
          v-model="location" 
          id="location" 
          type="text" 
          required 
          class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm 
                 focus:ring-indigo-500 focus:border-indigo-500 
                 dark:bg-gray-700 dark:text-gray-200 dark:border-gray-600 
                 dark:focus:ring-indigo-400 dark:focus:border-indigo-400">
      </div>
      <div>
        <label class="inline-flex items-center">
          <input type="checkbox" v-model="fixedLocation" class="form-checkbox">
          <span class="ml-2">固定存放位置</span>
        </label>
      </div>
      <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700 transition">提交</button>
    </form>
    <p v-if="message" class="mt-4 text-lg" :class="{'text-green-500': !isError, 'text-red-500': isError}">{{ message }}</p>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      currentBarcode: '',
      location: '',
      message: '',
      isError: false,
      fixedLocation: false
    }
  },
  
  methods: {
    addDrugs() {
      if (this.currentBarcode.trim() === '') {
        this.message = '請輸入條碼'
        this.isError = true
        return
      }

      if (this.location.trim() === '') {
        this.message = '請輸入存放位置'
        this.isError = true
        return
      }

      const drug = {
        barcode: this.currentBarcode,
        location: this.location
      }

      axios.post('http://localhost:3000/api/add_drugs', { drug })
        .then(() => {
          this.message = '藥品存放位置已成功新增'
          this.isError = false
          this.currentBarcode = ''
          if (!this.fixedLocation) {
            this.location = ''
          }
        })
        .catch((error) => {
          console.error('提交藥品時發生錯誤:', error.response ? error.response.data : error.message)
          this.message = '提交失敗，請再試一次。'
          this.isError = true
        })
    }
  }
}
</script>

<style scoped>
/* 自定義樣式區塊 */
</style>
