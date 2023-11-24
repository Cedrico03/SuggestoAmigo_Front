<template>
    <div>        
        <div class="wrapper">
            
            <h1>Add friends</h1>

            <div id="friendPageButtons">
                <div style="width: 100px;" class="friendButton" @click="$emit('changePageEvent', 'friends')">Back to Friends</div>
            </div>
            
            <div class="input-group">
                <input  type="text" v-model="addFriendEmail" placeholder="Friend's email">
            </div>

            
            <div style="width: 100px;" @click="addFriendByEmail()" class="friendButton">Send request</div>
            
            <div v-if="successMessage != ''">✔️ Request sent ✔️</div>
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
            let credentials = this.$parent.username + ":" + this.$parent.password;

            fetch(`${process.env.VUE_APP_API_URL}/FriendRequest?FriendEmail=` + this.addFriendEmail,
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