<?php
session_start();
// Periksa apakah 'username' sudah diatur
$username = isset($_SESSION['username']) ? $_SESSION['username'] : '';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Tetap pakai Boxicons & style sendiri -->
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="assets/style.css">
    <title>Ulasan Buku</title>
    <style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: rgb(232, 232, 232);
    }

    .container {
        height: 60%;
        width: 50%;
        padding: 20px;
        border-radius: 8px;
        background-color: rgb(255, 255, 255);
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }

    form {
        display: flex;
        flex-direction: column;
        gap: 1px;
    }

    button {
        height: 30px;
        width: 80px;
        background-color: rgb(72, 142, 255);
        border: none;
        color: white;
        border-radius: 6px;
    }

    textarea {
        width: 100%;
        padding: 10px;
        border-radius: 6px;
        border: 1px solid rgb(200, 200, 200);
        resize: none;
    }

    .container-button {
        margin-top: 8px;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    a {

        text-decoration: none;
        color: rgb(108, 108, 108);
        text-align: center;

        border-radius: 6px;
    }

    p {
        font-size: 20px;
        font-weight: 600;
        margin-bottom: 20px;
    }
    </style>
</head>

<body>

    <div class="container">
        <?php
        include '../koneksi.php';
        if (isset($_GET['id_buku'])) {
            $id_buku = $_GET['id_buku'];
        } else {
            die("Error, Data Tidak Ditemukan");
        }
        $query = mysqli_query($koneksi, "SELECT * FROM buku WHERE id_buku='$id_buku'");
        $data = mysqli_fetch_array($query);
        ?>
        <p>Ulasan buku - <?= $data['judul'] ?></p>
        <form action="proses/proses-ulasan.php" method="post">
            <div class="rating">
                <input type="number" name="rating" hidden>
                <i class='bx bx-star star' style="--i: 0;"></i>
                <i class='bx bx-star star' style="--i: 1;"></i>
                <i class='bx bx-star star' style="--i: 2;"></i>
                <i class='bx bx-star star' style="--i: 3;"></i>
                <i class='bx bx-star star' style="--i: 4;"></i>
            </div>
            <div>
                <input type="hidden" name="id_user" value="<?= $_SESSION['id_user'] ?>">
            </div>
            <div>
                <input type="hidden" name="id_buku" value="<?= $data['id_buku'] ?>">
            </div>
            <textarea name="ulasan" cols="70" rows="9" placeholder="ulasan buku yang kamu berikan..."></textarea>

            <div class="container-button">
                <button type="submit">Submit</button>
                <a href="koleksi.php">Cancel</a>
            </div>
        </form>
    </div>

    <script src="assets/script.js"></script>
</body>

</html>