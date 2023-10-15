<template>
    <div>
        <div id="backFriendsPageButtonDiv">
            <div id="backFriendsPageButton" @click="$emit('changePageEvent', 'friends')">⬅</div>
        </div>
    </div>
</template>

<script>
export default {
    name: "backButtonFriends",
    methods: {
        reloadPage() {
        window.location.reload();
        }
    }

}
</script>

<style>
#backFriendsPageButton{
    font-size:  14px;
    cursor: pointer;
    width: 20px;
    margin:5px 70px 0px 10px;
    
    
    padding: 5px;/* align text in button vertically */
    background-color: #DBE2EF;
    border-radius: 5px;
}
</style>