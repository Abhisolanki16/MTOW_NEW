<?php
    function dbconnection()
    {
        $con = mysqli_connect("localhost","root","","flutter_app");
        return $con;
    }
?>  