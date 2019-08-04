<template>
  <div class="main">
    <v-container>
      <v-layout  align-center justify-center row fill-height class="hero">
        <div class="heroContent">
          <h1>Quality care for your pet</h1>
          <v-btn large disabled color="rgba(30, 29, 41, .8)">
            <router-link to="/" class="herobtn">Coming soon</router-link>
          </v-btn>
        </div>
      </v-layout>
    </v-container>
  </div>
</template>

<style lang="scss">

.main {
  min-height: 880px;
  background-image: url("../assets/hero.jpg");
  background-position: center;
  background-size: cover;
  color: #D8C8CB;
  .heroContent {  
    text-align: center;
    h1 {
      font-size: 40px;
      color: #D8C8CB;   
    }
    .herobtn {
      text-decoration: none;
      color: rgb(158, 134, 157);
      text-transform: capitalize;
      font-size: 18px;
    }
  }
}
.layout.hero {
  height:880px;
}
</style>

<script>


  export default {

  }
</script>
