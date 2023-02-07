<?php
    session_start();
    $message="";
    if(count($_POST)>0) {
        $con = mysqli_connect('localhost','root','','flutter_app') or die('Unable To connect');
        $result = mysqli_query($con,"SELECT * FROM login WHERE username='" . $_POST["user_name"] . "' and password = '". $_POST["password"]."'");
        $row  = mysqli_fetch_array($result);
        if(is_array($row)) {
        $_SESSION["username"] = $row['username'];
        $_SESSION["password"] = $row['password'];
        } else {
         $message = "Invalid Username or Password!";
        }
    }
    
?>
