<template>
<h2>Home Page</h2>
<button type="button" v-on:click="insertPage()">Insert New Student Info</button><br /><br />
<button type="button" v-on:click="displayPage()">Display Entire Table</button>
</template>

<script>
export default{
    name:'homePageComp',
    methods:{
        insertPage(){
            return this.$router.push({
                name: 'insertStudentInfoPage'
            })
        },
        displayPage(){
            return this.$router.push({
                name:'displayStudentInfoPage'
            })
        }
    }
}
</script>

<style>

</style>