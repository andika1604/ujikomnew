<?php
session_start();
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

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="./assets/style.css">

    <!-- ✅ NEW: Custom styling for table responsiveness -->
    <style>
    .table-responsive {
        overflow-x: auto;
        -webkit-overflow-scrolling: touch;
        max-height: 600px;
        /* Optional: limit vertical scroll */
    }

    table {
        min-width: 1000px;
    }

    table td,
    table th {
        padding: 0.5rem;
        font-size: 0.875rem;
        vertical-align: middle;
    }

    .btn-sm {
        padding: 0.25rem 0.5rem;
        font-size: 0.75rem;
    }
    </style>
</head>

<body>
    <header>
        <p>MyPerpus</p>
        <div>
            <div id="kategori-wrapper">
                <span id="toggle-kategori">Kategori ▼</span>
                <ul id="kategori-list">
                    <?php
                    include '../koneksi.php';
                    $data = "SELECT * FROM kategoribuku";
                    $result = mysqli_query($koneksi, $data);
                    while ($row = mysqli_fetch_assoc($result)) { ?>
                    <li>
                        <a href="kategori.php?nama_kategori=<?= $row['nama_kategori']; ?>">
                            <?= $row['nama_kategori']; ?>
                        </a>
                    </li>
                    <?php } ?>
                </ul>
            </div>
            <a href="index.php">Dashboard</a>
            <a href="buku.php">Buku</a>
            <a href="koleksi.php">Koleksi</a>
            <a href="../logout.php">Logout</a>
        </div>
    </header>

    <main>
        <div class="container-fluid mt-4">
            <div class="card-header py-3">
                <h4 class="m-0 font-weight-bold text-primary">Koleksi Peminjaman</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable">
                        <thead class="table-secondary">
                            <tr>
                                <th>No</th>
                                <th>Peminjam</th>
                                <th>Buku</th>
                                <th>Tanggal Peminjaman</th>
                                <th>Tanggal Pengembalian</th>
                                <th>Status Peminjaman</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            include('../koneksi.php');
                            $no = 1;
                            $id_user = $_SESSION['id_user'];
                            $query = mysqli_query($koneksi, "SELECT * FROM peminjaman, buku, user 
                  WHERE peminjaman.id_user = user.id_user 
                  AND peminjaman.id_buku = buku.id_buku 
                  AND peminjaman.id_user = $id_user 
                  ORDER BY tanggal_peminjaman ASC");

                            while ($row = mysqli_fetch_array($query)) {
                                $color = match ($row['status_peminjaman']) {
                                    'dipinjam' => "text-bg-success",
                                    'dikembalikan' => "text-bg-warning",
                                    'telat' => "text-bg-danger",
                                    default => "",
                                };

                                $tanggal_pengembalian = strtotime($row['tanggal_pengembalian']);
                                $tanggal_sekarang = strtotime(date('Y-m-d'));
                                if ($tanggal_pengembalian < $tanggal_sekarang && $row['status_peminjaman'] != 'dikembalikan') {
                                    mysqli_query($koneksi, "UPDATE peminjaman SET status_peminjaman = 'telat' WHERE id_peminjaman = '" . $row['id_peminjaman'] . "'");
                                    $row['status_peminjaman'] = 'telat';
                                    $color = "text-bg-danger";
                                }
                            ?>
                            <tr>
                                <td><?= $no++; ?></td>
                                <td><?= $row['nama_lengkap']; ?></td>
                                <td><?= $row['judul']; ?></td>
                                <td><?= $row['tanggal_peminjaman']; ?></td>
                                <td class="<?= $row['status_peminjaman'] == 'telat' ? 'text-danger' : ''; ?>">
                                    <?= $row['tanggal_pengembalian']; ?>
                                </td>
                                <td><span
                                        class="badge rounded-pill <?= $color; ?>"><?= $row['status_peminjaman']; ?></span>
                                </td>
                                <td>
                                    <a href="#" data-bs-toggle="modal"
                                        data-bs-target="#modalDetailGenerate<?= $row['id_peminjaman']; ?>"
                                        class="btn btn-sm btn-secondary">detail</a>

                                    <?php if ($row['status_peminjaman'] != 'dikembalikan') { ?>
                                    <a href="#" class="btn btn-sm btn-warning" data-bs-toggle="modal"
                                        data-bs-target="#updateStatus<?= $row['id_peminjaman']; ?>">status</a>
                                    <?php } elseif ($row['status_peminjaman'] == 'dikembalikan') { ?>
                                    <a href="proses/hapus-koleksi.php?id_peminjaman=<?= $row['id_peminjaman']; ?>"
                                        onclick="return confirm('yakin untuk dihapus?');"
                                        class="btn btn-sm btn-danger">hapus</a>
                                    <?php } ?>

                                    <?php if ($row['status_peminjaman'] == 'dipinjam') { ?>
                                    <a href="baca_sekarang.php?id_buku=<?= $row['id_buku']; ?>"
                                        class="btn btn-sm btn-primary my-1">Baca Sekarang</a>
                                    <?php } ?>
                                </td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

        <!-- Modals Detail dan Status -->
        <?php
        $result = mysqli_query($koneksi, "SELECT * FROM peminjaman, user, buku WHERE peminjaman.id_user=user.id_user AND peminjaman.id_buku=buku.id_buku ORDER BY tanggal_peminjaman ASC");
        while ($row = mysqli_fetch_array($result)) {
        ?>
        <!-- Modal Detail -->
        <div class="modal fade" id="modalDetailGenerate<?= $row['id_peminjaman']; ?>" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5"><i class="bi bi-journal-bookmark-fill"></i> Detail Laporan</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-4"><img src="../img/<?= $row['image']; ?>" alt="" width="200"></div>
                            <div class="col-md-8">
                                <p><strong>Peminjam:</strong> <?= $row['nama_lengkap']; ?></p>
                                <p><strong>Judul Buku:</strong> <?= $row['judul']; ?></p>
                                <p><strong>Tanggal Peminjaman:</strong> <?= $row['tanggal_peminjaman']; ?></p>
                                <p><strong>Tanggal Pengembalian:</strong> <?= $row['tanggal_pengembalian']; ?></p>
                                <p><strong>Status:</strong> <?= $row['status_peminjaman']; ?></p>
                                <?php if ($row['status_peminjaman'] == "telat") { ?>
                                <p class="text-danger">Buku harus segera dikembalikan untuk menghindari denda.</p>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a href="ulasan.php?id_buku=<?= $row['id_buku']; ?>" class="btn btn-warning">Ulasan</a>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Status -->
        <div class="modal fade" id="updateStatus<?= $row['id_peminjaman']; ?>" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <form action="proses/edit-status.php" method="POST" class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5">Kembalikan Buku</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="id_peminjaman" value="<?= $row['id_peminjaman']; ?>">
                        <input type="text" class="form-control mb-2" name="status_peminjaman" value="kembalikan buku"
                            readonly>
                        <?php if ($row['status_peminjaman'] == "telat") { ?>
                        <div class="text-danger">Tolong segera dikembalikan</div>
                        <?php } ?>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                        <button type="submit" class="btn btn-success">Kembalikan</button>
                    </div>
                </form>
            </div>
        </div>
        <?php } ?>
    </main>

    <!-- ✅ NEW: Only one Bootstrap bundle script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous">
    </script>

    <script>
    const toggleKategori = document.getElementById('toggle-kategori');
    const kategoriList = document.getElementById('kategori-list');
    const wrapper = document.getElementById('kategori-wrapper');

    toggleKategori.addEventListener('click', () => {
        kategoriList.style.display = (kategoriList.style.display === 'none' || kategoriList.style.display ===
                '') ?
            'block' : 'none';
    });

    document.addEventListener('click', (e) => {
        if (!wrapper.contains(e.target)) {
            kategoriList.style.display = 'none';
        }
    });
    </script>
</body>

</html>