<template>
  <div id="app">
    <!-- <HelloWorld msg="Welcome to Your Vue.js App"/> -->
    <LoginPage v-if="activePage == 'login'" @signupEvent="setActivePage"/>
    <SignUpPage v-if="activePage == 'signup'"/>
    <VerificationPage v-if="activePage == 'verification'"/>


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
      activePage: "verification"
    }
  },
  mounted() {

  },
  methods: {
    // response != 200 => message printen
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
  color: #2c3e50;
  margin-top: 60px;
}
body {
  background-color: #707070;

}
</style>
