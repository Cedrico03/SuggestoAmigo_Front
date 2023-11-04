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
                <input type="text" placeholder="Email" v-model="Email">
            </div>

            <div class="input-group">
                <input type="password" placeholder="Password" v-model="Password">
            </div>

            <div class="input-group">
                <input type="password" placeholder="Re-enter Password" v-model="RePassword">
            </div>

            <div class="input-group">
                <input type="checkbox" id="over18" v-model="Over18">
                <label for="myCheck" style="margin-left: 5px;">I am over 18 years old</label> 
            </div>

            <div class="input-group">
                By making an account,
                <br>
                you accept our <u @click="$emit('changePageEvent', 'tos')" style="cursor: pointer;">Terms of service</u>.                
            </div>


            <div @click="SignUpChecks()" class="button">Sign Up</div>

            <div v-if="Resp == 'user added'"> ✔️Successfully added, check your spam folder and <span @click="$emit('changePageEvent', 'verification')"><u style="cursor: pointer;"><b>verify</b></u></span> !✔️</div>
            
            <div class="error"> <!-- error div: -->
                <p v-if="Resp == 'invalid email format'">Invalid e-mail format</p>
                <p v-if="Resp == 'email already in use'">E-mail already in use</p>
                <p v-if="Resp == 'user with this firstname and lastname already exist'">Firstname and Lastname already taken</p>
                <p v-if="Resp == 'firstname too long'">Firstname too long</p>
                <p v-if="Resp == 'lastname too long'">Lastname too long</p>
                <p v-if="Resp == 'pass'">Passwords don't match</p>
                <p v-if="Resp == '18check'">You must be over 18</p>
            </div>
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
            RePassword:"",
            Resp: "",
            Over18: false,
        }
    },
    components: {

    },
    mounted() {

    },
    methods: {
        SignUpChecks(){
            let check = true
            if (this.Password != this.RePassword){
                this.Resp="pass"     
                check = false           
            }
            if (!this.Over18){
                this.Resp="18check" 
                console.log(this.Resp)
                check = false               
            }
            if (check) this.SignUp()
        },

        SignUp() {
            let data = {
                "firstname": this.Firstname,
                "lastname": this.Lastname,
                "email": this.Email,
                "password": this.Password,
                "isverified":false
            }
            
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
                console.log(data);
                if(data.message == 200) this.Resp = data.message 
                else {
                    this.Resp = data.message 
                }
                this.Resp = data.message
            }) 
            .catch((error) => console.error("Error:", error))
        }
    }
}
</script>
<style>
.error{
    color: darkred;
    display: block;
}
</style>