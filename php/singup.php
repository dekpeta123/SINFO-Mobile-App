<?php

    $connection = new mysqli("localhost", "root", "", "sinfo_db");
    $username      = $_POST['username']; 
    $pass    = $_POST['pass'];    
    $nama    = $_POST['nama'];    
    // $date       = date('Y-m-d');
    
    $result = mysqli_query($connection, "INSERT INTO `tb_users`(`id_user`, `username`,  `pass`, `nama`) VALUES ('','$username','$pass','$nama')");
    
    if($result){
        echo json_encode([
            'message' => 'Data input successfully'
        ]);
    }else{
        echo json_encode([
            'message' => 'Data Failed to input'
        ]);
    }