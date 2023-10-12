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
input{
  margin-top: 5px;  
}
h2{
  margin-bottom: 10px;
}
.wrapper {
  text-align: center;
  background-color: #3F72AF;  
  color: black;
  max-width: 350px;
  margin: 0 0 20px 0;
  border: 1px solid black;
  border-radius: 10px;

  display: block;
  margin-left: auto;
  margin-right: auto;

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
  padding: 15px 30px;
  margin: 0px 0 10px 0;
  border-radius: 5px;
  cursor:pointer;

}

.button:hover {
  background-color: #DBE2EF ; 
} 

.button:active {
    transform: translateY(8px);
}

#headerbutton:active {
  transform:translateY(8px);
}

/* https://coolors.co/palette/05668d-028090-00a896-02c39a-f0f3bd */
</style>

