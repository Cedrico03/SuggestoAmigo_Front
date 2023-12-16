<template>
    <div>
        <!-- <h1><u>Suggesto Amigo</u></h1> -->     
        
        <div class="wrapper" >
            <h2>Verification</h2>
            <div class="input-group">                
                <input type="text" placeholder="Email" v-model="VeriMail">
            </div>
            <br>
            <div class="input-group">
                <input type="text" placeholder="Verification Code" v-model="VeriCode"> <!-- v-model is nodig voor later in VerifyCode functie de value eruit te halen-->
            </div>
            <br>
            <div @click="VerifyCode()" class="button">Verify</div>
            
            <!-- Check if account has been verified -->
            <div v-if="Verified == true"> 
                ✔️ Success, you have been verified! ✔️
            </div>            
            
            
        </div>
        <div class="wrapper" > <!-- emit is voor parent folder functie (setActivePage) te callen-->
        <p>Click the button to log in once you're verified</p>
        <p class="button" @click="$emit('changePageEvent', 'login')">Log In</p>
        </div>
        
    </div>
</template>

<script>

export default {
    name: "VerificationPage",
    data() {
        return {
            VeriMail: "",
            VeriCode: "",
            Verified: false
        }
    },
    components: {
    },
    mounted() {
    },
    methods: {
        VerifyCode() {
            console.log(this.VeriMail)
            console.log(this.VeriCode) // code uit de v-model (= value vd input)

            // hieronder al fetch structuur:, *+* = te vervolledigen
            let data = {
                "email": this.VeriMail,
                "code": this.VeriCode
            }

            const queryParams = new URLSearchParams();
            queryParams.append('email', data.email);
            queryParams.append('verificationCode', data.code);

            // Combine the base URL and query parameters
            const urlWithQueryParams = `${process.env.VUE_APP_API_URL}/VerificationCode?${queryParams.toString()}`;
            
            fetch(urlWithQueryParams, {
                method: "PUT",
                headers: {
                        "accept": "text/plain",
                        "Content-Type": "application/json"
                },
                body: JSON.stringify(data)
            })
            .then((data) => {
                console.log("Success:", data);
                this.Verified = true // true zetten => prompt de success div
            }) 
            .catch((error) => console.error("Error:", error))

        }

    }
}
</script>

<style>

/*

IF CLASS MOVE CSS STYLE TO APP .VUE PLS TY <3

.wrapper {
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  background-color: #028090;  
  color: black;
  margin-right:35%;
  margin-left: 35%;
  padding: 45px;
  padding-top: 30px;
  padding-bottom: 20px;
  border-radius: 25px;
  border-color: black;
  border: solid 2px;

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
  background-color: #84AEA4;
  padding: 15px 32px;
  margin-top: 10px;
  border-radius: 5px;

}

.button:hover {
  background-color: #B5CFC9 ; 
} 
*/

</style>
