<?php
include 'db.php'; // Include database connection

header('Content-Type: application/json');

$sql = "SELECT name, email, fraud_type, description, date FROM reports ORDER BY date DESC LIMIT 10";
$result = $conn->query($sql);

$alerts = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $alerts[] = $row;
    }
}

echo json_encode($alerts);

$conn->close();
?>
