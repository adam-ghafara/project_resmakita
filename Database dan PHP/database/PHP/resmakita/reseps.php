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

if ($_SERVER["REQUEST_METHOD"] === "GET") {
    // Object todos
    $sql = "SELECT * FROM recipetable";
    $result = $conn->query($sql);
    $product = array();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            array_push($product, $row);
        }
}

    echo json_encode($product);
} else if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $data = json_decode(file_get_contents("php://input"), true);

    $id_masakan = $data["id_masakan"];
    $nama_masakan = $data["nama_masakan"];
    $penulis_masakan = $data["penulis_masakan"];
    $deskripsi_masakan = $data["deskripsi_masakan"];
    $bahan_masakan = $data["bahan_masakan"];
    $cara_masakan = $data["cara_masakan"];

    $sql = "INSERT INTO recipetable (id_masakan, nama_masakan, penulis_masakan, deskripsi_masakan, bahan_masakan, cara_masakan) VALUES ('$id_masakan', '$nama_masakan', '$penulis_masakan', '$deskripsi_masakan', '$bahan_masakan', '$cara_masakan')";
    $conn->query($sql);
    echo json_encode(array("message" => "Data Mahasiswa Berhasil Ditambahkan"));
} else if ($_SERVER["REQUEST_METHOD"] === "PUT") {
    $data = json_decode(file_get_contents("php://input"), true);

    $id_masakan = $data["id_masakan"];
    $nama_masakan = $data["nama_masakan"];
    $penulis_masakan = $data["penulis_masakan"];
    $deskripsi_masakan = $data["deskripsi_masakan"];
    $bahan_masakan = $data["bahan_masakan"];
    $cara_masakan = $data["cara_masakan"];

    $sql = "UPDATE recipetable SET nama_masakan = '$nama_masakan', penulis_masakan = '$penulis_masakan', deskripsi_masakan = '$deskripsi_masakan', bahan_masakan = '$bahan_masakan', cara_masakan = '$cara_masakan' WHERE id_masakan = '$id_masakan'";

    $conn->query($sql);
    echo json_encode(array("message" => "Data Mahasiswa Berhasil Diupdate"));
} else if ($_SERVER["REQUEST_METHOD"] === "DELETE") {
    $data = json_decode(file_get_contents("php://input"), true);

    $id_masakan = $data["id_masakan"];

    $sql = "DELETE FROM recipetable WHERE id_masakan = '$id_masakan'";

    $conn->query($sql);
    echo json_encode(array("message" => "Data Mahasiswa Berhasil Dihapus"));
}
$conn->close();
?>