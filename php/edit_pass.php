<?php
$connection = new mysqli("localhost", "root", "", "sinfo_db");

$Username = $_POST['Username'];
$Pass = $_POST['Pass'];
$id = $_GET['id_user'];
$result = mysqli_query($connection, "UPDATE `tb_users` SET `username` = '$Username', `pass` = '$Pass' WHERE `id_user` =" .$id);
if($result){
echo json_encode([
'message' => 'Data edit successfully'
]);
}else{
echo json_encode([
'message' => 'Data Failed to update'
]);
}