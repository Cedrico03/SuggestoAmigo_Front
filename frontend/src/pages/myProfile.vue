<template>
    <div>
        <div class="wrapper">
            
            <h1>{{ firstname +' ' + lastname}}</h1>
            
            <div class="cardSectionHeader">
                <h4 class="cardSectionLeft">Make a card!</h4>
                
                <div class="cardSectionRight">
                    <div id="cardButton" @click="postCard()">Create</div>
                </div>
            </div>

            <div style="margin: 0 0 30px 0;">
                <textarea class="cardContent" type="text" placeholder="What do you want to tell your friends?" v-model="cardContent"></textarea>
            </div>            
            
            <div v-for="card in pastPosts" :key="card.id">
                <div class="cardSectionHeader"> <!--fixing style with the padding-->
                    <h5 class="cardSectionLeft">{{firstname +' ' + lastname}}</h5>
                    <h5 class="cardSectionRight">{{card.sharemoment.replace('T', ' ').substr(0, 16)}}</h5>
                </div>
                <textarea class="cardContent" readonly v-model="card.message"></textarea>
                <div class="cardSectionFooter">
                    <p class="cardSectionLeft"><img src="../assets/hand-thumbs-up.813x1024.png" style="height: 8%; width: 8%; margin-right: 5px;"> {{ card.likeCounter }}</p>
                    <div class="cardSectionRight" id="container">
                        <div id="menu-wrap">
                            <input type="checkbox" class="toggler" />
                            <div class="dots">
                                <div></div>
                            </div>
                            <div class="menu">
                                <div>
                                <ul>
                                    <li style="background-color: #ffffff;" class="dropDownButton" @click="deleteCard(card.id)">Delete</li>
                                </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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

            if (card.message.length < 1) return;

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
        },
        deleteCard(cardId){
            fetch("https://localhost:5148/Card?cardID=" + cardId,
            {                
                headers: {
                'Accept': 'text/plain',
                'Content-Type': 'application/json',
                'Authorization' : "Basic " + btoa(this.credentials)
                },
                method: "DELETE",
            })
            .then((response) => response.json()) //hier naar json
            .then((data) => { // successvol
                console.log("Success:", data)                
            })
            .catch((error) => { // niet successvol
                console.error("Error:", error)
            })
            setTimeout(() => {this.getPastCards();}, 500)
        }
    }
}

</script>

<style>
.cardSectionHeader{
    display: flex;
    align-items: center;
    padding :0 40px;
    box-sizing: border-box;
    width: 100%;
    margin: 0 0 10px 0;
}
.cardSectionLeft{
    display: flex;
    flex: 1 0 127px;
    justify-content: flex-start;
    margin: 0;
}
.cardSectionRight{
    display: flex;
    flex: 1 0 127px;
    justify-content: flex-end;
    margin: 0;
}
.cardSectionFooter{
    margin: -6px 0 0 0;
    display: flex;
    align-items: center;
    padding :0 40px;
    box-sizing: border-box;
    width: 100%;
    
    margin: 0 0 10px 0;
}
#cardButton{
    font-size:  12px;
    cursor: pointer;
    text-align: center;
    width: 40px;
    padding: 5px;/* align text in bunnen vertically */
    background-color: #DBE2EF;
    border-radius: 5px;
}
.cardContent{
    margin: -6px 0 0 0;
    width: 320px;
    height: 100px;
    background-color: inherit;
    border: solid black 1px;
    resize: none;
}


#container #menu-wrap {
  position: relative;
  height: 25px;
  width: 25px;
}

#container #menu-wrap .dots {
  position: absolute;
  height: 100%;
  width: 100%;
  top: 0;
  left: 3px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  justify-content: center;
  z-index: 1;
}

#container #menu-wrap .dots > div,
#container #menu-wrap .dots > div:after,
#container #menu-wrap .dots > div:before {
  height: 3px;
  width: 3px;
  background-color: black;
  border-radius: 50%;
}

#container #menu-wrap .dots > div {
  position: relative;
}

#container #menu-wrap .dots > div:after {
  content: "";
  position: absolute;
  bottom: 8px;
  left: 0;
}

#container #menu-wrap .dots > div:before {
  content: "";
  position: absolute;
  top: 8px;
  left: 0;
}

#container #menu-wrap .menu {
  position: absolute;
  right: 10px;
  top: 25px;
  width: 0;
  height: 0;
  background-color: #DBE2EF;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  -webkit-box-align: start;
  -ms-flex-align: start;
  align-items: flex-start;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  justify-content: center;
  opacity: 0;
  visibility: hidden;
}

#container #menu-wrap .menu ul {
  list-style: none;
  padding: 5px 10px;
}

#container #menu-wrap .menu ul li {
  margin: 15px 0;
}

.dropDownButton{
    visibility: hidden;
    cursor: pointer;
    font-size: 14px;
    border-radius: 2px;
    padding:3px;
    width: 50px;
    margin: 0 10px 0 10px;
}

#container #menu-wrap .menu ul li .dropDownButton {
    text-decoration: none;
    color: rgba(49, 49, 49, 0.85);
    opacity: 0;    
}

#container #menu-wrap .toggler {
  position: absolute;
  height: 100%;
  width: 100%;
  top: 0;
  left: 0;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  cursor: pointer;
  z-index: 2;
}

#container #menu-wrap .toggler:hover + .dots > div,
#container #menu-wrap .toggler:hover + .dots > div:after,
#container #menu-wrap .toggler:hover + .dots > div:before {
  background-color: rgba(49, 49, 49, 0.6);
}

#container #menu-wrap .toggler:checked:hover + .dots > div,
#container #menu-wrap .toggler:checked:hover + .dots > div:after,
#container #menu-wrap .toggler:checked:hover + .dots > div:before {
  background-color: rgba(49, 49, 49, 0.6);
}

#container #menu-wrap .toggler:checked ~ .menu {
  opacity: 1;
  visibility: visible;
  width: 76px;
  height: 40px;
}

#container #menu-wrap .toggler:checked ~ .menu ul .dropDownButton {
  opacity: 1;
  visibility: visible;  
}

#container #menu-wrap .toggler:checked ~ .menu ul .dropDownButton:hover {
  color: #005288;
}


#container #menu-wrap .toggler:not(:checked) ~ .menu ul .dropDownButton {
  opacity: 0;
  visibility: hidden;
}
</style>
