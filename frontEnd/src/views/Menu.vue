<template>
    <div class="menu">
        <v-container>
<!-- menu navigation -->
            <h1>Menu</h1>
            <v-layout align-start justify-center row fill-height>
                <v-flex xs12  sm6 md5>
                    <router-link class="menuLink" to="/users">
                        <div class="menuSquare menuLeft">
                            <div class="menuIcon"><v-icon class="icon">fa-user-md</v-icon></div>
                            <h3>Users</h3>
                        </div>
                    </router-link>
                </v-flex>
                <v-flex xs12 sm6 md5>
                    <router-link class="menuLink" to="/clients" >
                        <div class="menuSquare menuRight">
                            <div class="menuIcon"><v-icon class="icon">fa-users</v-icon></div>
                            <h3>Clients</h3>
                        </div>
                    </router-link>
                </v-flex>
            </v-layout>
            <v-layout align-start justify-center row fill-height>
                <v-flex xs12 sm6 md5>
                    <router-link class="menuLink" to="/pets" >
                        <div class="menuSquare menuLeft">
                            <div class="menuIcon"><v-icon class="icon" >fa-paw</v-icon></div>
                            <h3>Pets</h3>
                        </div>
                    </router-link>
                </v-flex>
                <v-flex xs12 sm6 md5 >    
                    <router-link class="menuLink" to="/visits">
                        <div class="menuSquare menuRight ">
                            <div class="menuIcon"><v-icon class="icon">calendar_today</v-icon></div>
                            <h3>Visits</h3>
                        </div>
                    </router-link>    
                </v-flex>
            </v-layout>
<!-- list of the scheduled visits -->
            <h2>Schedule {{date}}</h2>
            <v-layout align-start justify-center row fill-height>
                <v-flex md10>
                    <v-card>
                        <div class="menuVisit" v-bind:key="index" v-for="(visit, index) in visits">
                            <div class="visitDetails">
                                <p>{{visit.ownerFname}} {{visit.ownerLname}}</p>
                                <p>{{visit.petname}}</p>
                                <p>{{visit.desc}}</p>
                                <p>{{visit.time}}</p>
                                <p>Dr.{{visit.doctor}}</p>
                            </div>
                        </div>
                    </v-card>
                </v-flex>
            </v-layout>
        </v-container>
    </div>
</template>

<style scoped lang="scss">
.menu {
    min-height:1180px;
    background-color:#DFDFDF;
    h1, h2 {
        font-family: 'Fredericka the Great', cursive;
        text-align: center;
        color: rgb(30, 29, 41);
        font-size: 48px;
        margin: 20px 0;
    }
    h2 {
        margin-top: 60px;
        font-size: 28px;
    }  
    .menuLink{
         text-decoration: none;
        .menuSquare {
            margin-top: 30px;
            height: 150px;           
            background-color:rgba(30, 29, 41, .9);
            transition: .6s;
            cursor: pointer;

            h3 {
                color: #D8C8CB;
                font-family: 'Comfortaa', sans-serif;
                font-size: 32px;
                text-align: center;
                 
            }
            .menuIcon {
                font-size: 64px;
                color: #D8C8CB;
                text-align: center;
                .icon {
                    font-size: 64px;
                    color: #D8C8CB;
                }                   
            }
        }
        .menuLeft {
            margin-right: 15px;
        }
        .menuRight {
            margin-left: 15px;
        }
        .menuSquare:hover {
            background-color:rgba(30, 29, 41, .8);
            -webkit-box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            -moz-box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            h3 {
                color: #D8C8CB; ;
            }
            .menuIcon {
                color: #D8C8CB; ;
                .icon{
                    color: #D8C8CB;
                }
            }
        }
    }
    .menuVisit {
        
        .visitDetails {
            font-family: 'Comfortaa', sans-serif;
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid rgba(0, 0, 0, 0.25);
            p {
                width: 24%;
                font-size: 16px;
                margin: 20px 10px;
                text-align: center;
                color: #1e1d29;                   
            }
            p:first-of-type {
                text-align: left;
                font-weight: 700;
                width: 15%;               

            }
            p:last-of-type {
                text-align: right;
                width: 13%;

            }
            
        }
       
    }
}
</style>


<script>
export default {
    data() {
        return {
            date: "20/07/2019",
            visits: [
                {
                    ownerFname: "Ryan",
                    ownerLname: "Reynolds",
                    petname: "Max",
                    desc: "Regular checkup",
                    time: "15:00",
                    doctor: "Yankovic"
                },
                {
                    ownerFname: "Jim",
                    ownerLname: "Carrey",
                    petname: "Milo",
                    desc: "Medical procedure",
                    time: "15:00",
                    doctor: "Yankovic"
                },
                {
                    ownerFname: "Ryan",
                    ownerLname: "Reynolds",
                    petname: "Max",
                    desc: "Nail clipping",
                    time: "15:00",
                    doctor: "Yankovic"
                },
                {
                    ownerFname: "Jim",
                    ownerLname: "Carrey",
                    petname: "Milo",
                    desc: "Medical procedure",
                    time: "15:00",
                    doctor: "Yankovic"
                },
                {
                    ownerFname: "Jim",
                    ownerLname: "Carrey",
                    petname: "Milo",
                    desc: "Medical procedure",
                    time: "15:00",
                    doctor: "Yankovic"
                },
                {
                    ownerFname: "Jim",
                    ownerLname: "Carrey",
                    petname: "Milo",
                    desc: "Medical procedure",
                    time: "15:00",
                    doctor: "Yankovic"
                }
            ]
        }
    }    
}
</script>
