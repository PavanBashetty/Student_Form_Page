const express = require("express");
const bodyParser = require("body-parser");
const mysql = require("mysql2");
const { query } = require("express");

const app = express();
app.use(bodyParser());

app.listen(3000, ()=>{
    console.log("Server started...");
})

app.get("/", (req,res)=>{
    res.send("Hello again from the server");
})


const connection = mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"Pavan@1235",
    database: "srh_02"
});

connection.connect((err)=>{
    if(err) throw err;
    console.log("Connected to MySQL server");
});

app.get("/api/students", (req,res)=>{
    let query = `SELECT student_id, last_name, first_name, gender, email_id, course, batch FROM students WHERE current_status = 'Active'`;

    connection.query(query, (err, result)=>{
        if(err){
            res.json(500,{
                msg:"Server issue, could not get the data"
            })
        }
        res.send(200,{
            msg:"Data fetched successfully",
            data:result
        })
    })
});

app.post("/api/student", (req,res)=>{
    console.log("Requested to post data..");
    let fName = req.body.fName;
    let lName = req.body.lName;
    let gender = req.body.gender;
    let emailid = req.body.emailid;
    let course = req.body.course;
    let batch = req.body.batch;

    let query = `INSERT INTO students(last_name, first_name, gender, email_id, course, batch) VALUES('${lName}','${fName}','${gender}','${emailid}','${course}','${batch}')`;

    connection.query(query, (err, result)=>{
        if(err){
            res.json(500,{
                msg:"Something went wrong"
            })
        }
        res.json(200,{
            msg:"student registered successfully"
        })
    })
});

app.delete("/api/delete/:student_id", (req,res)=>{
    let student_id = req.params.student_id;

    //let query = `DELETE FROM students WHERE student_id = ${student_id};`;
    let query = `UPDATE students SET current_status = 'InActive' WHERE student_id = ${student_id}`;
    connection.query(query,(err,result)=>{
        if(err){
            res.json(500,{
                msg: "Something went wrong, could not delete the row"
            })
        }
        res.json(200,{
            msg:"Student info deleted successfully"
        })
    })
});

app.get("/api/student/moreinfo/:student_id", (req,res)=>{
    let student_id = req.params.student_id;

    let query = `SELECT s.last_name, s.first_name, sa.phone, sa.street, sa.pincode, sa.city, sa.country, ss.semester, ss.subject_name, ss.score,
    ss.credits_earned FROM students s 
    join student_address sa ON s.student_id = sa.student_id 
    join student_scorecard ss on sa.student_id = ss.student_id
    WHERE s.student_id = ${student_id}`;

    connection.query(query, (err,result)=>{
        if(err){
            res.json(500,{
                msg:"Something went wrong, could not retrive more data"
            })
        }
        res.json(200,{
            msg: "More data fetched succesfully",
            data: result
        })
    })
})