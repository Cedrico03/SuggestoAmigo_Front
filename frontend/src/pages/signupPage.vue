<template>
    <div>              
        
        <h2>SignupPage</h2>

        <div class="wrapper">
            <h3>Welcome New user</h3>
        </div>
    
        <br>
        
        <div class="title">
            <h2>Sign Up</h2>
        </div>


        <div class="wrapper">
            <div @click="$emit('changePageEvent', 'login')"> <!-- emit is voor parent folder functie (setActivePage) te callen-->
                    <u>Log In</u>
                </div>

        </div>
    </div>
</template>

<script>

export default {
    name: "SignUpPage",
    components: {

    },
    mounted() {

    },
    methods: {
        
    }

}
</script>