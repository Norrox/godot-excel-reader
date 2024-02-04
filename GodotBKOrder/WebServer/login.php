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
$password = $data['password'];

// Sök efter en matchande användare i databasen
$sql = "SELECT * FROM users WHERE username = '$username'";
$result = $conn->query($sql);
if ($result->num_rows == 1) {
    // Hämta lösenordshashen för användaren från databasen
    $row = $result->fetch_assoc();
    $storedPasswordHash = $row['password'];
    
    // Verifiera lösenordet mot den sparade hashen
    if (password_verify($password, $storedPasswordHash)) {
        echo "Login successful";
    } else {
        echo "Incorrect password";
    }
} else {
    echo "Username not found";
}

// Stäng anslutningen till databasen
$conn->close();
?>