<template>
    <div class="clients">
    <v-content>
        <Nav/>
    </v-content>
    <v-container>
        <h1>Clients</h1>
       <div class="newClient"><router-link to="/newclient" ><v-btn dark color="#1e1d29"><v-icon color="#A9A2AA">add</v-icon></v-btn></router-link></div>
        <v-layout align-start justify-center row fill-height v-for="(client, index) in clients" v-bind:key ="index" >
            <v-flex xs12 sm10 lg8 class="clientSpace">
                <v-card>
<!-- the client info part  -->
                <div class="clientSquare">
                    <div class="clientLeft">
                        <div class="clientAvatar"></div>
                    </div>
                    <form class="clientRight"> 
                        <div class="clientDetails">
                            <h2><input type="text" name="firstName" v-model="client.firstName"><input type="text" name="lastName" v-model="client.lastName"></h2>
                            <p><input type="text" name="phone" v-model="client.phone"></p>
                        </div>
                        <div class="clientDetails clientAddress">
                            <p class="clientAddress"> <input type="text" name="street" v-model="client.street"></p>
                            <p class="clientAddress"> <input type="text" name="city" v-model="client.city"></p>
                            <p class="clientAddress"> <input type="text" name="zip" v-model="client.zip"> </p>
                        </div>
                         <div class="editor">
                            <div @click="deleteClient(client)" ><v-icon small color="#A9A2AA">fas fa-times</v-icon></div>
                            <div @click="changeClient(client)" ><v-icon small color="#A9A2AA">fas fa-save</v-icon></div>
                        </div>
                    </form>
                </div>
<!-- the pet info part -->
                <div class="clientSquareExtra">
                    <div class="show"><v-btn icon @click="show = !show">
                        <v-icon>{{ show ? 'expand_less' : 'expand_more' }}</v-icon>
                    </v-btn></div>
                    
                    <v-expand-transition>
                    <div v-show="show">

                        <div class="clientPetDetails" v-for="(pet, i) in pets" v-bind:key="i">
                            <div class="petPic" v-if="client.id == pet.clients_id"></div>
                            <div class="clientPet">
                                <p v-if="client.id == pet.clients_id" >{{ pet.name }}</p>
                                <p v-if="client.id == pet.clients_id" >{{ pet.animal }}</p>
                                <p v-if="client.id == pet.clients_id" >{{ pet.breed }}</p>
                                <p v-if="client.id == pet.clients_id" > Age: {{ pet.age }} (years)</p>
                            </div>
                        </div>
                    </div>
                    </v-expand-transition>
                </div>
                </v-card>
            </v-flex>  
        </v-layout>
    </v-container>
    </div>
</template>

<style scoped lang="scss">

.clients {
    min-height: 850px;
    background-color:#DFDFDF;
    h1 {
        font-family: 'Fredericka the Great', cursive;
        font-size: 48px;
        margin: 20px 0;
        color: #1e1d29;
        text-align: center;
    }
    .newClient {
        color: #1E1D29;
        text-align:center;
    }
    .clientSpace {
        margin: 20px 0;
        background-color: #A9A2AA;
        .clientSquare {
            font-family: 'Comfortaa', sans-serif;
            color: #1e1d29;
            display: flex;
            .clientLeft {
                .clientAvatar {
                    width: 120px;
                    height:120px;
                    background-color: #1e1d29;
                    margin: 10px;
                    text-align: center;
                }
            }
            .clientRight {
                display: flex;
                justify-content: space-between;
                margin: 0 10px ;
                width: 100%;
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
            .petLeft {
                .petAvatar {
                    width: 90px;
                    height: 90px;
                    background-color: #1e1d29;
                    border-radius: 50%;
                    margin: 10px;
                    text-align: center;                
                }
            }
                .clientDetails {
                    margin: 10px 0 0 0 ;
                    h2 {
                        font-size: 28px;
                        margin: 0 0 20px 0;
                    }
                    p {
                        font-size: 16px;
                        margin: 0;                         
                    }
                    .clientAddress {
                        font-size: 14px;
                        margin: 0;
                        text-align: right;
                        font-weight: 0;
                    }
                }       
            }
        }
    }
    .clientSquareExtra {
        background-color: rgba(255, 255, 255, 0.315);
        .show {
        text-align: center;
        }
        .clientPetDetails {
            border-bottom: 1px solid rgba(30, 29, 41, 0.137);
            display: flex;
            justify-content: space-between;
            align-items: center;    
            .petPic {
                min-height:65px;
                min-width:65px;
                border-radius: 50%;
                background-color: #1e1d29;
                margin: 5px;
                display: inline-block;
            } 
            .clientPet {
                width:100%;
                display: flex;
                justify-content: space-between;
                p:last-of-type{
                    margin-right: 10px;
                }
            }
            p:first-of-type {
                margin-left: 20px;
            }
            p{
                display: inline-block;
                margin: 0;
                font-size: 18px;
                width: 25%;
                text-align: center;
            }
            p:last-of-type {
                text-align: right;
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
            clients: [],
            pets: []
        }
    },
    methods: {
        changeClient(client){
            axios.post('http://localhost:8888/backEnd/api/clients/update',
                {
                    id: client.id,
                    firstName: client.firstName,
                    lastName: client.lastName,
                    phone: client.phone,
                    street: client.street,
                    city: client.city,
                    zip: client.zip
                },
                {headers: {'Content-Type': 'application/x-www-form-urlencoded', 'Accept': 'application/json'}
                }
            )
                .then(() => {
                    this.$router.go()
                })

        },
        deleteClient(client){
            axios
                .post('http://localhost:8888/backEnd/api/clients/delete',
                    {
                        id: client.id
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

        axios.all([
            axios.get('http://localhost:8888/backEnd/api/clients'),
            axios.get('http://localhost:8888/backEnd/api/pets')
        ])
        .then(axios.spread((clientsApi, petsApi) => {
            this.clients = clientsApi.data;
            this.pets = petsApi.data;
        }))    
    }

    
}
</script>