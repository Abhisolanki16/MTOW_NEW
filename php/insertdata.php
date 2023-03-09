<?php
    include("dbconnection.php");
    $con = dbconnection();

    if(isset($_POST["full_name"])){
        $full_name = $_POST["full_name"];
    }
    else return;

    if(isset($_POST["unique_id"])){
        $unique_id = $_POST["unique_id"];
    }
    else return;

    if(isset($_POST["mobile_no"])){
        $mobile_no = $_POST["mobile_no"];
    }
    else return;

    if(isset($_POST["pincode"])){
        $pincode = $_POST["pincode"];
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

    $query = "INSERT INTO `user_detail`(full_name , unique_id , mobile_no , pincode , imagepath) VALUES('".$full_name."','".$unique_id."','".$mobile_no."','".$pincode."','".$path."')";
    file_put_contents($path,base64_decode($data));
    
    $exe = mysqli_query($con,$query);

    $arr = [];

    if($exe){
        $arr["Success"] = true;
    }
    else{
        $arr["Success"] = false;
    }
    print(json_encode($arr));


?>