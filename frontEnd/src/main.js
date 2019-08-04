import Vue from 'vue'
import './plugins/vuetify'
import App from './App.vue'
import router from './router'

import axios from 'axios'
import VueAxios from 'vue-axios'
axios.defaults.headers.common = {
  'Content-Type': 'application/x-www-form-urlencoded',
  'Accept': 'application/json'
}
window.axios = axios

Vue.use(VueAxios)

Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')


