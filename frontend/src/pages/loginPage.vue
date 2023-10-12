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
            <div @click="LogIn()" class="button">Login</div>
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
        }
    },
    components: {
        
    },
    mounted() {

    },
    methods: {
        LogIn() {
            console.log(this.Email);
            console.log(this.Password);

            // hieronder al fetch structuur:, *+* = te vervolledigen

            let credentials = this.Email + ":" + this.Password
            
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
            .then((data) => console.log("Success:", data)) 
            .catch((error) => console.error("Error:", error))
        }
    }

}
</script>

<style>

</style>
