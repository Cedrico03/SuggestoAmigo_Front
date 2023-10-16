<template>
    <div>
        <!-- <h1><u>Suggesto Amigo</u></h1> -->
        
        
        <div class="wrapper">
            <h2>Log In</h2>
            <div class="input-group">
                <input type="text" placeholder="Email" v-model="Email">
            </div>
            <br>
            <div class="input-group">
                <input type="password" placeholder="Password" v-model="Password">
            </div>
            <div @click="LogIn()" class="button">Log In</div>
            <div v-if="loginError">
                Email or password is wrong
            </div>
        </div>

        <div class="wrapper"> <!-- emit is voor parent folder functie (setActivePage) te callen-->
            <p>Not a member yet?</p>
            <p class="button" @click="$emit('changePageEvent', 'signup')">Sign Up</p>
        </div>

    </div>
</template>

<script>

export default {
    name: "LoginPage",
    data() {
        return {
            Email: "",
            Password: "",
            loginError: false,
            errorCode: null
        }
    },
    components: {
        
    },
    mounted() {

    },
    methods: {
        LogIn() {
            let credentials = this.Email + ":" + this.Password;
            
            fetch("https://localhost:5148/Account",
            {
                headers: {
                    'Accept': 'text/plain',
                    'Content-Type': 'application/json',
                    'Authorization' : "Basic " + btoa(credentials)
                },
                method: "GET"
            })
            .then((response) => response.json())
            .then((data) => { // successvol
                console.log("Success:", data)
                this.errorCode = null;
                this.$emit('changePageEvent', 'friends') // verander v page, naar friends page
                           
                this.$parent.username = this.Email;
                this.$parent.password = this.Password;
            })
            .catch((error) => { // niet successvol
                //console.error("Error:", error)
                this.loginError = true;
                if (error.response && error.response.status) {
                    this.errorCode = error.response.status;
                } else {
                    this.errorCode = "Unknown error";
                }
            })
        },
    }

}
</script>

<style>

</style>
