<template>
    <div class="main">
        <v-container>
            <v-layout  align-center justify-center row fill-height class="hero">
                <v-flex sm12  >
                    <form action="" class="px-3 form">
                        <input class="loginForm" name="username" id="username" type="text" placeholder="Username" required >
                        <input class="loginForm" name="password" id="password" type="password" placeholder="Password" required>
                        <button class="loginBtn" @click="validate">Login</button>
                    </form>
                </v-flex>
            </v-layout>
        </v-container>
    </div>    
</template>


<style lang="scss">
.form {
    font-size: 18px;
    font-family: 'Comfortaa', sans-serif;
    text-align: center;
    input {
        background-color: rgba(216, 200, 203, .8);
        color: #1E1D29;
        display: block;
        padding: 12px 20px;
        margin: 0 auto;
        margin-top: 20px;
        text-align: center;
       
    }
    input::placeholder {
        color: #1E1D29;
        transition: .9s;
    }
    input:focus::placeholder {
        opacity: 0;
    }     
    .loginBtn {
        margin-top: 20px;
        padding: 10px 55px;
        background-color: rgba(30, 29, 41, .7);
        transition: .6s;
        color: #D8C8CB;
    }
    .loginBtn:hover {
        background-color:rgb(30, 29, 41);
        color: rgb(158, 134, 157);
 
    }


} 


</style>


<script>
export default {
    methods: {
        validate: function() {
            var username = document.getElementById('username').value;
            var password = document.getElementById('password').value;
            var pass = false;

            if (username !== "admin" && password !== "admin1234") {
                alert('Not Allowed');
                pass = false;
            }
            
            if (username == "admin" && password == "admin1234"){
                pass = true;                
            }

            if(pass == true) {
                this.$router.push({ path: '/menu' });
            }
        }
    }
}
</script>
