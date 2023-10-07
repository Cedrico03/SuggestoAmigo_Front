<template>
    <div>
        <h1><u>Suggesto Amigo</u></h1>
        <br>
        <br>
        <div class="title">
            <h2>LoginPage</h2>
        </div>
        <div class="wrapper">
            email:
            <br>
            <input type="text" placeholder="email">
            <br>
            <br>
            password:
            <br>
            <input type="password" placeholder="password">
            <br>
            <br>
            <button>Login</button>
            <br>
            <br>
            <br>
            Not a member? 
            <div @click="$emit('signupEvent', 'signup')"> <!-- emit is voor parent folder functie (setActivePage) te callen-->
                <u>Sign up now</u>
            </div>

        </div>
    </div>
</template>

<script>

export default {
    name: "LoginPage",
    components: {
        
    },
    mounted() {

    },
    methods: {

    }

}
</script>

<style>
.wrapper {
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  background-color: #D0D0D0;
  color: #2c3e50;
  margin-right:35%;
  margin-left: 35%;
  padding: 45px;
  padding-top: 30px;
  padding-bottom: 20px;
  border-radius: 25px;
}


</style>
