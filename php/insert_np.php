<?php
	
	include("dbconnection.php");
    $con = dbconnection();

    if(isset($_POST["registration_no"])){
        $registration_no = $_POST["registration_no"];
    }
    else return;


    $query = "INSERT INTO `vehicles`(registration_no) VALUES ($registration_no)";


    $result = mysqli_query($con,$query);

    if($result){
         $arr["Success"] = true;
        echo "done";
    }
    else{
         $arr["Success"] = false;
    }
    print(json_encode($arr));

?>