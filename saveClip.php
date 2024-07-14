<?php

$host = 'localhost';
$username = 'root';
$password = '';
$database = 'clipboard';

$conn = new mysqli($host, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully<br>";

$Clip_info = $_POST['the_clip'];

$my_query = "INSERT INTO `clip_info` (`clip_text`, `clip_date`) VALUES ('$Clip_info', current_timestamp())";

if ($conn->query($my_query) === TRUE) {
    echo "Your Query executed successfully<br>";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}


// INSERT INTO `clip_info` (`sr_no`, `clip_text`, `clip_date`) VALUES ('2', 'sdsds', current_timestamp());