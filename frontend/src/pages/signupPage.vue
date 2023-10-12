<template>
    <div>    
        <div class="wrapper">
            <h2>Create an account</h2>

            <div class="input-group">
                <input type="text" placeholder="Firstname" v-model="Firstname">
            </div>

            <div class="input-group">
                <input type="text" placeholder="Lastname" v-model="Lastname">
            </div>

            <div class="input-group">
                <p class="error" v-if="Resp == 'invalid email format'">Invalid e-mail format</p>
                <p class="error" v-if="Resp =='email already in use'">E-mail already in use</p>
                <input type="text" placeholder="Email" v-model="Email">
            </div>

            <div class="input-group">
                <input type="password" placeholder="Password" v-model="Password">
            </div>

            <div class="input-group">
                <input type="checkbox" id="over18" v-model="Over18">
                <label for="myCheck">I am over 18</label> 
            </div>


            <div @click="SignUp()" class="button">Sign Up</div>
            
        </div>

        <div class="wrapper" > <!-- emit is voor parent folder functie (setActivePage) te callen-->
            <p>Already have an account?</p>
            <p class="button" @click="$emit('changePageEvent', 'login')">Log In</p>
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
            Over18: false,
        }
    },
    components: {

    },
    mounted() {

    },
    methods: {
        SignUp() {
            let data = {
                "firstname": this.Firstname,
                "lastname": this.Lastname,
                "email": this.Email,
                "password": this.Password,
                "isverified":false
            }
            if (!this.Over18) return
            fetch("https://localhost:5148/Account", 
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
    display: block;
}
</style>