/* src/views\GetLocation.vue */
<!-- src/views/GetLocation.vue -->

<template>
  <div class="container mx-auto p-8">
    <h2 class="text-3xl font-bold mb-6">查詢藥品存放位置</h2>
    <form @submit.prevent="getLocation" class="space-y-4">
      <div>
        <label for="barcode" class="block text-lg font-medium text-gray-700 dark:text-gray-300">條碼</label>
        <input 
          v-model="barcode" 
          id="barcode" 
          type="text" 
          required 
          class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm 
                 focus:ring-indigo-500 focus:border-indigo-500 
                 dark:bg-gray-700 dark:text-gray-200 dark:border-gray-600 
                 dark:focus:ring-indigo-400 dark:focus:border-indigo-400">
      </div>
      <button type="submit" class="bg-green-600 text-white px-4 py-2 rounded-md hover:bg-green-700 transition">查詢</button>
    </form>
    <div v-if="location" class="mt-4">
      <h3 class="text-2xl font-semibold">存放位置:</h3>
      <p class="text-xl text-gray-800 dark:text-gray-200">{{ location }}</p>
    </div>
    <p v-if="message" class="mt-4 text-lg text-red-500">{{ message }}</p>
  </div>
</template>
<script>
import axios from 'axios'

export default {
  data() {
    return {
      barcode: '',
      location: '',
      message: ''
    }
  },
  methods: {
    getLocation() {
      axios.get(`http://localhost:3000/api/get_location/${this.barcode}`)
      .then(response => {
        this.location = response.data.location
        this.message = ''
      })
      .catch(error => {
        this.location = ''
        this.message = error.response.data.message || '查詢失敗，請再試一次。'
      })
    }
  }
}
</script>

<style scoped>
/* 自定義樣式區塊 */
</style>
