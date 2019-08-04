<template>
    <div class="pets">
    <v-content>
        <Nav/>
    </v-content>
    <v-container>
        <h1>Pets</h1>
        <div class="newPet"><router-link to="/newpet"><v-btn dark color="#1e1d29"><v-icon color="#A9A2AA">add</v-icon></v-btn></router-link></div>
        <v-layout align-start justify-center row fill-height v-bind:key="index" v-for="(pet, index) in pets">
            <v-flex xs12 sm10 lg8 class="petSpace">
                <v-card>
<!-- pet basic info -->
                <div class="petSquare">
                   <div class="petLeft">
                        <div class="petAvatar"></div>
                    </div>
                    <form class="petRight"> 
                        <div class="petDetails">
                            <div class="petInfo petInfoTop" v-if="client.id == pet.clients_id" v-bind:key="a" v-for="(client, a) in clients">
                                <h2 v-if="client.id == pet.clients_id"><input name="name" type="text" v-model="pet.name"></h2>
                                <h3 v-if="client.id == pet.clients_id">{{ client.firstName }} {{client.lastName }}</h3>
                            </div>
                            <div class="petInfo ">
                                <p class="pettype"><input name="animal" type="text" v-model="pet.animal"></p>
                                <p> <input name="breed" type="text" v-model="pet.breed"></p>
                                <p> <input name="gender" type="text" v-model="pet.gender"></p>
                                <p> Age(years): <input name="age" type="number" v-model="pet.age"></p>
                            </div>
                        </div>
                        <div class="editor">
                            <div @click="deletePet(pet)"><v-icon small color="#A9A2AA">fas fa-times</v-icon></div>
                            <div @click="changePet(pet)"><v-icon small color="#A9A2AA">fas fa-save</v-icon></div>
                        </div>
                    </form>
                </div>
<!-- pet visit history -->
                <div class="petSquareExtra">
                    <div class="show">
                        <v-btn icon @click="show = !show">
                            <v-icon>{{ show ? 'expand_less' : 'expand_more' }}</v-icon>
                        </v-btn>
                    </div>
                    <v-expand-transition>
                        <div v-show="show">
                            <div class="petVisit" v-bind:key="i" v-for="(visit, i) in visits">
                                <div class="petHistoryDetails" v-if="pet.id == visit.pets_id">
                                    <p v-if="pet.id == visit.pets_id">{{visit.description}}</p>
                                    <p v-if="pet.id == visit.pets_id">{{visit.date}}</p>
                                    <p v-if="pet.id == visit.pets_id">{{visit.time}}</p>
                                    <div class="fulldesc">
                                        <textarea name="fulldescription" id="fulldescription" v-model="visit.fulldescription" placeholder="Add full Description">

                                        </textarea>
                                        <div @click="saveReport(visit)" class="desc"> Save report </div>
                                    </div>
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

.pets {
    min-height: 850px;
    background-color:#DFDFDF;
    h1 {
        font-family: 'Fredericka the Great', cursive;
        font-size: 48px;
        margin: 20px 0;
        color: #1e1d29;
        text-align: center;
    } 
    .newPet {
        color: #1E1D29;
        text-align:center;
    }
    .petSpace{
        margin: 15px 0; 
        background-color: #A9A2AA; 
        .petSquare {
            font-family: 'Comfortaa', sans-serif;
            color: #1e1d29;
            display: flex;
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
            .petRight {
                display: flex;
                justify-content: space-between;
                width:100%;  
                .petDetails {
                    width: 100% ;
                    .petInfo {
                        display: flex;
                        justify-content: space-between;
                        margin: 10px;
                        p {
                            color: #1e1d29;
                            margin: 0;
                            font-size: 18px;
                            text-align: center;
                            input[type="text"] {
                                width:100%;
                                text-align: center;
                            }
                            input[type="number"]{
                                max-width: 25%;
                            }
                        }
                        p:last-of-type{
                            text-align: right;
                            width: 20%;  
                        }
                        .pettype {
                            width:15%;
                            text-align: center;
                        }
                    }
                    .petInfoTop {
                        min-height: 50px;
                        h2, h3 {
                            display: inline-block;
                            margin: 10px 0;
                            font-size: 24px;
                        }
                        h3 {
                            text-align: right;
                            input {
                                display: inline-block;
                            }   
                        }
                    }
                }
            }
        }
        .petSquareExtra {

            .show {
                text-align: center;
            }
            .petVisit {
                background-color: rgba(12, 19, 54, 0.15);
                .petHistoryDetails {
                    min-height: 50px;
                    font-family: 'Comfortaa', sans-serif;
                    color: #1e1d29;
                    display: flex;
                    justify-content: space-between;
                    border-bottom: 1px solid rgba(0, 0, 0, 0.25);
                    p {
                        font-size: 16px;
                        margin: 10px;                    
                    }
                    p:first-of-type{
                            width: 25%;
                        }
                    .fulldesc {
                        width:50%;
                        textarea {
                            width: 99%;
                            min-height: 50px;
                        }
                        .desc {
                            width:150px;
                            text-align: center;
                            margin: 0 auto 10px;
                            padding: 5px;
                            color: #A9A2AA;
                            background-color: rgba(30, 29, 41, 0.83);
                            transition: .6s;
                        }
                        .desc:hover {
                            cursor: pointer;
                            background-color: rgba(30, 29, 41, 0.67);
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
            pets: [],
            clients: [],
            visits: []
        }
    },
    methods: {
        changePet(pet){
            axios
                .post('http://localhost:8888/backEnd/api/pets/update',
                {
                    id: pet.id,
                    name: pet.name,
                    animal: pet.animal,
                    breed: pet.breed,
                    gender: pet.gender,
                    age: pet.age
                },
                {headers: {'Content-Type': 'application/x-www-form-urlencoded', 'Accept': 'application/json'}
                }
            )
                .then(() => {
                    this.$router.go()
                })

        },
        deletePet(pet){
            axios
                .post('http://localhost:8888/backEnd/api/pets/delete',
                    {
                        id: pet.id
                    },
                    {headers: {'Content-Type': 'application/x-www-form-urlencoded', 'Accept': 'application/json'}
                    }
                )
                .then(() => {
                    this.$router.go()
                })

        },
        saveReport(visit) {
            axios.post('http://localhost:8888/backEnd/api/visits/update',
                {
                    id: visit.id,
                    fulldescription: visit.fulldescription,
                },
                {headers: {'Content-Type': 'application/x-www-form-urlencoded', 'Accept': 'application/json'}
                }
            )
        }
    },
    mounted() {

        axios.all([
            axios.get('http://localhost:8888/backEnd/api/clients'),
            axios.get('http://localhost:8888/backEnd/api/pets'),
            axios.get('http://localhost:8888/backEnd/api/visits')
        ])
        .then(axios.spread((clientsApi, petsApi, visitsApi) => {
            this.clients = clientsApi.data;
            this.pets = petsApi.data;
            this.visits = visitsApi.data;
        }))
    }   
}
</script>

