<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title = $_POST['title'];
    $author = $_POST['author'];
    $genre = $_POST['genre'];

    $sql = "INSERT INTO books (title, author, genre) VALUES ('$title', '$author', '$genre')";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(["message" => "Book added successfully"]);
    } else {
        echo json_encode(["error" => "Failed to add book"]);
    }
}
?>
