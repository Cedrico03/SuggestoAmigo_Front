<template>
    <div>        
        <div class="wrapper">
            
            <h1>Feed</h1>
            
            <div id="friendPageButtons">
                <div class="friendButton" @click="$emit('changePageEvent', 'addFriend')">Add Friends</div>
            </div>

            <div>All Posts:</div>
            <div id="firendTable">
                <table border="2" style="margin: 0 auto;">
                    <tr>
                        <!-- <th>Friend</th> -->
                        <th>Message</th>
                        <th>Time</th>
                        <th>Likes</th> <!-- https://localhost:5148/Like?cardID=13 -->
                        <th>Disikes</th> <!-- https://localhost:5148/Dislike?cardID=13 -->
                        <th>LikeCounter</th>
                    </tr>
                    <tr v-for="card in cards" :key="card.id">
                        <!-- <td>{{ card.maker}}</td>  => moet vriend zijn die het gemaakt heeft (nog in backend mee te geven) -->
                        <td>{{ card.message}}</td>
                        <td>{{ card.sharemoment}}</td>
                        <td>{{ card.likes}}</td>
                        <td>{{ card.dislikes}}</td>
                        <td>{{ card.likeCounter}}</td>
                        <td style="text-align: center; width: 130px;"> 
                            <span style="background-color: #92E5A6;" @click="likeOrDislike('like', card.id)">LIKE</span>
                            <span style="background-color: #F07F76;" @click="likeOrDislike('dislike', card.id)">DISLIKE</span> 
                        </td>

                    </tr>

                </table>
            </div>
        </div>


    </div>
</template>

<script>

export default {
    name: "FeedPage",
    data() {
        return {
            friends: [],
            cards: []
        }
    },
    components: {
    },
    async mounted() { // async zodat het wacht op elkander
        await this.getAllFriends();
        await new Promise(resolve => setTimeout(resolve, 1000)); // om 2 te wachten, cuz ya boy needs some time
        this.getCards();
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
        },
        getCards() {
            this.friends.forEach(friend => {
                console.log("test" + friend.userID);
                this.getCardsFromFriend(friend.userID);
            });
            console.log("hier", this.cards)
        },
        getCardsFromFriend(friendId) {
            let credentials = this.$parent.username + ":" + this.$parent.password;

            fetch("https://localhost:5148/Card?friendID=" + friendId,
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
                console.log("Success cards:", data)
                this.cards = data;
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
        },
        likeOrDislike(feedback, cardId) {
            let status = "";
            if(feedback.toLowerCase() == "like") status = "Like";
            if(feedback.toLowerCase() == "dislike") status = "Dislike";
            
            let credentials = this.$parent.username + ":" + this.$parent.password;
            fetch("https://localhost:5148/" + status + "?cardID=" + cardId,
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
                console.log("Success like:", data)
                this.cards = data;
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
            this.getCards()
            setTimeout(() => {this.getCards();}, 500)
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