<?php
$host = "localhost"; // WAMP server
$username = "root"; // Default WAMP username
$password = ""; // Default WAMP password is empty
$database = "inventory_db"; // Your database name

// Create connection
$conn = new mysqli($host, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>