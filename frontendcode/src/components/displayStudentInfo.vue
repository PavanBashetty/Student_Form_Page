<template>
<h2>Display Student Info</h2>
<table style="width:80%">
    <thead>
        <tr>
            <th>Student ID</th>
            <th>Last Name</th>
            <th>First Name</th>
            <th>Gender</th>
            <th>Email ID</th>
            <th>Course</th>
            <th>Batch</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <tr v-for="student in students" :key="student.student_id">
            <td>{{ student.student_id }}</td>
            <td>{{ student.last_name }}</td>
            <td>{{ student.first_name }}</td>
            <td>{{ student.gender }}</td>
            <td>{{ student.email_id }}</td>
            <td>{{ student.course }}</td>
            <td>{{ student.batch }}</td>
            <td><button type="button" class="deleteButton" v-on:click="removeStudentInfo(student.student_id, student.last_name, student.first_name)"> Delete </button></td>
        </tr>
    </tbody>
</table>
<br /><hr />
<button type="button" v-on:click="homePage()">Back</button>
</template>

    
<script>
import axios from 'axios';
export default {
    name: 'displayStudentInfoComp',
    data(){
        return{
            students:{}
        }
    },
    mounted(){
        this.loadStudentsTable();
    },
    methods:{
       async loadStudentsTable(){
           await axios.get("/api/students")
            .then((res)=>{
                this.students = res.data.data;
            })
            .catch(()=>{
                console.log("Data could not be uploaded");
            })
        },
        homePage(){
            return this.$router.push({
                name:'homePage'
            })
        },
        removeStudentInfo(sid,lastName, firstName){
            //alert('/delete/' + sid);
            let fullName = firstName.concat(" ",lastName);
            axios.delete("/api/delete/"+sid)
            .then((res)=>{
                if(res.data.msg == "Student info deleted successfully"){
                    alert(`Deleted ${fullName} successfully!`);
                    this.loadStudentsTable();
                }else{
                    alert(`${fullName} info could not be deleted, please try again`)
                }
            })
            .catch(()=>{console.log("went wrong");})
        }
    }
}
</script>

    
<style>
table, th, td{
    border: 1px solid black;
    border-collapse: collapse;
    
}
.deleteButton{
    background-color: #f44336;
    cursor: pointer;
    
}
</style>
