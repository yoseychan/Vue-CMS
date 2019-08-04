import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: '/login',
      name: 'login',
      component: () => import(/* webpackChunkName: "login" */ './views/Login.vue')
    },
    {
      path: '/menu',
      name: 'menu',
      component: () => import(/* webpackChunkName: "menu" */ './views/Menu.vue')
    },
    {
      path: '/pets',
      name: 'pets',
      component: () => import(/* webpackChunkName: "pets" */ './views/Pets.vue')
    },
    {
      path: '/clients',
      name: 'clients',
      component: () => import(/* webpackChunkName: "clients" */ './views/Clients.vue')
    },
    {
      path: '/users',
      name: 'users',
      component: () => import(/* webpackChunkName: "users" */ './views/Users.vue')
    },
    {
      path: '/visits',
      name: 'visits',
      component: () => import(/* webpackChunkName: "visits" */ './views/Visits.vue')
    },
    {
      path: '/newpet',
      name: 'newpet',
      component: () => import(/* webpackChunkName: "newpet" */ './views/Newpet.vue')
    },
    {
      path: '/newclient',
      name: 'newclient',
      component: () => import(/* webpackChunkName: "newclient" */ './views/Newclient.vue')
    },
    {
      path: '/newuser',
      name: 'newuser',
      component: () => import(/* webpackChunkName: "newuser" */ './views/Newuser.vue')
    },
    {
      path: '/newvisit',
      name: 'newvisit',
      component: () => import(/* webpackChunkName: "newvisit" */ './views/Newvisit.vue')
    }
    
  ]
})
