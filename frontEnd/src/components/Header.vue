    
<template>
    <header>
        <v-container>
           <v-layout class="align-center justify-space-between">
                <div class="hnav">
                    <router-link class ="petvet" to="/">Peterinar</router-link>
                </div>
                <div class="hnav">
                    <router-link to="/login" class="account">Login</router-link>
                </div>
            </v-layout>
        </v-container>
    </header>
</template>
<style lang="scss">
header {
    width: 100%;
    background-color: #1E1D29;
    height: 60px;
    .hnav {
        font-family: 'Comfortaa', cursive;
        .petvet {
            text-decoration: none;
            font-size: 40px;
            font-family: 'Fredericka the Great', cursive;
            color: #D8C8CB;
        }
        .account {
            text-decoration: none;
            color: #D8C8CB;
            padding: 10px;
            font-size: 18px;
            transition: .5s;              
        }
        .account:hover {
            font-weight: 700;   
            color:rgb(107, 71, 105);     
        }
    }    
}
</style> 

<script>
export default {
    
}
</script>
