<?php
$connection = new mysqli("localhost","root","","sinfo_db");
$data = mysqli_query($connection, "select * from tb_users where
id_user=".$_GET['id_user']);
$data = mysqli_fetch_array($data, MYSQLI_ASSOC);
echo json_encode($data);