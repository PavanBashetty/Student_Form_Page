import {createRouter, createWebHistory} from 'vue-router'
import homePageComp from './components/homePage.vue'
import insertStudentInfoComp from './components/insertStudentInfoPage.vue'
import displayStudentInfoComp from './components/displayStudentInfo.vue'

const routes = [
    {
        name:'homePage',
        path:'/',
        component:homePageComp
    },
    {
        name:'insertStudentInfoPage',
        path:'/insert',
        component:insertStudentInfoComp
    },
    {
        name:'displayStudentInfoPage',
        path:'/display',
        component:displayStudentInfoComp
    }
];

const router = createRouter({
    history: createWebHistory(),
    routes
})

export default router;
