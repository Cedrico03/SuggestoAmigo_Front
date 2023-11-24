<template>
    <div>        
        <div class="wrapper">
            
            <h1>Feed</h1>
            
            <div id="friendPageButtons">
                <div class="friendButton" @click="$emit('changePageEvent', 'addFriend')">Add Friends</div>
            </div>

            <div v-for="card in cards" :key="card.id">
                <div class="cardSectionHeader"> <!--fixing style with the padding-->
                    <h5 class="cardSectionLeft">{{card.fullName}}</h5>
                    <h5 class="cardSectionRight">{{card.card.sharemoment.replace('T', ' ').substr(0, 16)}}</h5>
                </div>

                <textarea class="cardContent" readonly v-model="card.card.message"></textarea>
                
                <div class="cardSectionFooter">
                    <p class="cardSectionLeft"><img src="../assets/hand-thumbs-up.813x1024.png" style="height: 8%; width: 8%; margin-right: 5px;"> {{ card.card.likeCounter }}</p>
                    <div class="cardSectionRight">                        
                        <span style="background-color: #92E5A6;" class="likeButton" @click="likeOrDislike('like', card.card.id)">Like</span>
                        <span style="background-color: #F07F76;" class="likeButton" @click="likeOrDislike('dislike', card.card.id)">Dislike</span>                                
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

export default {
    name: "FeedPage",
    data() {
        return {
            cards: []
        }
    },
    components: {
    },
    mounted() {
        this.getFeed()
    },
    methods: {
        getFeed() {
            let credentials = this.$parent.username + ":" + this.$parent.password;

            fetch(`${process.env.VUE_APP_API_URL}/Feed`,
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
                this.cards = data.reverse();
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
            setTimeout(() => {this.getFeed();}, 500)
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
.likeButton{
    cursor: pointer;
    background-color: #DBE2EF;
    font-size: 14px;
    border-radius: 2px;
    padding:3px;

    display: inline-block;
    width: 50px;
    
    margin: 3px 0px 0 10px;
}
.likeButton:hover{
background-color:#c1c9d9 ;
}

</style>