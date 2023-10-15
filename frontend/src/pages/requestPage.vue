<template>
    <div>        
        <div class="wrapper">
            <h1>Friend Resquests Page</h1>

            <!-- <div v-if="requests.length() == 1">
                No requests ... (go and find some)
            </div> -->

            <table border="2" style="margin: 0 auto;">
                <tr>
                    <th>User</th>
                    <th>Accept: Y/N</th>
                </tr>
                        
                <tr v-for="request in requests" :key="request.id">               
                    <td>{{ request.fullName }}</td>
                    <td> <span class="green" @click="answerRequest('yes', request.userID)"><b>YES</b></span> | <span class="red" @click="answerRequest('no', request.userID)"><b>NO</b></span> </td>
                </tr>
            </table>

            
        </div>

        <button @click="$emit('changePageEvent', 'addFriend')">doeding MOET WEG ROEPERT</button>



    </div>
</template>

<script>

export default {
    name: "RequestPage",
    data() {
        return {
            requests: []
        }
    },
    components: {
        
    },
    mounted() {
        this.getAllRequests()
    },
    methods: {
        getAllRequests() {

            let credentials = this.$parent.username + ":" + this.$parent.password;

            fetch("https://localhost:5148/FriendRequest",
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
                console.log("Success:", data);
                this.requests = data
            })
            .catch((error) => { // niet successvol
                console.error("Error:", error)
            })
        },

        answerRequest(YesOrNo, id) { // verwijder pending request + zet als vriend of niet
            if(YesOrNo == "yes") {
                // 'https://localhost:5148/FriendRequest?senderID=2'
                let credentials = this.$parent.username + ":" + this.$parent.password;

                fetch("https://localhost:5148/FriendRequest?senderID=" + id,
                {
                    headers: {
                    'Accept': 'text/plain',
                    'Content-Type': 'application/json',
                    'Authorization' : "Basic " + btoa(credentials)
                    },
                    method: "PUT"
                })
                .then((response) => response.json())
                .then((data) => { // successvol
                    console.log("Success:", data);
                    this.requests = data
                })
                .catch((error) => { // niet successvol
                    console.error("Error:", error)
                })
            }
        }
    }

}
</script>

<style>
    .green {
        color: greenyellow
    }
    .red {
        color: red
    }
</style>