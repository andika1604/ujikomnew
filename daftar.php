<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="login.css">
    <title>Form Login Perpustakaan</title>
</head>

<body>
    <div class="container">
        <div class="container-image">
            <img src="img/register.jpg" alt="login" width="100%">
        </div>
        <div class="container-form">
            <h2>Register Account</h2>

            <?php
            // Cek apakah terdapat parameter pesan yang dikirimkan dari halaman proses_daftar.php
            if (isset($_GET['pesan_register'])) {
                $pesan = $_GET['pesan_register'];
                if ($pesan == "gagal_register") {
                    echo '<p style="text-align: center; color: red;">Gagal mendaftar, Username atau email sudah digunakan.</p>';
                } elseif ($pesan == "info_daftar") {
                    echo '<p style="text-align: center; color: blue;">Berhasil mendaftar, Silakan login.</p>';
                }
            }
            ?>

            <form method="post" action="proses_daftar.php">
                <input type="text" placeholder="Username" name="username">
                <input type="password" placeholder="Password" name="password">
                <input type="email" placeholder="Email" name="email">
                <input type="text" placeholder="Nama Lengkap" name="nama_lengkap">
                <input type="text" placeholder="Alamat" name="alamat">
                <button type="submit">Daftar</button>
                <div class="container-link">
                    <label>do you already have an account?</label>
                    <a href="index.php">Login</a>
                </div>
            </form>

        </div>
    </div>
</body>

</html>