<template>
  <div id="app">
    
    <HeaderNoAcc v-if="loginStatus == 'false'" @changePageEvent="setActivePage"/>      
    
    <LoginPage v-if="activePage == 'login'" @changePageEvent="setActivePage"/> 
   
    <SignUpPage v-if="activePage == 'signup'" @changePageEvent="setActivePage"/>
    
    <VerificationPage v-if="activePage == 'verification'" @changePageEvent="setActivePage" />
  </div>
</template>

<script>
import LoginPage from './pages/loginPage.vue'
import SignUpPage from './pages/signupPage.vue'
import VerificationPage from './pages/verificationPage.vue'
import HeaderNoAcc from './components/headerNoAcc.vue'

export default {
  name: 'App',
  components: {
    LoginPage,
    SignUpPage,
    VerificationPage,
    HeaderNoAcc
  },
  data() {
    return {
      // activePage: "login"
      activePage: "verification",
      loginStatus: "false"
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
  color: #112D4E;
}
body {
  background-color: #DBE2EF;
  margin: 0;
}
.wrapper {
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  background-color: #3F72AF;  
  color: black;
  margin: 5% 35% 0 35%;
  padding: 45px;
  padding-top: 30px;
  padding-bottom: 20px;
  border-radius: 25px;
  border-color: black;
  border: solid 2px;

  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.input-group {
    margin-bottom: 10px;
}

.button {
  transition-duration: 0.4s;
  background-color: #DBE2EF;
  padding: 15px 32px;
  margin-top: 10px;
  border-radius: 5px;

}

.button:hover {
  background-color: #DBE2EF ; 
} 

/* https://coolors.co/palette/05668d-028090-00a896-02c39a-f0f3bd */
</style>

