<template>
    <div class="loggedNav">
        <v-container>
            <v-layout align-center justify-center row fill-height>
                <router-link class="loggedLink" to="/menu">Menu</router-link>
                <router-link class="loggedLink" to="/users">Users</router-link>
                <router-link class="loggedLink" to="/clients">Clients</router-link>
                <router-link class="loggedLink" to="/pets">Pets</router-link>
                <router-link class="loggedLink" to="/visits">Visits</router-link>
            </v-layout>
        </v-container>
    </div>  
</template>

<style lang="scss">
    .loggedNav {
        background-color: rgba(30, 29, 41, .9);
        .loggedLink {
            text-decoration: none;
            color:#D8C8CB;
            font-family: 'Comfortaa', sans-serif;
            padding: 10px 20px;
            transition: .6s;
        }
        .loggedLink:hover { 
            background-color: rgb(30, 29, 41); 
        }
    }
</style>

