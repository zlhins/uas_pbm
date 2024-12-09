<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];

    $sql = "DELETE FROM books WHERE id=$id";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(["message" => "Book deleted successfully"]);
    } else {
        echo json_encode(["error" => "Failed to delete book"]);
    }
}
?>
