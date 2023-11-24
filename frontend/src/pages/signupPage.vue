<template>
    <div>    
        <div class="wrapper">
            <h2>Create an account</h2>

            <div class="input-group">
                <input type="text" placeholder="Firstname" v-model="Firstname" @focus="ShowReq = false, ShowMatch = false">
            </div>

            <div class="input-group">
                <input type="text" placeholder="Lastname" v-model="Lastname" @focus="ShowReq = false, ShowMatch = false">
            </div>

            <div class="input-group">
                <input type="text" placeholder="Email" v-model="Email" @focus="ShowReq = false, ShowMatch = false">
            </div>

            <div class="input-group">
                <input type="password" placeholder="Password" v-model="Password"  @focus="ShowReq = true, ShowMatch = false" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
            </div>

            
            <div class="input-group">
                <input type="password" placeholder="Re-enter Password" v-model="RePassword" @focus="ShowReq = false, ShowMatch = true">
            </div>
            
            <div id="message" v-if="ShowReq == true">
                <h3>Password must contain the following:</h3>
                
                <div style="text-align: left;">
                    <span class="invalid" v-if="!Password.match(/[a-z]/g)">A <b>lowercase</b> letter</span>
                    <span class="invalid" v-if="!Password.match(/[A-Z]/g)">A <b>capital (uppercase)</b> letter</span>
                    <span class="invalid" v-if="!Password.match(/[0-9]/g)">A <b>number</b></span>
                    <span class="invalid" v-if="Password.length<=7">Minimum <b>8 characters</b></span> 
                    
                    
                    <span class="valid" v-if="Password.match(/[a-z]/g)">A <b>lowercase</b> letter</span> 
                    <span class="valid" v-if="Password.match(/[A-Z]/g)">A <b>capital (uppercase)</b> letter</span> 
                    <span class="valid" v-if="Password.match(/[0-9]/g)">A <b>number</b></span> 
                    <span class="valid" v-if="Password.length>7">Minimum <b>8 characters</b></span>
                </div>
            </div>
            
            
            <div class="input-group">
                <input type="checkbox" id="over18" v-model="Over18" @focus="ShowReq = false, ShowMatch = false">
                <label for="myCheck" style="margin-left: 5px;">I am over 18 years old</label> 
            </div>

            <div id="message" v-if="ShowMatch == true" >
                <span class="invalid" v-if="Password != RePassword">Passwords must <b>match</b></span> 
                <span class="valid" v-if="Password == RePassword">Passwords must <b>match</b></span>
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
                <p v-if="!PassReq">Password too weak</p>
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
            ShowReq: false,   
            ShowMatch: false,
            PassReq:true,         
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
            else{
                this.Resp="" 
            }
            if (!this.Over18){
                this.Resp="18check" 
                console.log(this.Resp)
                check = false               
            }
            else{
                this.Resp="" 
            }
            if(this.Password.match(/[a-z]/g) && this.Password.match(/[A-Z]/g) && this.Password.match(/[0-9]/g) && this.Password.length>7){
                this.PassReq = true
            }
            else{
                this.PassReq = false
                check=false
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
            
            fetch(`${process.env.VUE_APP_API_URL}/Account`, 
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
/* Add a green text color and a checkmark when the requirements are right */
.valid {
  color: darkgreen;
  display: block;
}

.valid:before {
  position: relative;  
  margin-right: 10px;
  /* left: -35px; */
  content: "✔";
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
  color: darkred;
  display: block;
}

.invalid:before {
  position: relative;
  margin-right: 10px;
  /* left: -35px; */
  content: "✖";
}
#message{
    margin-bottom: 10px;
}
</style>