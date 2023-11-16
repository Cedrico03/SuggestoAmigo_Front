    

<template>
    <div>
        <!-- <h1><u>Suggesto Amigo</u></h1> -->
        <div id="noAcc">
            
            <img id= "logoImg" src="../assets/AmigoLogo.png" alt="Logo" @click="$emit('changePageEvent', 'friends')"> 
            
            <div id="containerHeader">
                <div id="menu-wrapHeader">
                    <input type="checkbox" class="togglerHeader" />
                    <div class="dotsHeader">
                        <div></div>
                    </div>
                    <div class="menuHeader">
                        <div>
                        <ul>
                            <li style="background-color: #ffffff;" id="headerButton" @click="$emit('changePageEvent', 'feed')">Feed</li>
                            <li style="background-color: #ffffff;" id="headerButton" @click="$emit('changePageEvent', 'friends')">Friends</li>
                            <li style="background-color: #ffffff;" id="headerButton" @click="$emit('changePageEvent', 'myProfile')">Profile</li>
                            <li style="background-color: #ffffff;" id="headerButton" @click="$emit('changePageEvent', 'report')">Report</li>
                        </ul>
                        </div>
                    </div>
                </div>
            </div>                
        </div>
    </div>
</template>

<script>

export default {
    name: "HeaderAccDots",
    
    methods: {
        reloadPage() {
        window.location.reload();
        }
    }
}
</script>

<style>
#noAcc{
    display: flex;
    height: 106px;
    margin: 0 0 50px 0;
    padding: 0;
    background-color: #3F72AF;
    border-bottom: 1px solid black;
}
#logoImg{
    width: 85px;
    height: 85px;
    float: left;
    margin: 10px 0 10px 10%;
    cursor:pointer;
}
#headerButtons{
    position: absolute;
    display: flex;
    right: 10%;
    margin: 32px 0 0 10px;
}
#headerButton{
    font-size:  14px;
    cursor: pointer;
    
    width: 52px;
    margin: auto;/*align in header bar*/ 
    margin-left: 10px;/*space between the buttons */
    padding: 10px;/* align text in bunnen vertically */
    background-color: #DBE2EF;
    border-radius: 5px;
}
#headerButton:hover{
    background-color:#c1c9d9 ;
}

#headerbutton:active {
    transform: translateY(8px);
}

#containerHeader #menu-wrapHeader {
  position: absolute;
  height: 70px;
  width: 60px;
  position: absolute;
  display: flex;
  right: 10%;
  margin: 20px 0 0 10px;
}

#containerHeader #menu-wrapHeader .dotsHeader {
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

#containerHeader #menu-wrapHeader .dotsHeader > div,
#containerHeader #menu-wrapHeader .dotsHeader > div:after,
#containerHeader #menu-wrapHeader .dotsHeader > div:before {
  height: 6px;
  width: 50px;
  background-color: black;
  border-radius: 15%;
}

#containerHeader #menu-wrapHeader .dotsHeader > div {
  position: relative;
}

#containerHeader #menu-wrapHeader .dotsHeader > div:after {
  content: "";
  position: absolute;
  bottom: 20px;
  left: 0;
}

#containerHeader #menu-wrapHeader .dotsHeader > div:before {
  content: "";
  position: absolute;
  top: 20px;
  left: 0;
}

#containerHeader #menu-wrapHeader .menuHeader {
  position: absolute;
  right: -53px;
  top: 86.5px;
  width: 180px;
  height: 300px;
  border:black 1px solid;
  border-top: none;
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
  align-items: center;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  justify-content: center;
  opacity: 0;
  visibility: hidden;
}

#containerHeader #menu-wrapHeader .menuHeader ul {
  list-style: none;
  padding: 5px 10px;
}

#containerHeader #menu-wrapHeader .menuHeader ul li {
  align-content: center;  
  margin:10px;
  width: 100px;
  height:20px;
  cursor: pointer;
}

#containerHeader #menu-wrapHeader .menuHeader ul li .dropDownButtonHeader {
    text-decoration: none;
    color: rgba(49, 49, 49, 0.85);
    opacity: 0;
}

#containerHeader #menu-wrapHeader .togglerHeader {
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

#containerHeader #menu-wrapHeader .togglerHeader:hover + .dotsHeader > div,
#containerHeader #menu-wrapHeader .togglerHeader:hover + .dotsHeader > div:after,
#containerHeader #menu-wrapHeader .togglerHeader:hover + .dotsHeader > div:before {
  background-color: rgba(49, 49, 49, 0.6);
}

#containerHeader #menu-wrapHeader .togglerHeader:checked:hover + .dotsHeader > div,
#containerHeader #menu-wrapHeader .togglerHeader:checked:hover + .dotsHeader > div:after,
#containerHeader #menu-wrapHeader .togglerHeader:checked:hover + .dotsHeader > div:before {
  background-color: rgba(49, 49, 49, 0.6);
}

#containerHeader #menu-wrapHeader .togglerHeader:checked ~ .menuHeader {
  opacity: 1;
  visibility: visible;
}

#containerHeader #menu-wrapHeader .togglerHeader:checked ~ .menuHeader ul .dropDownButtonHeader {
  opacity: 1;
  visibility: visible;  
}

#containerHeader #menu-wrapHeader .togglerHeader:checked ~ .menuHeader ul .dropDownButtonHeader:hover {
  color: #005288;
}


#containerHeader #menu-wrapHeader .togglerHeader:not(:checked) ~ .menuHeader ul .dropDownButtonHeader {
  opacity: 0;
  visibility: hidden;
}
</style>