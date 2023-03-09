<?php

	include("dbconnection.php");
    $con = dbconnection();

    if(isset($_POST["full_name"])){
        $full_name = $_POST["full_name"];
    }
    else return;

    if(isset($_POST["mobile_no"])){
        $mobile_no = $_POST["mobile_no"];
    }
    else return;

    if(isset($_POST["email"])){
        $email = $_POST["email"];
    }
    else return;

    if(isset($_POST["dob"])){
        $dob = $_POST["dob"];
    }
    else return;

    if(isset($_POST["data"])){
        $data = $_POST["data"];
    }
    else return;

    if(isset($_POST["name"])){
        $name = $_POST["name"];
    }
    else return;

    $path = "upload/$name";

    $query = "INSERT INTO `profile_details`(full_name , mobile_no , email , dob , imagepath) VALUES('".$full_name."','".$mobile_no."','".$email."','".$dob."','".$path."')";
    file_put_contents($path,base64_decode($data));
    
    $exe = mysqli_query($con,$query);

    $arr = [];

    if($exe){
        $arr["Success"] = true;
        echo "done";
    }
    else{
        $arr["Success"] = false;
    }
    print(json_encode($arr));






?>