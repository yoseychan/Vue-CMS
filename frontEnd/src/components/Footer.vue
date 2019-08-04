<template>
    <footer>
        <v-container>
            <v-layout class="align-center justify-space-between">    
                <v-flex xs12 sm8 class="foot">
                    <p class="logo">Peterinar</p>
                    <p class="logotext"> All rights reserved &copy; 2019</p>
                </v-flex>
                <v-flex xs12 sm4 class="foot">
                    <div >
                        <a href="https://twitter.com/pewdiepie" target="_blank"><i class="fab fa-twitter socicons"></i></a>
                        <a href="https://www.facebook.com/PewDiePie/" target="_blank"><i class="fab fa-facebook socicons"></i></a>
                        <a href="https://www.instagram.com/pewdiepie/" target="_blank"><i class="fab fa-instagram socicons"></i></a>
                    </div>
                    <div class="footnav"> 
                        <router-link to="/" class="footnav spec">Home</router-link>
                        <router-link to="/" class="footnav spec">About</router-link>
                        <router-link to="/" class="footnav spec">Contact</router-link> 
                        <router-link to="/login" class="footnav spec">Account</router-link>
                        <router-link to="/" class="footnav spec">Terms & conditions</router-link>
                    </div>
                </v-flex>         
            </v-layout>
        </v-container>
    </footer>
</template>

<style lang="scss">
    footer {
        background-color: #1E1D29;
        text-align: center;
        color: #D8C8CB;
        min-height: 150px;      
        .foot { 
            height: 100px;
            margin: 20px 0;
            .logo {
                font-family: 'Fredericka the Great', cursive;
                font-size: 32px;
                margin: 70px 0 0 0;
                line-height: 24px;
            }  
            p {
                text-align: left;
                font-size: 12px;
            }
                  
            .socicons { 
                color: rgba(217, 175, 192, .5);
                text-decoration: none;
                font-size: 28px;
                padding: 10px;
                transition: .5s;

            }
            .socicons:hover {
                color: #D8C8CB; 
            }
            .footnav{
                margin-top: 30px;
                padding: 3px;
                text-decoration: none;
                color: rgba(217, 175, 192, .5);
                transition:  .5s;
                .spec {
                    transition: .5s;
                }
                .spec:hover{
                    color: #D8C8CB; 
                }
            }
            .footnav::after {
                content: " |";
            }
            .footnav:last-of-type::after {
                content: "";
            }
        }
        .navtext {
            color: #D8C8CB;
            font-size: 12px;
            text-align: left;
        }
    }
</style>

<script>
export default {
    
}
</script>

