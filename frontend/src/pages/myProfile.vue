<template>
    <div>
        <div class="wrapper">
            
            <h1>{{ firstname +' ' + lastname}}</h1>
            
            <div id="cardSectionHeader">
                <h4 id="cardSectionLeft">Make a card!</h4>
                
                <div id="cardSectionRight">
                    <div id="cardButton" @click="postCard()">Create</div>
                </div>
            </div>

            <div>
                <textarea id="cardContent" type="text" placeholder="What do you want to tell your friends?" v-model="cardContent"></textarea>
            </div>

            
            
            <div v-for="post in pastPosts" :key="post.id">
                <div id="cardSectionHeader" style="padding: 0 0;"> <!--fixing style with the padding-->
                    <h5 id="cardSectionLeft">{{firstname +' ' + lastname}}</h5>
                    <h5 id="cardSectionRight">{{post.sharemoment.replace('T', ' ').substr(0, 19)}}</h5>
                </div>
                <textarea id="cardContent" readonly v-model="post.message"></textarea>
            </div>
        </div>
    </div>
</template>

<script>

export default {
    name: 'myProfile',

    data() {
        return {
            firstname: '',
            lastname: '',
            cardContent: '',
            credentials: this.$parent.username + ":" + this.$parent.password,
            pastPosts : [],
        }
    },
    mounted(){
        this.getUser()
        this.getPastCards()
    },
    methods:{
        getUser(){

            fetch("https://localhost:5148/Account",
            {
                headers: {
                'Accept': 'text/plain',
                'Content-Type': 'application/json',
                'Authorization' : "Basic " + btoa(this.credentials)
                },
                method: "GET"
            })
            .then((response) => response.json())
            .then((data) => { // successvol
                console.log("Success:", data)
                this.firstname = data.firstname;
                this.lastname = data.lastname
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

        postCard(){
            let date = new Date().toLocaleString("af-ZA", {year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute:'2-digit', second: '2-digit'}).replaceAll('/', '-').replace(' ', 'T')
            console.log(date)
            let card = {
                "message": this.cardContent,
                "sharemoment": date,
                "likes": [
                    0
                ],
                "dislikes": [
                    0
                ],
                "likeCounter": 0,
                "userID": 0
            }

            fetch("https://localhost:5148/Card",
            {                
                headers: {
                'Accept': 'text/plain',
                'Content-Type': 'application/json',
                'Authorization' : "Basic " + btoa(this.credentials)
                },
                method: "POST",
                body: JSON.stringify(card)
            })
            .then((response) => response)
            .then((data) => { // successvol
                console.log("Success:", data)
                this.cardContent='';
            })
            .catch((error) => { // niet successvol
                console.error("Error:", error)
            })
            setTimeout(() => {this.getPastCards();}, 500)
        },

        getPastCards(){
            fetch("https://localhost:5148/Own",
            {                
                headers: {
                'Accept': 'text/plain',
                'Content-Type': 'application/json',
                'Authorization' : "Basic " + btoa(this.credentials)
                },
                method: "GET",
            })
            .then((response) => response.json()) //hier naar json
            .then((data) => { // successvol
                console.log("Success:", data)
                this.pastPosts=data.reverse();
            })
            .catch((error) => { // niet successvol
                console.error("Error:", error)
            })
        }
    }
}

</script>

<style>
#cardSectionHeader{
    display: flex;
    align-items: center;
    padding :0 40px;
    box-sizing: border-box;
    width: 100%;
}
#cardSectionLeft{
    display: flex;
    flex: 1 0 127px;
    justify-content: flex-start;
    margin: 10px 0;
}
#cardSectionRight{
    margin: 10px 0;
    display: flex;
    flex: 1 0 127px;
    justify-content: flex-end;
}
#cardButton{
    font-size:  12px;
    cursor: pointer;
    
    width: 40px;
    padding: 5px;/* align text in bunnen vertically */
    background-color: #DBE2EF;
    border-radius: 5px;
}
#cardContent{
    margin: -6px 0 10px 0;
    width: 320px;
    height: auto;
    background-color: inherit;
    border: solid black 1px;
    resize: none;
}


</style>
