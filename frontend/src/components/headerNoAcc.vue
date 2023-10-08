<template>
    <div>
        <!-- <h1><u>Suggesto Amigo</u></h1> -->
        
        <div id="noAcc">
            
            <img id= "logoImg" src="../assets/AmigoLogo.png" alt="Logo" @click="$emit('changePageEvent', 'signup')"> 

            <div id="headerButtons">
                <p id= "headerButton" @click="$emit('changePageEvent', 'signup')">Sign Up</p>
                <p id= "headerButton" @click="$emit('changePageEvent', 'login')">Log In</p>
            </div>
        
        </div>
    </div>
</template>

<script>

export default {
    name: "HeaderNoAcc",
    
    data() {
        
    },
    
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
    background-color: #00ADB5;
}
#logoImg{
    width: 5%;
    height: 5%;
    float: left;
    margin-left: 0;
}
#headerButtons{
    position: absolute;
    right: 1%;
    display: flex;
    margin-top: 9px
}
#headerButton{
    text-decoration: underline;
    cursor: pointer;
    width: 100px;    
    margin-right: 5%;
}
</style>