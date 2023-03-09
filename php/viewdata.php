<?php
include("dbconnection.php");
$con=dbconnection();

$query = $con->query("SELECT * FROM tow_records");
$result = array();

while($rowData = $query->fetch_assoc()){
    $result[] = $rowData;
}
echo json_encode($result);

?>