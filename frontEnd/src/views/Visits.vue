<template>
    <div class="visits">
        <v-content>
            <Nav/>
        </v-content>
        <v-container>
            <h1>Visits</h1>
            <div class="newVisit"><router-link to="/newvisit"><v-btn dark color="#1e1d29"><v-icon color="#A9A2AA">add</v-icon></v-btn></router-link></div>
            <v-layout align-start justify-center row fill-height v-bind:key="i" v-for="(visit, i) in visits">
                <v-flex xs12 sm10 lg8 class="visitSpace" >

                    <v-card class="visitSquare">
                        <div class="visitLeft">
                            <div class="visitAvatar"></div>
                        </div>
                        <div class="visitRight">
                            <div class="visitDetails">
                                <div class="visitInfo" v-for=" (client, a) in clients" v-bind:key="a">
                                    <h2 v-if="client.id == visit.clients_id">{{ client.firstName }} {{ client.lastName }}</h2>
                                    <p v-if="client.id == visit.clients_id"> {{ client.phone }}</p>
                                </div>
                                <div class="visitInfo" v-for="(pet, b) in pets" v-bind:key="b">
                                    <p v-if="pet.id == visit.pets_id">{{ pet.name }}</p>
                                    <p v-if="pet.id == visit.pets_id"><input type="text" v-model="visit.description"></p>
                                </div>

                            </div>
                            <div class="visitDetails ">
                                <p class="time"><input type="text" name="time" v-model="visit.time"></p>
                                <p class="time"><input type="text" name="date" v-model="visit.date"></p>
                                <div class="visitInfo">
                                    <p class="visitDoctor">Dr.Yankovic</p>
                                </div>
                            </div>

                        </div>
                        <div class="editor">
                            <div @click="deleteVisit(visit)"><v-icon small color="#A9A2AA">fas fa-times</v-icon></div>
                            <div @click="changeVisit(visit)"><v-icon small color="#A9A2AA">fas fa-save</v-icon></div>
                        </div>
                    </v-card>
                </v-flex>
            </v-layout>
        </v-container>
    </div>
</template>

<style  scoped lang="scss">
.visits {
    min-height: 850px;
    background-color:#DFDFDF;
    h1 {
        font-family: 'Fredericka the Great', cursive;
        font-size: 48px;
        margin: 20px 0;
        color: #1e1d29;
        text-align: center; 
    }
    .newVisit {
        color: #1E1D29;
        text-align:center;
    }
    .visitSpace {
        margin: 15px 0;  
        .visitSquare {
            font-family: 'Comfortaa', sans-serif;
            color: #1e1d29;
            display: flex;
            .visitLeft {
                margin-left: 10px;
                .visitAvatar {
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
            .visitRight {
                display: flex;
                justify-content: space-between;
                margin: 0 20px 0 10px ;
                width: 100%;
                
                .visitDetails {
                    margin: 10px 0 0 0;
                    font-family: 'Comfortaa', sans-serif;
                    color: #1e1d29;
                    .visitInfo {
                        p {
                            font-weight: 100;
                            margin: 10px 0;
                            text-align: left;
                            font-size: 16px;
                        }
                        .visitDoctor {
                            margin-top: 60px;
                            text-align: right;
                        }
                        h2 {
                            font-size: 24px;
                        }
                    }
                    p{
                        font-weight: 700;
                        margin: 0;
                        text-align: left;
                        font-size: 18px;
                    }
                    .time {
                        input {
                            text-align: right;
                            width: 100%;
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
            visits: [],
            pets: [],
            clients: [],
            users: []
        }
    },
    methods: {
        changeVisit(visit) {
            axios.post('http://localhost:8888/backEnd/api/visits/update',
                {
                    id: visit.id,
                    description: visit.description,
                    time: visit.time,
                    date: visit.date
                },
                {headers: {'Content-Type': 'application/x-www-form-urlencoded', 'Accept': 'application/json'}
                }
            )
                .then(() => {
                    this.$router.go()
                })
        },
        deleteVisit(visit) {
            axios
                .post('http://localhost:8888/backEnd/api/visits/delete',
                    {
                        id: visit.id
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
            axios.get('http://localhost:8888/backEnd/api/pets'),
            axios.get('http://localhost:8888/backEnd/api/visits'),
            axios.get('http://localhost:8888/backEnd/api/users')
        ])
        .then(axios.spread((clientsApi, petsApi, visitsApi, usersApi) => {
            this.clients = clientsApi.data;
            this.pets = petsApi.data;
            this.visits = visitsApi.data;
            this.users= usersApi.data;
        }))
    }   
}
</script>
