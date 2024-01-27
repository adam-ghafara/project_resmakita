<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST,GET,PUT,DELETE");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Connect To Database

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "resmakita";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection Failed: " . $conn->connect_error);
}

// login method

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $data = json_decode(file_get_contents("php://input"), true);

    $user_username = $data["user_username"];
    $user_password = $data["user_password"];

    $sql = "SELECT * FROM user WHERE user_username = '$user_email' AND user_password = '$user_password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();

        echo json_encode(array("message" => "Login Berhasil, Redirecting...", "data" => $row));
    } else {
        echo json_encode(array("message" => "Login Gagal. Username atau Password Salah!"));
    }
}

// register method

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $data = json_decode(file_get_contents("php://input"), true);

    $user_fullname = $data["user_fullname"];
    $user_username = $data["user_username"];
    $user_password = $data["user_password"];


    $sql = "INSERT INTO users (user_fullname, user_username, user_password) VALUES ('$user_fullname', '$user_username', '$user_password')";

    $conn->query($sql);
    echo json_encode(array("message" => "Data User Berhasil Ditambahkan"));
}
?>