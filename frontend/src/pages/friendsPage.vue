<template>
    <div>        
        <div class="wrapper">
            <h1>friends page</h1>

            <table border="2" style="margin: 0 auto;">
            <tr>
                <th>All friends</th>
            </tr>
            <tr v-for="friend in friends" :key="friend.id">
                <td>{{ friend.fullName}}</td>
            </tr>        
        </table>
            <button @click="$emit('changePageEvent', 'request')">doeding MOET WEG ROEPERT</button>
        </div>


    </div>
</template>

<script>

export default {
    name: "FriendsPage",
    data() {
        return {
            friends: []
        }
    },
    components: {
        
    },
    mounted() {
        this.getAllFriends()
    },
    methods: {
        getAllFriends() {
            let credentials = this.$parent.username + ":" + this.$parent.password;

            fetch("https://localhost:5148/Friends",
            {
                headers: {
                'Accept': 'text/plain',
                'Content-Type': 'application/json',
                'Authorization' : "Basic " + btoa(credentials)
                },
                method: "GET"
            })
            .then((response) => response.json())
            .then((data) => { // successvol
                console.log("Success:", data)
                this.friends = data;
            })
            .catch((error) => { // niet successvol
                console.error("Error:", error)
                this.loginError = true;
                if (error.response && error.response.status) {
                    this.errorCode = error.response.status;
                } else {
                    this.errorCode = "Unknown error";
                }
            })
        }
    }

}
</script>