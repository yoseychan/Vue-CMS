<template>
    
    <div class="newform">
        <v-content>
            <Nav/>
        </v-content>
        <v-container>
            
            <v-layout align-start justify-center row fill-height >
                <v-flex xs12 sm10 md6>
                    <v-card>
                        <h1>New user</h1>
                        <form  class="form">
                            <input id="firstName" name="firstName" type="text" v-model="newuser.firstName" required placeholder="First Name">
                            <input id="lastName" name="lastName" type="text" v-model="newuser.lastName" required placeholder="Last Name">
                            <input id="username" name="username" type="text" v-model="newuser.username" required placeholder="Username">
                            <input id="password" name="password" type="text" v-model="newuser.password" required placeholder="Password">
                            <input id="role" name="role" type="text" v-model="newuser.role" required placeholder="Role">
                            <input id="permission" name="permission" type="text" v-model="newuser.permission" required placeholder="Permissions">

                            <div @click="addNewUser" class="newuser"><router-link class="userlink" to="/users">Add a new user </router-link></div>

                        </form>
                    </v-card>
                </v-flex>
            </v-layout>
        </v-container>
    </div>
</template>


<style scoped lang="scss">
    .newform {
        min-height: 850px;
        background-color:#DFDFDF;
        h1 {
            margin: 40px 0 20px 0;
            font-family: 'Comfortaa', sans-serif;
            text-align: center;
            color:#1E1D29;
        }
        .form > *{
            display: block;
            font-size: 18px;
            font-family: 'Comfortaa', sans-serif;
            text-align: center;
            background-color: rgba(216, 200, 203, .8);
            color: #1E1D29;
            padding: 12px 20px;
            margin: 20px auto 0 auto;
            width: 400px;
        }
        .form {
            min-height: 600px;
            input::placeholder {
                color: #1E1D29;
                transition: .9s;
            }
            input:focus::placeholder {
                opacity: 0;
            }
            .newuser {
                padding: 10px 55px;
                background-color: rgba(30, 29, 41, .8);
                transition: .6s;
                margin-top: 50px;

                .userlink {
                    text-decoration: none;
                    color: #D8C8CB;
                    padding: 12px 70px;
                }
            }
            .newuser:hover {
                background-color:rgb(30, 29, 41);
                color: rgb(158, 134, 157);
                cursor: pointer;
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
                newuser: {
                    firstName: "",
                    lastName: "",
                    username: "",
                    password: "",
                    role: "",
                    permission: ""

                }
            }
        },
        methods: {
            addNewUser(){
                axios.post('http://localhost:8888/backEnd/api/users',
                    {
                        firstName: this.newuser.firstName,
                        lastName: this.newuser.lastName,
                        username: this.newuser.username,
                        password: this.newuser.password,
                        role: this.newuser.role,
                        permission: this.newuser.permission
                    },
                    {headers: {'Content-Type': 'application/x-www-form-urlencoded', 'Accept': 'application/json'}
                    }
                )
            }
        }


    }
</script>