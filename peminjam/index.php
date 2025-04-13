<?php 
session_start();

// cek apakah yang mengakses halaman ini sudah login
if ($_SESSION['level'] == "") {
    header("location:../index.php?pesan=info_login");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Peminjam</title>

    <link rel="stylesheet" href="./assets/style.css">
</head>

<body>
    <div>
        <header>
            <p>MyPerpus</p>
            <div>
                <a href="index.php">Dashboard</a>
                <a href="buku.php">Buku</a>
                <a href="koleksi.php">Koleksi</a>
                <a href="../logout.php">Logout</a>
            </div>
        </header>

        <main>
            <h7>
                <b> Selamat Datang <?php echo $_SESSION['username']; ?> Anda login pada
                    <span><?php echo date('l, d F Y'); ?></span></b>
            </h7>
            <div>
                <div>
                    <table>

                        <tr>
                            <td width="200">Nama</td>
                            <td width="1">:</td>
                            <td><?php echo $_SESSION['username']; ?></td>
                        </tr>
                        <tr>
                            <td width="200">Level User</td>
                            <td width="1">:</td>
                            <td><?php echo $_SESSION['level']; ?></td>
                        </tr>
                        <tr>
                            <td width="200">Tanggal Login</td>
                            <td width="1">:</td>
                            <td><?php echo date('l, d m Y'); ?></td>
                        </tr>

                    </table>
                </div>
            </div>
        </main>

        <!-- footer -->
        <div>
            <p>Aplikasi Perpustakaan Digital | 2024</p>
        </div>
    </div>

    <!-- Bootstrap JS dihapus -->
</body>

</html>