<template>
    <div>    
        <div class="wrapper">
            <h2>Create an account</h2>

            <div class="input-group">
                Firstname:
                <br>
                <input type="text" placeholder="Bhibo" v-model="Firstname">
            </div>

            <br>

            <div class="input-group">
                Lastname:
                <br>
                <input type="text" placeholder="Banderkam" v-model="Lastname">
            </div>

            <br>

            <div class="input-group">
                Email:
                <p class="error" v-if="Resp == 'invalid email format'">Invalid e-mail format</p>
                <p class="error" v-if="Resp =='email already in use'">E-mail already in use</p>
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

            <div @click="SignUp()" class="button"><b>Sign Up</b></div>

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
            Email: "",
            Password: "",
            Resp: "",
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
                "password": this.Password,
            }
            fetch(" https://localhost:7166/Account ", 
                {                    
                    method: "POST",
                    headers: {
                        "accept": "text/plain",
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify(data)
                }
            )
            .then(response => response.json())
            .then((data) => {
                console.log("Success:", data);
                this.Resp = data.value.message // true zetten => prompt de success div
            }) 
            .catch((error) => console.error("Error:", error))
        }
    }

}
</script>
<style>
#error{
    text-decoration-color: red;
}
</style>