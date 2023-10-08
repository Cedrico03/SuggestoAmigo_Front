<template>
    <div>
        <!-- <h1><u>Suggesto Amigo</u></h1> -->
        
        <div class="title">
            <h2>LoginPage</h2>
        </div>
        <div class="wrapper">
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
            <div @click="LogIn()" class="button"><b>Login</b></div>
            <br>
            <div class="signup-section">
                Not a member yet? 
                <div @click="$emit('changePageEvent', 'signup')"> <!-- emit is voor parent folder functie (setActivePage) te callen-->
                    <u>Sign up now</u>
                </div>
            </div>

        </div>
    </div>
</template>

<script>

export default {
    name: "LoginPage",
    data() {
        return {
            Mail: "",
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
            let data = {
                "email": this.Email,
                "password": this.Password
            }
            fetch(" ", {                    // *+*
                method: "GET",
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

<style>
.wrapper {
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  background-color: #028090;
  /* color: #2c3e50; */
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
  background-color: #B5CFC9 ; /* Green */
}

.signup-section {
    margin-top: 30px;
}


</style>
