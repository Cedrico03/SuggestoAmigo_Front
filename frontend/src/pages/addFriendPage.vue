<template>
    <div>        
        <div class="wrapper">
            
            <h1><backButtonFriends/>Add friends</h1>
            
            <div class="input-group">
                <input  type="text" v-model="addFriendEmail" placeholder="Friend's email">
            </div>

            
            <div @click="addFriendByEmail()" class="button">Send request</div>
            
            <div v-if="successMessage != ''">✔️ Request sent ✔️</div>
        </div>

    </div>
</template>

<script>
import backButtonFriends from '@/components/backButtonFriends.vue';

export default {
    name: "AddFriendPage",
    data() {
        return {
            addFriendEmail: "",
            successMessage: ""
        }
    },
    components: {
        backButtonFriends
    },
    mounted() {

    },
    methods: {
        addFriendByEmail() {
            let credentials = this.$parent.username + ":" + this.$parent.password;

            fetch("https://localhost:5148/FriendRequest?FriendEmail=" + this.addFriendEmail,
            {
                headers: {
                'Accept': 'text/plain',
                'Content-Type': 'application/json',
                'Authorization' : "Basic " + btoa(credentials)
                },
                method: "POST"
            })
            .then((response) => response.json())
            .then((data) => { // successvol
                console.log("Success:", data);
                this.successMessage = data.message
            })
            .catch((error) => { // niet successvol
                console.error("Error:", error)
            })
        }
    }

}
</script>