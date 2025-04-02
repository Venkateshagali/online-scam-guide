<?php
include 'db.php'; // Ensure your database connection is included

$query = "SELECT name, fraud_type, description, date FROM reports ORDER BY date DESC LIMIT 10";
$result = mysqli_query($conn, $query);

$reports = [];

while ($row = mysqli_fetch_assoc($result)) {
    $reports[] = $row;
}

echo json_encode($reports);
?>
