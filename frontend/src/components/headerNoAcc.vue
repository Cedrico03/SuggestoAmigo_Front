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
    height: 106px;
    margin: 0 0 50px 0;
    padding: 0;
    background-color: #3F72AF;
    border-bottom: 1px solid black;
}
#logoImg{
    width: 85px;
    height: 85px;
    float: left;
    margin: 10px 0 10px 10%;
    cursor:pointer;
}
#headerButtons{
    position: absolute;
    display: flex;
    right: 10%;
    margin: 32px 0 0 10px;
}
#headerButton{
    font-size:  14px;
    cursor: pointer;
    width: 50px;
    margin: auto;/*align in header bar*/ 
    margin-left: 10px;/*space between the buttons */
    padding: 10px;/* align text in bunnen vertically */
    background-color: #DBE2EF;
    /* border: 2px solid #3F72AF; */
    border-radius: 5px;
}

#headerbutton:active {
    transform: translateY(8px);
}
</style>