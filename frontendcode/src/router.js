import {createRouter, createWebHistory} from 'vue-router'
import homePageComp from './components/homePage.vue'
import insertStudentInfoComp from './components/insertStudentInfoPage.vue'
import displayStudentInfoComp from './components/displayStudentInfo.vue'
import moreStudentInfoComp from './components/moreStudentInfo.vue'

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
    },
    {
        name:'moreStudentInfoPage',
        path:'/moreinfo/:student_id',
        component: moreStudentInfoComp
    }
];

const router = createRouter({
    history: createWebHistory(),
    routes
})

export default router;
