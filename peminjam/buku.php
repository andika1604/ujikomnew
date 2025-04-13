<?php
session_start();
$username = isset($_SESSION['username']) ? $_SESSION['username'] : '';
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/style.css">
    <title>Peminjam</title>
</head>

<body>
    <div id="overlay"></div>
    <header>
        <p style="height: 36px;">MyPerpus</p>
        <div>
            <a href="index.php">Dashboard</a>
            <a href="buku.php">Buku</a>
            <a href="koleksi.php">Koleksi</a>
            <a href="../logout.php">Logout</a>
        </div>
    </header>

    <main>
        <div class="container-search">
            <h4>Pilihan Buku</h4>

            <form action="" method="GET">
                <input type="text" name="search" placeholder="Cari judul buku...">
                <button type="submit">Cari</button>
            </form>

            <?php
            include '../koneksi.php';

            if (isset($_GET['search'])) {
                $search = mysqli_real_escape_string($koneksi, $_GET['search']);
                $query = "SELECT * FROM buku WHERE judul LIKE '%$search%' ORDER BY id_buku ASC";
            } else {
                $query = "SELECT * FROM buku ORDER BY id_buku ASC";
            }

            $data = mysqli_query($koneksi, $query);
            ?>
        </div>


        <div class="card-container">
            <?php
            while ($d = mysqli_fetch_array($data)) {
                $id_buku = $d['id_buku'];

                $queryRating = "SELECT rating FROM ulasanbuku WHERE id_buku = $id_buku";
                $resultRating = mysqli_query($koneksi, $queryRating);

                $totalRating = 0;
                $jumlahRating = 0;

                while ($rowRating = mysqli_fetch_assoc($resultRating)) {
                    $totalRating += $rowRating['rating'];
                    $jumlahRating++;
                }

                $rataRata = $jumlahRating > 0 ? $totalRating / $jumlahRating : 0;
            ?>

            <div class="card">
                <div class="container-img"
                    style="background-position: center; background-size: cover; background-image: url('../img/<?= $d['image'] ?>');">
                </div>
                <h4><a href="detail.php?id_buku=<?= $d['id_buku']; ?>"><?= $d['judul']; ?></a></h4>
                <p>Rating: <span class="rating">
                        <?php
                            for ($i = 1; $i <= 5; $i++) {
                                echo $i <= $rataRata ? '★' : '☆';
                            }
                            ?>
                    </span>
                </p>
                <p>Tahun terbit : <?= $d['tahun_terbit']; ?></p>
                <a href="ulasan_buku_detail.php?id_buku=<?= $d['id_buku']; ?>">Ulasan</a>
                <?php
                    $id_user = $_SESSION['id_user'];
                    $check_pinjam = "SELECT * FROM peminjaman WHERE id_buku = '{$d['id_buku']}' AND id_user = '$id_user' AND (status_peminjaman = 'dipinjam' OR status_peminjaman = 'telat')";
                    $result_pinjam = mysqli_query($koneksi, $check_pinjam);

                    if (mysqli_num_rows($result_pinjam) == 0) {
                    ?>
                <button onclick="document.getElementById('modal<?= $d['id_buku']; ?>').style.display='block'; 
                    document.getElementById('overlay').style.display='block'">Pinjam</button>
                <?php } ?>
            </div>

            <div id="modal<?= $d['id_buku']; ?>" style="display:none; height: 150px; width: 325px; position: fixed; top: 50%;
            left: 50%; transform: translate(-50%, -50%); z-index: 1000; background-color: white;border-radius: 15px; ">
                <div
                    style="display: flex; flex-direction: column; justify-content: center; align-items: center; height: 100%; padding: 10px; gap: 10px; ">
                    <h2>Yakin ingin meminjam?</h2>
                    <form action="proses/tambah_pinjam.php" method="post">
                        <input type="hidden" name="id_buku" value="<?= $d['id_buku']; ?>">
                        <input type="hidden" name="id_user" value="<?= $_SESSION['username']; ?>">
                        <input type="hidden" name="tanggal_peminjaman">
                        <input type="hidden" name="tanggal_pengembalian">
                        <input type="hidden" name="status_peminjaman" value="dipinjam">
                        <button class="button" type="submit">Pinjam</button>
                        <button class="button" type="button" onclick="document.getElementById('modal<?= $d['id_buku']; ?>').style.display='none';
                            document.getElementById('overlay').style.display='none'">Batal</button>
                    </form>
                </div>

            </div>

            <?php } ?>
        </div>
    </main>

    <footer>
        <p>Aplikasi Perpustakaan Digital | 2024</p>
    </footer>
</body>

</html>