<?php 
$connect = new mysqli("localhost","root","","sinfo_db");
if($connect){
}else{
	echo "Connection Failed";
	exit();
}
 ?>