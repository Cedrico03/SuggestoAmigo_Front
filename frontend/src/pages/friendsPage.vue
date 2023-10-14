<template>
    <div>        
        <div class="wrapper">
            <h1>friends page</h1>

            <table border="2" style="margin: 0 auto;">
            <tr>
                <th>All friends</th>
            </tr>
            <tr v-for="friend in friends" :key="friend.id">
                <td>{{ friend.firstname + friend.lastname }}</td>
            </tr>        
        </table>
            
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
        // this.getAllFriends()
    },
    methods: {
        getAllFriends() {
            let credentials = this.Email + ":" + this.Password
            
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
                // this.loginError = false;
                // this.errorCode = null
                // this.$emit('changePageEvent', 'friends') // verander v page, naar friends page
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