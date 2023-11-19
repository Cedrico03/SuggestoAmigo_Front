<template>
    <div>
        <!-- <h1><u>Suggesto Amigo</u></h1> -->
        <div id="noAcc">
            
            <img id= "logoImg" src="../assets/AmigoLogo.png" alt="Logo" @click="$emit('changePageEvent', 'signup')"> 

            <div id="containerHeader">
                <div id="menu-wrapHeader">
                    <input type="checkbox" class="togglerHeader" />
                    <div class="dotsHeader">
                        <div></div>
                    </div>
                    <div class="menuHeader">
                        <div>
                        <ul>
                            <li style="background-color: #ffffff;" id="headerButton" @click="$emit('changePageEvent', 'signup')">Sign Up</li>
                            <li style="background-color: #ffffff;" id="headerButton" @click="$emit('changePageEvent', 'login')">Log In</li>
                            <li style="background-color: #ffffff;" id="headerButton" @click="$emit('changePageEvent', 'verification')">Verify</li>
                            <li style="background-color: #ffffff;" id="headerButton" @click="$emit('changePageEvent', 'about')">About</li>
                        </ul>
                        </div>
                    </div>
                </div>
            </div>      
        </div>
    </div>
</template>

<script>

export default {
    name: "HeaderNoAcc",
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
    
    width: 52px;
    margin: auto;/*align in header bar*/ 
    margin-left: 10px;/*space between the buttons */
    padding: 10px;/* align text in bunnen vertically */
    background-color: #DBE2EF;
    border-radius: 5px;
}
#headerButton:hover{
    background-color:#c1c9d9 ;
}

#headerbutton:active {
    transform: translateY(8px);
}
</style>