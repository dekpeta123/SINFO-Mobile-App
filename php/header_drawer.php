<?php 

    $connection = new mysqli("localhost","root","","sinfo_db");
    $data       = mysqli_query($connection, "select * from note_app");
    $data       = mysqli_fetch_array($data, MYSQLI_ASSOC);

    echo json_encode($data);