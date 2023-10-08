<template>
    <div>    
        <div class="wrapper">
            <h2>Create an account</h2>

            <div class="input-group">
                Email:
                <br>
                <input type="text" placeholder="Bhibo" v-model="Firstname">
            </div>

            <br>

            <div class="input-group">
                Password:
                <br>
                <input type="password" placeholder="Banderkam" v-model="Lastname">
            </div>

            <br>

            <div class="input-group">
                Email:
                <br>
                <input type="text" placeholder="email" v-model="Email">
            </div>

            <br>

            <div class="input-group">
                Password:
                <br>
                <input type="password" placeholder="password" v-model="Password">
            </div>

            <br>

            <div @click="SignUp()" class="button"><b>Login</b></div>

            <br>
            <br>
            
            <div @click="$emit('changePageEvent', 'login')"> <!-- emit is voor parent folder functie (setActivePage) te callen-->
                    <u>Log In</u>
            </div>
        </div>
    </div>
</template>

<script>

export default {
    name: "SignUpPage",
    data() {
        return {
            Firstname:"",
            Lastname:"",
            Mail: "",
            Password: "",
        }
    },
    components: {

    },
    mounted() {

    },
    methods: {
        SignUp() {
            console.log(this.Email);
            console.log(this.Password);

            // hieronder al fetch structuur:, *+* = te vervolledigen
            let data = {
                "firstname": this.Firstname,
                "lastname": this.Lastname,
                "email": this.Email,
                "password": this.Password
            }
            fetch(" ", {                    // *+*
                method: "POST",
                headers: {

                },
                body: JSON.stringify(data)
            })
            .then((response) => response.json())
            .then((data) => console.log("Success:", data)) 
            .catch((error) => console.error("Error:", error))
        }
    }

}
</script>