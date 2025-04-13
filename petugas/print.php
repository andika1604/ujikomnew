<?php
header("Content-type: application/vnd-ms-excel");
header("Content-Disposition: attachment; filename=Laporan-Peminjaman-Buku.xls");
?>

<center>
    <h3>Laporan Peminjaman Buku</h3>
</center>
<table border="2" class="table table-striped table-bordered">
    <tr class="fw-bold">
        <th>No.</th>
        <th>Peminjam</th>
        <th>Buku</th>
        <th>Tanggal Peminjaman</th>
        <th>Tanggal Pengembalian</th>
        <th>Status</th>
    </tr>
    <?php 
    include '../koneksi.php';
                $tanggal_peminjaman = $_GET['tanggal_peminjaman'];
                $tanggal_pengembalian = $_GET['tanggal_pengembalian'];

                $no=1;
                $data = mysqli_query($koneksi, "SELECT * FROM peminjaman, buku, user WHERE peminjaman.id_user=user.id_user 
                AND peminjaman.id_buku=buku.id_buku AND tanggal_peminjaman >= '$tanggal_peminjaman' 
                AND (tanggal_pengembalian <= '$tanggal_pengembalian')");
                while ($row = mysqli_fetch_assoc($data)) {
                    $status_peminjaman = $row['status_peminjaman'];
                ?>
    <tr>
        <td><?php echo $no++; ?>.</td>
        <td><?php echo $row['nama_lengkap']; ?></td>
        <td><?php echo $row['judul']; ?></td>
        <td><?php echo $row['tanggal_peminjaman']; ?></td>
        <td><?php echo $row['tanggal_pengembalian']; ?></td>
        <td>
            <?php if ($status_peminjaman == 'dipinjam') { ?>
            <span>Proses</span>
            <?php }elseif ($status_peminjaman == 'dikembalikan') { ?>
            <span>Dikembalikan</span>
            <?php }elseif ($status_peminjaman == 'telat') { ?>
            <span>Telat</span>
            <?php } ?>
        </td>
    </tr>
    <?php } ?>
</table>