<template>
  <v-app>
    <v-content>
      <Header/>
    </v-content>
    <router-view></router-view>
    <v-content>
      <Footer/>
    </v-content>
  </v-app>
</template>

<script>

import Header from './components/Header.vue'
import Footer from './components/Footer.vue'

export default {
  name: 'App',
  components: {
    Header,
    Footer
  },
  data () {
    return {
  
    }
  }
}
</script>

<style lang="scss">

#app {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
.container {
  padding: 0;
  max-width: 1400px;
}

</style>

