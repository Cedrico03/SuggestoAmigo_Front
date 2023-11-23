<template>
    <div class="wrapper">
        <h1>About Suggesto Amigo</h1>

        <div style="margin: 0px 10px; text-align: left;">
            <p>Welcome to Suggesto Amigo, the <b>next-gen</b> social media platform that redefines online connectivity and expression!
                <br>
                At Suggesto Amigo, we believe in creating a digital space where users can engage, share, and connect with respect and creativity.
                <br>
                By choosing to be a part of our community, you embrace a new era of social interaction.</p>

            <h2>Our Commitment</h2>

            <p><strong>Effective Date: October 26, 2023</strong></p>

            <h3>1. Eligibility</h3>
            To embark on this digital adventure, users must be 18 years of age or older.
            <br>
            We value your privacy and collect only the necessary data:
            
            <ul>
                <li>name</li>
                <li>last name</li>
                <li>hashed password</li>
                <li>email</li>
                <li>post data</li>
            </ul>

            <h3>2. User Conduct</h3>
            <p>A thriving community begins with respectful behavior.
                Any account not adhering to our standards may be suspended or banned.
                Prohibited content includes NSFW and disrespectful content.
                <br>
                <br>
                Bullying and harassment have no place in our community.</p>

            <h3>3. Consequences for Violations</h3>
            <p>Violations may lead to being banned from our platform. As a playful touch,
                misbehavior may prompt a humorous email to your parents (⊙_⊙).</p>

            <h3>4. Data Privacy</h3>
            <p>Unlike other platforms, we don't sell your data or track your every move.
                <br>
                We believe in collecting only the bare minimum because, let's face it, we're next-gen.</p>

            <h3>5. Content Ownership</h3>
            <p>You own what you post. Take pride in your creations, and remember, you're responsible for the consequences of your content.</p>

            <h3>6. Account Removal</h3>
            <p>We're working on an account removal feature.
                <br>
                Need assistance? Contact us at <a href="mailto:suggesto.amigo@gmail.com" style="color: aqua;">suggesto.amigo@gmail.com</a>; we're here to help promptly.</p>

            <h3>7. Updates to Terms</h3>
            <p>Stay informed. If we update our terms, you'll find the changes here and on the registration page.
                <br>
                (Last update: October 26, 2023)</p>
                <br>
                <b><u @click="$emit('changePageEvent', 'tos')">Current Terms of Service</u></b>

            <h2>Join the Next-Gen Experience!</h2>
            <p>At Suggesto Amigo, we're not just a social media platform; we're a community of creators, dreamers, and innovators.
                <br>
                Connect with us on this exciting journey of digital expression.
                <br>
                Your adventure begins now!</p>

            <p>Ready to join? <b><u @click="$emit('changePageEvent', 'signup')">Sign up today</u></b> and be a part of the next-gen social revolution!</p>
         </div>
    </div>
</template>

<script>

    export default {
        name: "AboutUsPage",
        data() {
            return {
            }
        },
        components: {
        },
        mounted() {
        },
        methods: {

        }

    }
</script>

<style>

</style>