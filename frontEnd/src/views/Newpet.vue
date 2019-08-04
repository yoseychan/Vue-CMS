<template>
    
    <div class="newform">
        <v-content>
            <Nav/>
        </v-content>
        <v-container>
            
            <v-layout align-start justify-center row fill-height >
                <v-flex xs12 sm10 md6>
                    <v-card>
                        <h1>New pet</h1>
                        <form action="" class="form">
                            <input id="name" name="name" type="text" v-model="newpet.name" required placeholder="Name">
                            <input id="age" name="age" type="number" v-model="newpet.age" required placeholder="Age">
                            <input id="animal" name="animal" type="text" v-model="newpet.animal" required placeholder="Animal type">
                            <input id="breed" name="breed" type="text" v-model="newpet.breed" required placeholder="Breed">
                            <input id="gender" name="gender" type="text" v-model="newpet.gender" required placeholder="Gender">
                            <select name="client" id="clientsid" v-model="newpet.clients_id" required>
                                <option value=""> -- Select a client -- </option>
                                <option v-for="(client,index) in clients" v-bind:key="index" :value="client.id" >{{client.firstName}} {{client.lastName}}</option>
                            </select>
                            <div @click="addNewPet" class="newpet"><router-link class="petlink" to="/pets">Add a new user </router-link></div>
                            
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
            .newpet {
                padding: 10px 55px;
                background-color: rgba(30, 29, 41, .8);
                transition: .6s;
                margin-top: 50px;

                .petlink {
                    text-decoration: none;
                    color: #D8C8CB;
                    padding: 12px 70px;
                }
            }
            .newpet:hover {
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
            newpet: {
                name: "",
                animal: "",
                breed: "",
                gender: "",
                age: "",
                clients_id: ""
            }
        }
    },
    methods: {
        addNewPet(){
            axios.post('http://localhost:8888/backEnd/api/pets',
                {
                    name: this.newpet.name,
                    animal: this.newpet.animal,
                    breed: this.newpet.breed,
                    gender: this.newpet.gender,
                    age: this.newpet.age,
                    clients_id: this.newpet.clients_id
                },
                {headers: {'Content-Type': 'application/x-www-form-urlencoded', 'Accept': 'application/json'}
                }
            )
        }
    },
    mounted() {
        axios
            .get('http://localhost:8888/backEnd/api/clients')
            .then(response => {
                this.clients = response.data;
            })
            .catch(function() {
                console.log('smth wrong');
            })
    }


}
</script>