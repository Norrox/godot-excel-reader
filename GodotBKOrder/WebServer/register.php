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
$email = $data['email'];

// Kontrollera om användarnamnet redan finns i databasen
$sql = "SELECT * FROM users WHERE username = '$username'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    echo "Username already in use";
    exit;
}

// Kontrollera om e-postadressen redan finns i databasen
$sql = "SELECT * FROM users WHERE email = '$email'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    echo "Email already in use";
    exit;
}

// Generera ett hash av lösenordet
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

// Sätt upp en MySQL-fråga för att lägga till en ny användare i databasen
$sql = "INSERT INTO users (username, password, email) VALUES ('$username', '$hashedPassword', '$email')";

// Kör frågan mot databasen
if ($conn->query($sql) === TRUE) {
    echo "New user created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Stäng anslutningen till databasen
$conn->close();
?>