<template>
    <div>  
        
        <div class="wrapper" >
            <h2>Report</h2>
            <div class="input-group">                
                <input type="text" placeholder="Email of user you want to report" v-model="ReportEmail">
            </div>
            <br>
            <textarea class="cardContent" type="text" placeholder="Reason to report the user" v-model="Reason"></textarea>
            <br>
            <div @click="SendReport()" class="button">Submit</div>
            
            <div v-if="Sent == true"> 
                Your request will be reviewed by one of our administrators.
            </div>                    
        </div>
    </div>
</template>

<script>

export default {
    name: "reportPage",
    data() {
        return {
            ReportEmail: "",
            Reason: "",
            Sent: false
        }
    },
    components: {
    },
    mounted() {
    },
    methods: {
        SendReport() {
            console.log(this.ReportEmail)
            console.log(this.Reason)

            let ban = {
                "email": this.ReportEmail,
                "reason": this.Reason,
                "submitterID": 0
            }

            let credentials = this.$parent.username + ":" + this.$parent.password;
            console.log(credentials)
            fetch("https://localhost:5148/Ban",
            {
                headers: {
                'Accept': 'text/plain',
                'Content-Type': 'application/json',
                'Authorization' : "Basic " + btoa(credentials)

                },
                method: "POST",
                body: JSON.stringify(ban)
            })
            .then((response) => response.json())
            .then((data) => {
                console.log("Success:", data);
                this.Sent = true
            })
            .catch((error) => {
                console.error("Error:", error)
            })

        }

    }
}
</script>
