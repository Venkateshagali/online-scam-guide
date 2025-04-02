<?php
include 'db.php'; // Include database connection

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $fraud_type = $_POST['fraud_type'];
    $description = $_POST['description'];

    // Prepare SQL Query
    $stmt = $conn->prepare("INSERT INTO reports (name, email, fraud_type, description) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssss", $name, $email, $fraud_type, $description);

    if ($stmt->execute()) {
        echo "<script>alert('Fraud report submitted successfully!'); window.location.href='../report-fraud.html';</script>";
    } else {
        echo "<script>alert('Error submitting report. Please try again.'); window.location.href='../report-fraud.html';</script>";
    }

    $stmt->close();
    $conn->close();
}
?>
