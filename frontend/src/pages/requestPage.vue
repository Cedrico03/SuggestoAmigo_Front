<template>
    <div>        
        <div class="wrapper">
            <h1>Friend Resquests Page</h1>

            <table border="2" style="margin: 0 auto;">
            <tr>
                <th>Requests</th>
                <th>Accept: Y/N</th>
            </tr>

            <tr>
                <td>testSender</td>
                <td> <span class="green" @click="answerRequest('yes')"><b>YES</b></span> | <span class="red" @click="answerRequest('no')"><b>NO</b></span> </td>
            </tr>    

            <!-- <tr v-for="request in requests" :key="request.id">                 DEZE COMMENTED CODE UITEINDELIJK GEBRUIKEN
                <td>{{ request.sender }}</td>
                <td> <span class="green" @click="answerRequest('yes')"><b>YES</b></span> | <span class="red" @click="answerRequest('no')"><b>NO</b></span> </td>

            </tr>         -->
        </table>
            
        </div>


    </div>
</template>

<script>

export default {
    name: "RequestPage",
    data() {
        return {
            
        }
    },
    components: {
        
    },
    mounted() {
        this.getAllRequests()
    },
    methods: {
        getAllRequests() {

        },

        answerRequest(YesOrNo) { // verwijder pending request + zet als vriend of niet
            if(YesOrNo == "yes") {
                console.log("yes");
            }
            else {
                console.log("no");
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