<template>
<h2>More Info on Student</h2>
<div>
    <p><b>Student ID:</b> {{ s_id }}</p>
    <p><b>FullName:</b> {{ fullName }}</p>
    <p><b>Address:</b> {{ address }}</p>
    <p><b>Phone:</b> {{ phone }}</p>
</div>
<hr />
<div>
    <table style="width:80%">
        <thead>
            <tr>
                <th>Semester</th>
                <th>Subject</th>
                <th>Score</th>
                <th>Credits Earned</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="(info,i) in studentInfo" :key="i">
                <td>{{ info.semester }}</td>
                <td>{{ info.subject_name }}</td>
                <td>{{ info.score }}</td>
                <td>{{ info.credits_earned }}</td>
            </tr>
        </tbody>
    </table>
</div>
<div>
    <p>Total credits earned so far: <b>{{ earnedCredits }}</b>. <br /> {{ 120 - earnedCredits }} more to go to <b>graduate</b></p>
</div>
<div>
    <p>Current aggregate score: <b>{{ aggregateScore }}</b></p>
</div>
<br />
<hr />
<button type="button" v-on:click="homePage()">Back</button>
</template>

<script>
import axios from 'axios';
import {
    useRoute
} from 'vue-router'
export default {
    name: 'moreStudentInfoComp',
    data() {
        return {
            route: useRoute(),
            s_id: '',
            studentInfo: {},
            fullName: '',
            address: '',
            phone: '',
            earnedCredits: '',
            aggregateScore: ''
        }
    },
    methods: {
        homePage() {
            return this.$router.push({
                name: 'displayStudentInfoPage'
            })
        },
       async loadMoreInfo() {
           await axios.get("/api/student/moreinfo/" + this.s_id)
                .then((res) => {
                    let responseData = res.data.data; //array of objects
                    this.studentInfo = responseData;
                    this.fullName = responseData[0].first_name.concat(" ", responseData[0].last_name);
                    this.address = responseData[0].street.concat(", ", responseData[0].city, " - ", responseData[0].pincode, " ", responseData[0].country);
                    this.phone = responseData[0].phone;
                })
                .catch(() => {
                    console.log("Data could not be retreived");
                })
        },
        loadTotCreditAndScore(){
            this.aggregateScore = 0;
            this.earnedCredits = 0;
            let count = 0;
            console.log("Main: ",this.studentInfo);
            for(let s in this.studentInfo){
                let indiviualScore = parseFloat(this.studentInfo[s].score);
                this.aggregateScore += indiviualScore;
                count++;
                let credits = parseInt(this.studentInfo[s].credits_earned);
                this.earnedCredits += credits;
            }
            this.aggregateScore = (this.aggregateScore/count).toFixed(2);
        }
    },
    mounted() {
        this.s_id = this.route.params.student_id;
        this.loadMoreInfo();
    },
    updated(){
        this.loadTotCreditAndScore();
    }
}
</script>

<style>
table,
th,
td {
    border: 1px solid black;
    border-collapse: collapse;

}
</style>
