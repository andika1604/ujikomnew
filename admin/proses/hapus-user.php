<?php 
// menangkap data id yang dikirim dari url
$id_user = $_GET['id_user'];

// menghapus data dari databasee
include '../../koneksi.php';

// Memeriksa apakah buku masih dipinjam
$cek_peminjaman = "SELECT * FROM peminjaman WHERE id_user = '$id_user'";
$result_peminjaman = mysqli_query($koneksi, $cek_peminjaman);

if (mysqli_num_rows($result_peminjaman) > 0) {
    echo "
    <script>
    alert('username masih meminjam dan tidak dapat dihapus.');
    document.location.href = '../user.php';
    </script>
    ";
} else {

// Tidak ada peminjaman, lanjutkan proses penghapusan
$query = "DELETE FROM user WHERE id_user = '$id_user'";
$success = mysqli_query ($koneksi, $query);
 
if ($success) {
    echo "
    <script>
    alert('data berhasil dihapus');
    document.location.href = '../user.php';
    </script>
    ";
} else {
    echo "
    <script>
    alert('data gagal dihapus');
    document.location.href = '../user.php';
    </script>
    ";
   }

}

?>