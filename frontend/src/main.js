import { createApp } from 'vue'
import App from './App.vue'
import './assets/styles.css'  // 引入 Tailwind CSS
import router from './router'
import pinia from './store'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'

const app = createApp(App)

// 使用路由、Pinia 和 ElementPlus
app.use(router)
app.use(pinia)
app.use(ElementPlus)

// 挂载应用
app.mount('#app')
