<template>
    <div>        
        <div class="wrapper">
            <h1>Add friend page</h1>
            <div class="input-group">
                <input  type="text" v-model="addFriendEmail" placeholder="friend's email">
            </div>
            <div @click="addFriendByEmail()" class="button">Send friend request</div>

        </div>

    </div>
</template>

<script>

export default {
    name: "AddFriendPage",
    data() {
        return {
            addFriendEmail: ""
        }
    },
    components: {
        
    },
    mounted() {

    },
    methods: {
        addFriendByEMail() {

        }
    }

}
</script>