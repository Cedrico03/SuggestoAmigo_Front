<template>
    <div>
        <!-- <h1><u>Suggesto Amigo</u></h1> -->
        
        <div id="noAcc">
            
            <img id= "logoImg" src="../assets/AmigoLogo.png" alt="Logo" @click="$emit('changePageEvent', 'signup')"> 

            <div id="headerButtons">
                <p id= "headerButton" @click="$emit('changePageEvent', 'signup')">Sign Up</p>
                <p id= "headerButton" @click="$emit('changePageEvent', 'login')">Log In</p>
                <p id= "headerButton" @click="$emit('changePageEvent', 'verification')">Verify</p>
            </div>
        
        </div>
    </div>
</template>

<script>

export default {
    name: "HeaderNoAcc",
    
    // data() {
    //     return{

    //     }
    // },
    
    components: {
        
    },
    
    mounted() {

    },
    
    methods: {
        
    }

}
</script>

<style>
#noAcc{
    display: flex;
    height: auto;
    margin: 0;
    padding: 0;
    background-color: #3F72AF;
    border-bottom: solid 2px black;
}
#logoImg{
    width: 8%;
    height: 8%;
    float: left;
    margin: 1% 0 1% 10%;
    cursor:pointer;
}
#headerButtons{
    position: absolute;
    display: flex;
    right: 10%;
    margin: 3% 0 0 2%;
}
#headerButton{
    text-align: center;
    cursor: pointer;
    padding: 10px 0;
    width: 100px;
    margin: 1.3% 1% 0px 10px;
    background-color: #DBE2EF;
    border: 2px solid #3F72AF;
    border-radius: 5px;
}

#headerbutton:active {
    transform: translateY(8px);
}
</style>