<?php 

    $connection = new mysqli("localhost","root","","sinfo_db");
    $data       = mysqli_query($connection, "select * from tb_users");
    $data       = mysqli_fetch_all($data, MYSQLI_ASSOC);

    echo json_encode($data);