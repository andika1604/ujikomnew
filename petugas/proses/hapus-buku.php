<?php
$id_buku = $_GET['id_buku'];

include '../../koneksi.php';

// Memeriksa apakah buku masih dipinjam
$cek_peminjaman = "SELECT * FROM peminjaman WHERE id_buku = '$id_buku'";
$result_peminjaman = mysqli_query($koneksi, $cek_peminjaman);

if (mysqli_num_rows($result_peminjaman) > 0) {
    echo "
    <script>
    alert('Buku masih dipinjam dan tidak dapat dihapus.');
    document.location.href = '../buku.php';
    </script>
    ";
} else {
    // Tidak ada peminjaman, lanjutkan proses penghapusan
    $query = "DELETE FROM buku WHERE id_buku = '$id_buku'";
    $success = mysqli_query($koneksi, $query);

    if ($success) {
        echo "
        <script>
        alert('Data berhasil dihapus');
        document.location.href = '../buku.php';
        </script>
        ";
    } else {
        echo "
        <script>
        alert('Data gagal dihapus');
        document.location.href = '../buku.php';
        </script>
        ";
    }
}
