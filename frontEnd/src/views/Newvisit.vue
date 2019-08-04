<template>
    
    <div class="newform">
        <v-content>
            <Nav/>
        </v-content>
        <v-container>
            
            <v-layout align-start justify-center row fill-height >
                <v-flex xs12 sm10 md6>
                    <v-card>
                        <h1>New Visit</h1>
                        <form action="" class="form">
                            <select name="user" id="user" v-model="newvisit.users_id">
                                <option value="" > -- select a User-- </option>
                                <option v-bind:key="u" v-for="(user, u) in users" :value="user.id">
                                    {{ user.id }} {{ user.firstName }} {{user.lastName}}
                                </option>
                            </select>
                            <input id="time" name="time" type="text" required v-model="newvisit.time" placeholder="XX:YY">
                            <input id="date" name="date" type="text" required v-model="newvisit.date" placeholder="DD/MM/YYYY">
                            <input id="description" name="description" type="text" required v-model="newvisit.description" placeholder="Description">
                            <select name="clients" id="clients" v-model="newvisit.clients_id">
                                <option value="" > -- select a Client -- </option>
                                <option v-bind:key="b" v-for="(client, b) in clients" :value="client.id">
                                    {{ client.id }} {{ client.firstName }} {{ client.lastName }}
                                </option>
                            </select>
                            <select name="pets" id="pets" v-model="newvisit.pets_id">
                                <option value="" > -- select a Pet -- </option>
                                <option v-bind:key="a" v-for="(pet, a) in pets" v-if="newvisit.clients_id == pet.clients_id" :value="pet.id">
                                    {{ pet.id }} {{ pet.name }}
                                </option>
                            </select>

                            <div @click="addNewVisit" class="newvisit"><router-link class="visitlink" to="/visits">Add a new user </router-link></div>
                            
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
            margin: 20px auto 0;
            width: 400px;
        }
        .form {
            min-height: 500px;
            input::placeholder {
                color: #1E1D29;
                transition: .9s;
            }
            input:focus::placeholder {
                opacity: 0;
            }
            .newvisit {
                padding: 10px 55px;
                background-color: rgba(30, 29, 41, .8);
                transition: .6s;
                margin-top: 50px;

                .visitlink {
                    text-decoration: none;
                    color: #D8C8CB;
                    padding: 12px 70px;
                }
            }
            .newvisit:hover {
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
            clients: [],
            users: [],
            pets: [],
            newvisit: {
                time: "",
                date: "",
                description: "",
                pets_id: "",
                clients_id: "",
                users_id: ""
            }

       }
    },
    methods: {
        addNewVisit() {
            axios.post('http://localhost:8888/backEnd/api/visits',
                {
                    time: this.newvisit.time,
                    date: this.newvisit.date,
                    description: this.newvisit.description,
                    pets_id: this.newvisit.pets_id,
                    clients_id: this.newvisit.clients_id,
                    users_id: this.newvisit.users_id

                },
                {
                    headers: {'Content-Type': 'application/x-www-form-urlencoded', 'Accept': 'application/json'}
                }
            )
        }
    },
    mounted() {
        axios.all([
            axios.get('http://localhost:8888/backEnd/api/clients'),
            axios.get('http://localhost:8888/backEnd/api/pets'),
            axios.get('http://localhost:8888/backEnd/api/users')
        ])
        .then(axios.spread((clientsApi, petsApi, usersApi) => {
            this.clients = clientsApi.data;
            this.pets = petsApi.data;
            this.users = usersApi.data;
        }))
    }

    
}
</script>