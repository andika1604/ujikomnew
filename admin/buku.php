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
    <title>Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">

</head>

<body>
    <div class="container">
        <div class="content mt-3">
            <div class="card bg-secondary bg-gradient">
                <div class="card-body">
                    <a href="index.php" class="btn text-light">Dashboard</a>
                    <a href="kategori-buku.php" class="btn text-light">Kategori Buku</a>
                    <a href="buku.php" class="btn text-light">Buku</a>
                    <a href="user.php" class="btn text-light">Users</a>
                    <a href="koleksi-ulasan.php" class="btn text-light">Ulasan Buku</a>
                    <a href="generate.php" class="btn text-light">Laporan Peminjaman</a>
                    <a href="../logout.php" class="btn text-light">Logout</a>

                </div>
            </div>
        </div>

        <div class="container-fluid">
            <br>
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h3 class="m-0 font-weight-bold text-primary mt-3">Data Buku</h3>
                    <div class="row my-3">
                        <div class="col-4">
                            <form action="" method="get">
                                <div class="input-group">
                                    <input type="text" name="keyword" class="form-control" placeholder="Cari buku" aria-label="Cari buku" aria-describedby="button-addon2" autofocus>
                                    <button class="btn btn-outline-secondary" type="submit" name="cari">Cari data</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-8">
                            <div class="d-flex justify-content-end">
                                <a class="btn btn-success" href="" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="bi bi-plus-lg"></i> Tambah Buku</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead class="table table-secondary text-center">
                                <tr>
                                    <th>No</th>
                                    <th>Kategori Buku</th>
                                    <th>Judul</th>
                                    <th>Penulis</th>
                                    <th>Penerbit</th>
                                    <th>Tahun Terbit</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody class="text-center">
                                <?php
                                include('../koneksi.php');

                                $no = 1;
                                if (isset($_GET['cari'])) {
                                    $keyword = $_GET['keyword'];

                                    // Lakukan pencarian
                                    $query = "SELECT * FROM buku, kategoribuku 
                                               WHERE buku.id_kategori=kategoribuku.id_kategori 
                                                 AND (judul LIKE '%$keyword%' 
                                                  OR penulis LIKE '%$keyword%'
                                                  OR penerbit LIKE '%$keyword%'
                                                  OR tahun_terbit LIKE '%$keyword%')
                                            ORDER BY id_buku ASC";

                                    $result = mysqli_query($koneksi, $query);

                                    if (mysqli_num_rows($result) > 0) {
                                        // Tampilkan hasil pencarian
                                        while ($row = mysqli_fetch_array($result)) {
                                ?>
                                            <tr>
                                                <td><?php echo $no++; ?></td>
                                                <td><?= $row['nama_kategori']; ?></td>
                                                <td><?php echo $row['judul']; ?></td>
                                                <td><?php echo $row['penulis']; ?></td>
                                                <td><?php echo $row['penerbit']; ?></td>
                                                <td><?php echo $row['tahun_terbit']; ?></td>
                                                <td>
                                                    <a href="" data-bs-toggle="modal" data-bs-target="#modalDetailBuku<?php echo $row['id_buku']; ?>" class="btn btn-secondary">detail</a>
                                                    <a href="" data-bs-toggle="modal" data-bs-target="#modalEditBuku<?php echo $row['id_buku']; ?>" class="btn btn-info">edit</a>
                                                    <a href="proses/hapus-buku.php?id_buku=<?php echo $row['id_buku']; ?>" onclick="return confirm('yakin untuk dihapus?');" class="btn btn-danger">hapus</a>
                                                </td>
                                            </tr>
                                        <?php
                                        }
                                    } else {
                                        // Tampilkan pesan jika data tidak ditemukan
                                        echo '<tr><td colspan="7" class="text-center">Data tidak ditemukan</td></tr>';
                                    }
                                } else {
                                    // Tampilkan semua data jika tidak ada pencarian
                                    $no = 1;
                                    $query = "SELECT * FROM buku, kategoribuku WHERE buku.id_kategori=kategoribuku.id_kategori ORDER BY id_buku ASC";
                                    $result = mysqli_query($koneksi, $query);
                                    while ($row = mysqli_fetch_array($result)) {
                                        ?>
                                        <tr>
                                            <td><?php echo $no++; ?></td>
                                            <td><?= $row['nama_kategori']; ?></td>
                                            <td><?php echo $row['judul']; ?></td>
                                            <td><?php echo $row['penulis']; ?></td>
                                            <td><?php echo $row['penerbit']; ?></td>
                                            <td><?php echo $row['tahun_terbit']; ?></td>
                                            <td>
                                                <a href="" data-bs-toggle="modal" data-bs-target="#modalDetailBuku<?php echo $row['id_buku']; ?>" class="btn btn-secondary">detail</a>
                                                <a href="" data-bs-toggle="modal" data-bs-target="#modalEditBuku<?php echo $row['id_buku']; ?>" class="btn btn-info">edit</a>
                                                <a href="proses/hapus-buku.php?id_buku=<?php echo $row['id_buku']; ?>" onclick="return confirm('yakin untuk dihapus?');" class="btn btn-danger">hapus</a>
                                            </td>
                                        </tr>
                                <?php
                                    }
                                }
                                ?>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- modal detail buku -->
        <?php
        $data = "SELECT * FROM buku, kategoribuku WHERE buku.id_kategori=kategoribuku.id_kategori ORDER BY id_buku ASC";
        $result = mysqli_query($koneksi, $data);
        while ($row = mysqli_fetch_array($result)) {
        ?>
            <div class="modal fade" id="modalDetailBuku<?= $row['id_buku']; ?>" tabindex="-1" aria-labelledby="modalDetailBukuLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="modalDetailBukuLabel"><i class="bi bi-journal-bookmark-fill"></i>
                                Detail buku</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <img src="../img/<?= $row['image']; ?>" alt="" width="200">
                                    </div>
                                    <div class="col-md-8">
                                        <form action="">
                                            <div class="row mb-3">
                                                <div class="col-sm-3">
                                                    <label for="" class="col-form-label">Kategori Buku</label>
                                                </div>
                                                <div class="col-sm-9">
                                                    <label for="" class="col-form-label"><?= $row['nama_kategori']; ?></label>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-sm-3">
                                                    <label for="" class="col-form-label">Judul Buku</label>
                                                </div>
                                                <div class="col-sm-9">
                                                    <label for="" class="col-form-label"><?= $row['judul']; ?></label>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-sm-3">
                                                    <label for="" class="col-form-label">Penulis</label>
                                                </div>
                                                <div class="col-sm-9">
                                                    <label for="" class="col-form-label"><?= $row['penulis']; ?></label>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-sm-3">
                                                    <label for="" class="col-form-label">Penerbit</label>
                                                </div>
                                                <div class="col-sm-9">
                                                    <label for="" class="col-form-label"><?= $row['penerbit']; ?></label>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-sm-3">
                                                    <label for="" class="col-form-label">Tahun Terbit</label>
                                                </div>
                                                <div class="col-sm-9">
                                                    <label for="" class="col-form-label"><?= $row['tahun_terbit']; ?></label>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-sm-3">
                                                    <label for="" class="col-form-label">Deskripsi</label>
                                                </div>
                                                <div class="col-sm-9">
                                                    <label for="" class="col-form-label"><?= $row['deskripsi']; ?></label>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        <?php } ?>

        <!-- modal tambah buku -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Tambah Data Buku</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="proses/tambah-buku.php" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="form-row">
                                <div class="class"></div>
                                <label for="kategoribuku" class="mb-2">Kategori Buku</label>
                                <select class="form-control" name="id_kategori" id="id_kategori">
                                    <option selected disable>Pilih Kategori</option>
                                    <?php
                                    $k = mysqli_query($koneksi, "SELECT * FROM kategoribuku ORDER BY id_kategori ASC");
                                    while ($rowk = mysqli_fetch_assoc($k)) {
                                    ?>
                                        <option value="<?php echo $rowk['id_kategori']; ?>">
                                            <?php echo $rowk['nama_kategori']; ?></option>
                                    <?php } ?>
                                </select>
                            </div>

                            <div class="form-group mt-2">
                                <label for="judul" class="mb-2">Judul Buku</label>
                                <input type="text" name="judul" id="judul" class="form-control" placeholder="Masukkan Judul Buku">
                            </div>

                            <div class="form-group mt-2">
                                <label for="penulis" class="mb-2">Penulis Buku</label>
                                <input type="text" name="penulis" id="penulis" class="form-control" placeholder="Masukkan Nama Penulis Buku">
                            </div>

                            <div class="form-group mt-2">
                                <label for="penerbit" class="mb-2">Penerbit Buku</label>
                                <input type="text" name="penerbit" id="penerbit" class="form-control" placeholder="Masukkan Nama Penerbit Buku">
                            </div>

                            <div class="form-group mt-2">
                                <label for="tahun_terbit" class="mb-2">Tahun Terbit</label>
                                <input type="text" name="tahun_terbit" id="tahun_terbit" class="form-control" placeholder="Masukkan Tahun Terbit Buku">
                            </div>

                            <div class="form-group mt-2">
                                <label for="image" class="mb-2">Gambar Buku</label>
                                <input type="file" name="image" id="image" class="form-control">
                            </div>

                            <div class="form-group mt-2">
                                <label for="tahun_terbit">Deskripsi Buku</label>
                                <textarea name="deskripsi" id="deskripsi" placeholder="Deskripsi buku" class="form-control" rows="10"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                            <button type="submit" class="btn btn-primary">Simpan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!-- modal edit buku -->
        <?php

        $data = "SELECT * FROM buku, kategoribuku WHERE buku.id_kategori=kategoribuku.id_kategori ORDER BY id_buku ASC";
        $result = mysqli_query($koneksi, $data);
        while ($row = mysqli_fetch_array($result)) {
        ?>
            <div class="modal fade" id="modalEditBuku<?= $row['id_buku']; ?>" tabindex="-1" aria-labelledby="modalEditBukuLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="modalEditBukuLabel">Edit Data Buku</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="proses/edit-buku.php" method="post" enctype="multipart/form-data">
                            <div class="modal-body">
                                <div class="form-group mt-2">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <img src="../img/<?= $row['image']; ?>" alt="gambar" width="150">
                                        </div>
                                        <div class="col-sm-9">
                                            <label for="image" class="form-label">Gambar Buku</label>
                                            <input type="file" name="image" id="image" class="form-control">
                                            <input type="hidden" name="id_buku" id="id_buku" class="form-control" value="<?= $row['id_buku']; ?>">
                                            <input type="hidden" name="gambar_lama" value="<?= $row['image']; ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row mt-3">
                                    <label for="kategoribuku" class="mb-2">Kategori Buku</label>
                                    <select class="form-control" name="id_kategori" id="id_kategori">
                                        <option value="<?php echo $row['id_kategori']; ?>"><?php echo $row['nama_kategori']; ?></option>
                                        <?php
                                        $k = mysqli_query($koneksi, "SELECT * FROM kategoribuku ORDER BY id_kategori ASC");
                                        while ($rowk = mysqli_fetch_assoc($k)) {
                                        ?>
                                            <option value="<?php echo $rowk['id_kategori']; ?>">
                                                <?php echo $rowk['nama_kategori']; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div class="form-group mt-2">
                                    <input type="hidden" name="id_buku" id="id_buku" class="form-control" value="<?= $row['id_buku']; ?>">
                                    <label for="judul" class="mb-2">Judul Buku</label>
                                    <input type="text" name="judul" id="judul" class="form-control" placeholder="Masukkan Judul Buku" value="<?= $row['judul']; ?>">
                                </div>
                                <div class="form-group mt-2">
                                    <label for="penulis" class="mb-2">Penulis Buku</label>
                                    <input type="text" name="penulis" id="penulis" class="form-control" placeholder="Masukkan Nama Penulis Buku" value="<?= $row['penulis']; ?>">
                                </div>
                                <div class="form-group mt-2">
                                    <label for="penerbit" class="mb-2">Penerbit Buku</label>
                                    <input type="text" name="penerbit" id="penerbit" class="form-control" placeholder="Masukkan Nama Penerbit Buku" value="<?= $row['penerbit']; ?>">
                                </div>

                                <div class="form-group mt-2">
                                    <label for="tahun_terbit" class="mb-2">Tahun Terbit</label>
                                    <input type="text" name="tahun_terbit" id="tahun_terbit" class="form-control" placeholder="Masukkan Tahun Terbit Buku" value="<?= $row['tahun_terbit']; ?>">
                                </div>
                                <div class="form-group mt-2">
                                    <label for="tahun_terbit" class="mb-2">Deskripsi Buku</label>
                                    <textarea name="deskripsi" id="deskripsi" rows="10" placeholder="Deskripsi buku" class="form-control"><?= $row['deskripsi']; ?></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                                <button type="submit" class="btn btn-primary">Edit Data</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        <?php
        }
        ?>

        <!-- footer -->
        <div class="content mt-3 fixed-bottom bg-white">
            <p class="text-center"> Aplikasi Perpustakaan Digital | 2024 </p>
        </div>

        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>

</html>