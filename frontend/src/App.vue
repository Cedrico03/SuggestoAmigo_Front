<template>
  <div id="app">
    <img id= "logoImg" src="./assets/AmigoLogo.png" alt="Logo" width="200" @click="setActivePage('signup')">    
    <LoginPage v-if="activePage == 'login'" @changePageEvent="setActivePage" style="margin-top: -50px"/> <!-- margin top is voor logo niet te hoog te plaatsen -->
    <SignUpPage v-if="activePage == 'signup'" style="margin-top: -50px"/>
    <VerificationPage v-if="activePage == 'verification'" @changePageEvent="setActivePage" style="margin-top: -50px"/>

  </div>
</template>

<script>
import LoginPage from './pages/loginPage.vue'
import SignUpPage from './pages/signupPage.vue'
import VerificationPage from './pages/verificationPage.vue'

export default {
  name: 'App',
  components: {
    LoginPage,
    SignUpPage,
    VerificationPage
  },
  data() {
    return {
      // activePage: "login"
      activePage: "verification"
    }
  },
  mounted() {

  },
  methods: {
    setActivePage(page) {
      this.activePage = page;
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  /* margin-top: 60px; */
  /* color: #2c3e50; */
  color: black;
}
body {
  background-color: #05668D;
}
#logoImg{
  margin: 50px;
}

/* https://coolors.co/palette/05668d-028090-00a896-02c39a-f0f3bd */
</style>

