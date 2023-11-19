<template>
  <div id="app">
    
    <div v-if=" username == ''">
      <HeaderNoAcc v-if="windowWidth > 550"  @changePageEvent="setActivePage"/>      
      <HeaderNoAccDots v-if="windowWidth <= 550" @changePageEvent="setActivePage"/>
    </div>

    <div v-if=" username != ''">
      <HeaderAcc v-if="windowWidth > 550" @changePageEvent="setActivePage"/>      
      <headerAccDots v-if="windowWidth <= 550" @changePageEvent="setActivePage"/>
    </div>
    
    <div style="margin:0 10px;">
      <LoginPage v-if="activePage == 'login'" @changePageEvent="setActivePage"/> 
      
      <SignUpPage v-if="activePage == 'signup'" @changePageEvent="setActivePage"/>
      
      <VerificationPage v-if="activePage == 'verification'" @changePageEvent="setActivePage" />
      
      <FriendsPage v-if="activePage == 'friends'" @changePageEvent="setActivePage" />
      
      <AddFriendPage v-if="activePage == 'addFriend'" @changePageEvent="setActivePage" />
      
      <RequestPage v-if="activePage == 'request'" @changePageEvent="setActivePage" />
  
      <MyProfile v-if="activePage == 'myProfile'" @changePageEvent="setActivePage" />
  
      <FeedPage v-if="activePage == 'feed'" @changePageEvent="setActivePage"/>
  
      <TosPage v-if="activePage == 'tos'" @changePageEvent="setActivePage"/> 
  
      <ReportPage v-if="activePage == 'report'" @changePageEvent="setActivePage"/>
      
      <AboutUsPage v-if="activePage == 'about'" @changePageEvent="setActivePage"/>

    </div>
      
  </div>
</template>

<script>
import LoginPage from './pages/loginPage.vue'
import SignUpPage from './pages/signupPage.vue'
import VerificationPage from './pages/verificationPage.vue'
import FriendsPage from './pages/friendsPage.vue'
import AddFriendPage from './pages/addFriendPage.vue'
import RequestPage from './pages/requestPage.vue'
import HeaderNoAcc from './components/headerNoAcc.vue'
import HeaderNoAccDots from './components/headerNoAccDots.vue'
import HeaderAcc from './components/headerAcc.vue'
import headerAccDots from './components/headerAccDots.vue'
import MyProfile from './pages/myProfile.vue'
import FeedPage from './pages/feedPage.vue'
import TosPage from './pages/tosPage.vue'
import ReportPage from './pages/reportPage.vue'
import AboutUsPage from './pages/aboutUsPage.vue'

export default {
  name: 'App',
  components: {
    LoginPage,
    SignUpPage,
    VerificationPage,
    HeaderNoAcc,
    HeaderNoAccDots,
    HeaderAcc,
    headerAccDots,
    FriendsPage,
    AddFriendPage,
    RequestPage,
    MyProfile,
    FeedPage,
    TosPage,
    ReportPage,
    AboutUsPage,
  },
  data() {
    return {
      activePage: "signup",

      username: "",
      password: "",
      windowWidth: window.innerWidth,
    }
  },
  mounted() {
    this.$nextTick(() => {
      window.addEventListener('resize', this.onResize);
    })
  },

  // beforeDestroy() { 
  //   window.removeEventListener('resize', this.onResize); 
  // },

  methods: {
    setActivePage(page) {
      this.activePage = page;
    },
    onResize() {
      this.windowWidth = window.innerWidth
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
  color: #112D4E;
}

#mainpage{
  position:relative;
}

#mainContent{
  
  z-index: 100;
}

#backgroundImg{
  position:absolute;
  z-index: -100;
  /* top: 156px; */
  top: 0;
  left: 25%;
  width: 50%;
  opacity: 0.3;
}

body {
  background-color: #DBE2EF;
  margin: 0;
  background-image: url("./assets/AmigoBackground.png");
  background-repeat: no-repeat;
  background-size: cover;
  background-attachment: fixed;
}
table{
  border-collapse: collapse;
  border: black 1px solid;
  width: 350px;
}
td, th{
  height: 25px;
}
td{
  text-align: left;
  padding-left: 5px;
}
h2{
  margin-bottom: 10px;
}
.wrapper {
  text-align: center;
  background-color: #3F72AF;  
  color: black;
  max-width: 400px;
  border: 1px solid black;
  border-radius: 10px;
  
  margin: 0 10px 20px 10px;
  display: block;
  margin-left: auto;
  margin-right: auto;

  padding-bottom: 5px;

  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.input-group {
  margin-bottom: 10px;
}

.button {
  background-color: #DBE2EF;
  width: 120px;
  padding: 15px 0;
  margin: 0px 0 10px 0;
  border-radius: 5px;
  cursor:pointer;

}

.button:hover {
  background-color:#c1c9d9 ; 
} 
</style>

