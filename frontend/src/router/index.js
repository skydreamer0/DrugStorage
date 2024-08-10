// 導入 Vue Router 相關函數
import { createRouter, createWebHistory } from 'vue-router'

// 導入頁面組件
import Home from '../views/Home.vue'
import AddDrug from '../views/AddDrug.vue'
import GetLocation from '../views/GetLocation.vue'

// 定義路由配置
const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
  },
  {
    path: '/add-drug',
    name: 'AddDrug',
    component: AddDrug,
  },
  {
    path: '/get-location',
    name: 'GetLocation',
    component: GetLocation,
  }
  // 可以在此處添加更多路由...
]

// 創建路由實例
const router = createRouter({
  // 使用 HTML5 歷史模式
  history: createWebHistory(),
  // 使用上面定義的路由配置
  routes,
})

// 導出路由實例，以便在主應用程式中使用
export default router
