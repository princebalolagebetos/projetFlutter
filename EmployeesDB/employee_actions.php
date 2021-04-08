<?php 
$servername ="localhost";
$username = "root"; 
$password ="";
$dbname ="testdb";
$table ="Employees";
// $action = $_POST['action']; 
$action = 'CREATE_TABLE';
//creation de la connection
$conn = new mysqli($servername,$username,$password,$dbname);
//verifier la connection
if($conn->connect_error){
    die("connection failed:" .$conn->connect_error);
    return;
}  
 // if connection is ok?  
 // if the app sends an actions to create the table
 if("CREATE_TABLE" == $action){
 $sql = "CREATE TABLE $table (
   id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
   first_name VARCHAR(30) NOT NULL,
   lastname_name VARCHAR(30) NOT NULL)"; 
 

   if($conn->query($sql) === TRUE){
       // send back succes message
       echo" succes";
   }else{
       echo"error";
   }
   $conn-> close();
   return;
 } 
 // get all employee records from the tabase
 if("GET_ALL" == $action){
     $db_data =array();
     $sql = "SELECT id,first_name,last_name from $table ORDER BY id DESC";
     $result =$conn->query($sql);
     if($result->num_rows > 0){
         while($row = $result->fetch_assoc()){
             $db_data[] = $row;
             //send back the complete records as a json
             echo json_encode($db_data);
         } 
         else{
             echo "error";
         } 
         $conn->close();
         return;
     }
 }  
 // add an employee
 if("ADD_EMP" == $action){
     $first_name = $_POST["first_name"];
     $last_name = $_POST["last_name"];
     $sql = "INSERT INTO $table (first_name,last_name) values ('$first_name','$last_name')";
     $result = $conn->query($sql);
     echo "succes"; 
     $conn->close(); 
     return;
 } 
 //update an Employee 
 if("UPDATE_EMP" == $action){ 
     // app will he posting these values to this  server
     $emp_id = $POST['$emp_id'];
     $first_name = $_POST["first_name"];
     $last_name = $_POST["last_name"];
     $sql = "UPDATE $table SET first_name = '$first_name', last_name = '$last_name' WHERE  id = '$emp_id' ";
     if($conn->query($sql) === TRUE){
        echo "success";
     }else{
         echo"erro";
     }
     $conn->close();
     return;
 } 
 // delete an amployee
//  if('DELETE_EMP' == $action){
//      $emp_id = $_POST['$emp_id'];
//      sql = "DELETE FROM $table WHERE id = $emp_id";
//  } else{
//      echo 'error';
//  }
//  $conn->close();
//  return;


?>