<template>
    <div>        
        <div class="wrapper">
            <h1>Add friend page</h1>
            <div class="input-group">
                <input  type="text" v-model="addFriendEmail" placeholder="friend's email">
            </div>

            <div v-if="successMessage != ''">✔️ {{ successMessage }} ✔️</div>
            
            <div @click="addFriendByEmail()" class="button">Send friend request</div>
            
        </div>

    </div>
</template>

<script>

export default {
    name: "AddFriendPage",
    data() {
        return {
            addFriendEmail: "",
            successMessage: ""
        }
    },
    components: {
        
    },
    mounted() {

    },
    methods: {
        addFriendByEmail() {
            //  'https://localhost:5148/FriendRequest?FriendEmail=test' \
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