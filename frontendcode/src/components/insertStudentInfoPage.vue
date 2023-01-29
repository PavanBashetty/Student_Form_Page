<template>
<h2>Insert Student Info</h2>
<div>
    <label for="first_name">First Name:</label>
    <input type="text" placeholder="Enter First Name" id="first_name" v-model="fName" /><br /><br />
    <label for="last_name">Last Name:</label>
    <input type="text" placeholder="Enter Last Name" id="last_name" v-model="lName" /><br /><br />
    <label for="gender">Gender:</label>
    <select id="gender" v-model="gender">
        <option value="Male">Male</option>
        <option value="Female">Female</option>
        <option value="Diverse">Diverse</option>
    </select><br /><br />
    <label for="email_id">Email ID:</label>
    <input type="text" placeholder="Enter Email ID" id="email_id" v-model="emailid" /><br /><br />
    <label for="course">Course:</label>
    <select id="course" v-model="course">
        <option value="ACS">ACS</option>
        <option value="ADS">ADS</option>
        <option value="IT">IT</option>
        <option value="IB">IB</option>
        <option value="IML">IML</option>
        <option value="Applied Physics">Applied Physics</option>
        <option value="Music Thearpy">Music Thearpy</option>
        <option value="MicroBiologist">MicroBiologist</option>
        <option value="Electrical Engineering">Electrical Engineering</option>
    </select><br /><br />
    <label for="batch">Batch:</label>
    <select id="batch" v-model="batch">
        <option value="W-2021">W-2021</option>
        <option value="S-2022">S-2022</option>
        <option value="W-2022">W-2022</option>
        <option value="S-2023">S-2023</option>
        <option value="W-2023">W-2023</option>
    </select><br /><br />

    <button type="button" v-on:click="insertStudentInfo()">Submit</button>
    <hr />
    <button type="button" v-on:click="homePage()">Back</button>
</div>
</template>

<script>
import axios from 'axios';
export default {
    name: 'insertStudentInfoComp',
    data() {
        return {
            fName: '',
            lName: '',
            gender: '',
            emailid: '',
            course: '',
            batch: ''
        }
    },
    methods: {
        async insertStudentInfo() {
            await axios.post("/api/student", {
                fName: this.fName,
                lName: this.lName,
                gender: this.gender,
                emailid: this.emailid,
                course: this.course,
                batch: this.batch
            }).then((res) => {
                if(res.data.msg == "student registered successfully"){
                    alert("Registration successful!");
                    this.fName = '',
                    this.lName = '',
                    this.gender = '',
                    this.emailid = '',
                    this.course = '',
                    this.batch = ''
                }else{
                    alert("Registration did not happen, please try again!");
                    this.fName = '',
                    this.lName = '',
                    this.gender = '',
                    this.emailid = '',
                    this.course = '',
                    this.batch = ''
                }
            }).catch(()=>{
                alert("Something else went wrong,try again");
                this.fName = '',
                this.lName = '',
                this.gender = '',
                this.emailid = '',
                this.course = '',
                this.batch = ''
            })
        },
        homePage(){
            return this.$router.push({
                name:'homePage'
            })
        }
    }
}
</script>

<style>

    </style>
