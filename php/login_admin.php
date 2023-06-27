<?php 
include 'conn.php';
$username_admin = $_POST['username_admin'];
$password_admin = $_POST['pass_admin'];
$queryResult=$connect->query("SELECT * FROM tb_admin WHERE username_admin='$username_admin' and pass_admin='$password_admin' ");

$result=array();
while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}
echo json_encode($result);
 ?>