<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $title = $_POST['title'];
    $author = $_POST['author'];
    $genre = $_POST['genre'];
    $synopsis = $_POST['synopsis'];

    // Update informasi buku
    $sql = "UPDATE books SET title='$title', author='$author', genre='$genre', synopsis='$synopsis' WHERE id=$id";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(["message" => "Book updated successfully"]);
    } else {
        echo json_encode(["error" => "Failed to update book"]);
    }
}
?>
