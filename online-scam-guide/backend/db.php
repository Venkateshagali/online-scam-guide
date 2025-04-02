<?php
$servername = "localhost";
$username = "root"; // Change this if needed
$password = ""; // Change this if needed
$database = "fraud_db";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
