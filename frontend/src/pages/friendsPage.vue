<template>
    <div>        
        <div class="wrapper">
            
            <h1>Friends</h1>
            
            <div id="friendPageButtons">
                <div class="friendButton" @click="$emit('changePageEvent', 'addFriend')">Add Friends</div>
                <div class="friendButton" @click="$emit('changePageEvent', 'request')"
                style="margin-left: 10px">
                    Requests
                </div>
            </div>

            <div id="firendTable">
                <table border="2" style="margin: 0 auto;">
                    <tr>
                        <th>All Friends</th>
                    </tr>
                    <tr v-for="friend in friends" :key="friend.id">
                        <td><span class="friendName">{{ friend.fullName}}</span></td>
                    </tr>        
                </table>
            </div>
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

<style>
#firendTable{
    margin-bottom: 20px;
}

#friendPageButtons{
    display: flex;
    margin: -18px 0 20px 0;
}
.friendButton{
    font-size:  14px;
    cursor: pointer;
    
    width: 80px;
    margin: 10px;/*align in header bar*/ 
    
    padding: 10px;/* align text in button vertically */
    background-color: #DBE2EF;
    border-radius: 5px;
}
.friendButton:hover{
    background-color:#c1c9d9 ;
}

</style>