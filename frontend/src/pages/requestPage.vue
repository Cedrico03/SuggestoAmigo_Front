<template>
    <div>        
        <div class="wrapper">

            <h1>Friend Requests</h1>

            <!-- <div v-if="requests.length() == 1">
                No requests ... (go and find some)
            </div> -->

            <div id="friendPageButtons">
                <div style="width: 100px;" class="friendButton" @click="$emit('changePageEvent', 'friends')">Back to Friends</div>
            </div>

            <div id="requestTable">
                <table border="2">
                    <tr>
                        <th style="width: 200px;">User</th>
                        <th>Accept</th>
                    </tr>
                            
                    <tr v-for="request in requests" :key="request.id">               
                        <td v-if="request.fullName != ''" >{{ request.fullName }}</td>
                        <td v-if="request.fullName != ''" style="text-align: center; width: 130px;"> 
                            <span style="background-color: #92E5A6;" class="requestAcceptButton" @click="answerRequest('yes', request.userID)">YES</span>
                            <span style="background-color: #F07F76;" class="requestAcceptButton" @click="answerRequest('no', request.userID)">NO</span> 
                        </td>
                    </tr>
                </table>
            </div>            
        </div>
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
            setTimeout(() => {this.getAllRequests();}, 500)
        }
    }

}
</script>

<style>
#requestTable{
    margin-bottom: 20px;
}
.requestAcceptButton{
    cursor: pointer;
    background-color: #DBE2EF;
    font-size: 14px;
    border-radius: 2px;
    padding:3px;

    display: inline-block;
    width: 30px;
    
    margin: 0 10px 0 10px;
}
.requestAcceptButton:hover{
background-color:#c1c9d9 ;
}
</style>