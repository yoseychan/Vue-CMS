<template>
    
    <div class="newform">
        <v-content>
            <Nav/>
        </v-content>
        <v-container>
            
            <v-layout align-start justify-center row fill-height >
                <v-flex xs12 sm10 md6>
                    <v-card>
                        <h1>New client</h1>
                        <form  class="form">
                            <input id="firstName" name="firstName" type="text" v-model="newclient.firstName" required placeholder="First Name">
                            <input id="lastName" name="lastName" type="text" v-model="newclient.lastName" required placeholder="Last Name">
                            <input id="phone" name="phone" type="text" v-model="newclient.phone" required placeholder="Phone number">
                            <input id="street" name="street" type="text" v-model="newclient.street" required placeholder="Street">
                            <input id="city" name="city" type="text" v-model="newclient.city" required placeholder="City">
                            <input id="zip" name="zip" type="text" v-model="newclient.zip" required placeholder="Zip code">

                            <div @click="addNewClient" class="newclient"><router-link class="clientlink" to="/clients">Add a new client </router-link></div>
                            
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
            min-height: 600px;
            input::placeholder {
                color: #1E1D29;
                transition: .9s;
            }
            input:focus::placeholder {
                opacity: 0;
            }
            .newclient {
                padding: 10px 55px;
                background-color: rgba(30, 29, 41, .8);
                transition: .6s;
                margin-top: 50px;

                .clientlink {
                    text-decoration: none;
                    color: #D8C8CB;
                    padding: 12px 70px;
                }
            }
            .newclient:hover {
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
            newclient: {
                firstName: "",
                lastName: "",
                phone: "",
                street: "",
                city: "",
                zip: ""
            }
        }
    },
    methods: {
        addNewClient() {
            axios.post('http://localhost:8888/backEnd/api/clients',
                {
                    firstName: this.newclient.firstName,
                    lastName: this.newclient.lastName,
                    phone: this.newclient.phone,
                    street: this.newclient.street,
                    city: this.newclient.city,
                    zip: this.newclient.zip
                },
                {headers: {'Content-Type': 'application/x-www-form-urlencoded', 'Accept': 'application/json'}
                }
            )

        }

    }

    
}
</script>