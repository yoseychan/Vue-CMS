<template>
    <div class="users">
    <v-content>
        <Nav/>
    </v-content>
    <v-container>
        <h1>Users</h1>
        <div class="newUser"><router-link to="/newuser"><v-btn dark color="#1e1d29"><v-icon color="#A9A2AA">add</v-icon></v-btn></router-link></div>
        <v-layout align-start justify-center row fill-height v-for="(user, index) in users" v-bind:key="index">
            <v-flex xs12 sm10 lg8 class="docSpace" >
                <v-card class="docSquare">
                   <div class="docLeft">
                        <div class="docAvatar"></div>
                    </div>
                    <form class="docRight"> 
                        <div class="docDetails">
                            <div class="docInfo">
                                <h2> <input type="text" name="firstName" v-model="user.firstName"> <input type="text" name="lastName" v-model="user.lastName"></h2>
                                <p> <input type="text" name="username" v-model="user.username"></p>
                            </div>
                            <div class="docInfo">
                                <p><input type="text" name="role" v-model="user.role"></p>
                            </div>
                        </div>
                        <div class="docDetails ">
                            <p class="docPerm"> {{ user.permission }}</p>
                        </div>
                        <div class="editor">
                            <div @click="deleteIt(user)"><v-icon small color="#A9A2AA">fas fa-times</v-icon></div>
                            <div @click="submitIt(user)"><v-icon  small color="#A9A2AA">fas fa-save</v-icon></div>
                        </div>
                    </form>
                </v-card>
            </v-flex>
        </v-layout>
    </v-container>   

    </div>
</template>

<style scoped lang="scss">
.users {
    min-height: 850px;
    background-color:#DFDFDF;
    h1 {
        font-family: 'Fredericka the Great', cursive;
        font-size: 48px;
        margin: 20px 0;
        color: #1e1d29;
        text-align: center;
    }
    .newUser {
        text-decoration: none;
        color: #1E1D29;
        text-align:center;
    }
    .docSpace {
        margin: 15px 0;
        background-color: #A9A2AA;     
        .docSquare {
            font-family: 'Comfortaa', sans-serif;
            color: #1e1d29;
            display: flex;
            .docLeft {
                margin-left: 10px;
                .docAvatar {
                    width: 120px;
                    height:120px;
                    background-color: #1e1d29;
                    margin: 10px;
                    text-align: center;
                }
            }
            .editor {
                width: 8%;
                margin: 5px 15px 0 15px;  
            }
            .editor > *{
                display: inline-block;
                transition: .6s;
                text-align: center;
                margin-bottom: 5px;
                background-color: #1E1D29;  
                padding: 5px 0;
                width: 100%;
            }
            .editor > *:hover {
                cursor: pointer;
                background-color: rgba(30, 29, 41, 0.76);
            }
            .docRight {
                display: flex;
                justify-content: space-between;
                margin: 0 20px 0 10px ;
                width: 100%;
                .docDetails {
                    margin: 10px 0 0 0;
                    font-family: 'Comfortaa', sans-serif;
                    color: #1e1d29;
                    .docInfo {
                        p {
                            font-weight: 100;
                            margin: 10px 0;
                            text-align: left;
                            font-size: 16px;
                        }
                        .docPerm {
                            margin-top: 60px;
                            text-align: right;
                        }
                        h2 {
                            font-size: 24px;
                            width: 40%;
                        }
                    }
                }
            }
        }
    }
}

</style>

<script>
import Nav from '../components/Nav.vue'
import axios from "axios"

export default {
    components: {
        Nav
    },
    data() {
        return {
            show: false,
            users: [],

        }
    },
    methods: {
        submitIt(user){
            axios.post('http://localhost:8888/backEnd/api/users/update',
                {
                    id: user.id,
                    firstName: user.firstName,
                    lastName: user.lastName,
                    username: user.username,
                    role: user.role
                },
                {headers: {'Content-Type': 'application/x-www-form-urlencoded', 'Accept': 'application/json'}
                }
            )
                .then( () => {
                    this.$router.go()
            })

        },
        deleteIt(user){
            axios.post('http://localhost:8888/backEnd/api/users/delete',
                {
                    id: user.id
                },
                {headers: {'Content-Type': 'application/x-www-form-urlencoded', 'Accept': 'application/json'}
                }
            )
            .then(() => {
                this.$router.go()
            })
        }
    },
    mounted() {

        axios.get('http://localhost:8888/backEnd/api/users')
            .then(response => {
                this.users = response.data;
            })
        .catch(function() {
            console.log('smth wrong');
        })
    } 
}
</script>