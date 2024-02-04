<?php
$servername = "192.168.1.211";
$username = "root";
$password = "834900";
$dbname = "starlightdominion_users";

// Skapa en anslutning till MySQL-databasen
$conn = new mysqli($servername, $username, $password, $dbname);

// Kontrollera om anslutningen är korrekt
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$data = json_decode(file_get_contents('php://input'), true);
// Ta emot användardata från HTTP-förfrågan
$username = $data['username'];
//$time = $data['time'];
$chat = $data['chat'];

// Sätt upp en MySQL-fråga för att lägga till meddelandet i chatloggen
$sql = "INSERT INTO chat_log (username, time, chat) VALUES ('$username', NOW(), '$chat')";

// Kör frågan mot databasen
if ($conn->query($sql) === TRUE) {
    echo "New message logged successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Stäng anslutningen till databasen
$conn->close();
?>