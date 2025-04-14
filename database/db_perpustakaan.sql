-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2025 at 06:21 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT 'default.jpeg',
  `penulis` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `tahun_terbit` int(11) NOT NULL,
  `deskripsi` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `id_kategori`, `judul`, `image`, `penulis`, `penerbit`, `tahun_terbit`, `deskripsi`) VALUES
(25, 10, 'Bumi', 'Bumi – Book Review.jfif', 'Tere Liye', 'Gramedia Pustaka', 2014, '&quot;Bumi&quot; adalah awal dari petualangan seru Raib, seorang remaja yang tampak biasa namun ternyata memiliki kemampuan luar biasa: bisa menghilang. Sejak kecil, Raib menyimpan rahasia tentang kekuatannya itu tanpa pernah tahu asal usulnya. Hidupnya berubah total ketika ia bertemu dengan seorang pria misterius bernama Tamus, yang datang dari dunia lain untuk menculiknya.\r\n\r\nBersama dua sahabatnya, Seli (yang memiliki kekuatan listrik) dan Ali (seorang jenius dengan IQ tinggi), mereka terseret ke dalam dunia paralel bernama Tierra, tempat kekuatan super seperti mereka berasal. Dunia ini memiliki aturan, peradaban, dan konflik yang sangat berbeda dengan Bumi. Di Tierra, mereka bertemu Miss Selena, seorang guru sekaligus mentor yang membantu mereka memahami misi mereka.\r\n\r\nDalam perjalanan mereka, mereka menghadapi bahaya dari Tamus yang berusaha menghancurkan keseimbangan antar dunia ini. Buku ini memperkenalkan pembaca pada konsep dunia paralel, kekuatan khas tiap klan, dan misi besar yang harus dijalankan oleh Raib dan kawan-kawan sebagai pelindung dunia.\r\n\r\n'),
(26, 10, 'Lumpu', '6ede6e9e-1da0-4c0b-9391-7f9d0b6ae4f3.jfif', 'Tere Liye', 'Gramedia Pustaka', 2018, '\"Lumpu\" adalah salah satu buku tergelap dan paling emosional dalam serial ini. Ceritanya fokus pada tokoh Lumpu, sosok misterius yang selama ini hanya muncul sekilas dalam petualangan Raib dkk. Buku ini membongkar siapa sebenarnya Lumpu dan bagaimana ia menjadi salah satu tokoh paling berpengaruh dalam konflik dunia paralel.\r\n\r\nLumpu memiliki masa lalu yang tragis. Ia bukan hanya seorang penjahat, tetapi seseorang yang terluka dan dikhianati oleh sistem. Melalui sudut pandang yang lebih dewasa dan serius, buku ini menyajikan konflik batin, pengkhianatan, serta pengorbanan besar yang membuat pembaca berpikir tentang arti keadilan dan balas dendam.\r\n\r\nRaib dan kawan-kawan harus menghadapi kebenaran yang menyakitkan. Mereka juga menyadari bahwa tidak semua yang tampak jahat benar-benar jahat, dan tidak semua yang tampak baik benar-benar baik. \"Lumpu\" memberi lapisan kedalaman psikologis pada serial ini, menjadikannya lebih dari sekadar petualangan remaja.'),
(28, 10, 'Selena', 'bf9fece2-9ab7-47b3-9d54-927b54d0312d.jfif', 'Tere Liye', 'Gramedia Pustaka', 2020, '\"Selena\" adalah buku prekuel dari serial Bumi yang mengisahkan masa muda Miss Selena, guru dan mentor dari Raib. Dalam buku ini, pembaca diajak menyelami sejarah kelam yang menjadi latar dari konflik besar antar dunia paralel.\r\n\r\nSelena diceritakan sebagai gadis muda pemberani yang sejak kecil telah menunjukkan bakat luar biasa. Bersama sahabatnya Mata, mereka menjadi petarung dan pelindung di dunia mereka. Petualangan mereka membawanya ke berbagai tempat berbahaya, bertemu dengan para tokoh legendaris, dan menghadapi banyak kehilangan.\r\n\r\nBuku ini menjelaskan asal mula kekuatan dunia paralel, munculnya sistem klan, dan benih-benih konflik yang kemudian memengaruhi kehidupan Raib dan kawan-kawan di masa depan. Dengan gaya narasi yang emosional, buku ini menunjukkan sisi manusiawi dari seorang guru yang sebelumnya terlihat tenang dan penuh rahasia.'),
(29, 10, 'Komet', 'Komet.jfif', 'Tere Liye', 'Gramedia Pustaka', 2018, 'Setelah berhasil menyelamatkan Tierra, Raib, Seli, dan Ali kini melanjutkan perjalanan ke Klan Komet, sebuah dunia paralel lain yang sangat maju secara teknologi dan ilmiah. Di sana, mereka harus memecahkan misteri baru yang berhubungan dengan rencana jahat dari pihak-pihak yang ingin menguasai seluruh dunia paralel.\r\n\r\nKlan Komet adalah tempat yang sangat menarik namun penuh bahaya. Kota-kota terapung, kendaraan terbang, hingga sistem informasi canggih menjadi latar cerita penuh imajinasi. Di balik keindahan dan kemajuannya, tersembunyi konspirasi besar yang melibatkan pejabat tinggi dan ilmuwan yang mengembangkan senjata berbahaya.\r\n\r\nAli mulai tampil lebih dominan dalam pemecahan masalah, sementara hubungan antara Raib dan Seli juga makin kuat. Di akhir cerita, mereka menemukan bahwa ancaman terhadap dunia tidak hanya berasal dari luar, tetapi juga dari dalam, termasuk pengkhianatan yang terjadi di lingkaran terdekat mereka.'),
(30, 10, 'Komet Minor', '2c256dcb-3d53-493c-92a9-b25815530aaf.jfif', 'Tere Liye', 'Gramedia Pustaka', 2019, 'Buku ini merupakan kelanjutan dari Komet, dan menjadi titik balik penting dalam serial ini. Di \"Komet Minor\", Raib, Seli, dan Ali kembali berpetualang, kali ini dengan misi menyusup dan membongkar organisasi bawah tanah yang menjadi dalang dari kekacauan di Klan Komet dan dunia paralel lainnya.\r\n\r\nMereka menemukan bahwa \"komet minor\" adalah simbol dari kekuatan tersembunyi yang telah lama dikembangkan secara diam-diam oleh pihak yang ingin menjatuhkan sistem pemerintahan antar klan. Mereka harus berpacu dengan waktu, berhadapan dengan jebakan berbahaya, dan menghadapi tokoh-tokoh yang tak terduga.\r\n\r\nBuku ini memiliki nuansa investigasi dan aksi yang lebih kompleks. Di tengah ketegangan, tetap ada sentuhan humor dari Ali dan momen persahabatan yang menyentuh antara mereka bertiga. Konflik makin besar dan meluas, memperlihatkan bahwa dunia paralel memiliki rahasia yang jauh lebih dalam.');

-- --------------------------------------------------------

--
-- Table structure for table `kategoribuku`
--

CREATE TABLE `kategoribuku` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategoribuku`
--

INSERT INTO `kategoribuku` (`id_kategori`, `nama_kategori`) VALUES
(1, 'NonFiksi'),
(7, 'Fiksi'),
(10, 'Novel'),
(13, 'Dongeng'),
(14, 'Cerpen');

-- --------------------------------------------------------

--
-- Table structure for table `kategoribuku_relasi`
--

CREATE TABLE `kategoribuku_relasi` (
  `id_kategoribuku` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `koleksipribadi`
--

CREATE TABLE `koleksipribadi` (
  `id_koleksi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `koleksipribadi`
--

INSERT INTO `koleksipribadi` (`id_koleksi`, `id_user`, `id_buku`) VALUES
(22, 25, 28);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `tanggal_peminjaman` date NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  `status_peminjaman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_user`, `id_buku`, `tanggal_peminjaman`, `tanggal_pengembalian`, `status_peminjaman`) VALUES
(36, 25, 28, '2025-04-14', '2025-04-21', 'dipinjam');

-- --------------------------------------------------------

--
-- Table structure for table `ulasanbuku`
--

CREATE TABLE `ulasanbuku` (
  `id_ulasan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `ulasan` text NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `level` enum('admin','petugas','peminjam') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `email`, `nama_lengkap`, `alamat`, `level`) VALUES
(21, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@gmail.com', 'admin', 'admin', 'admin'),
(23, 'andika', '7e51eea5fa101ed4dade9ad3a7a072bb', 'andika.engineering@gmail.com', 'Andika Firmansyah', 'JL. PULAU JAWA RAYA PERUMNAS 3, DESA AREN JAYA, KECAMATAN BEKASI TIMUR', 'petugas'),
(25, 'dika', 'e9ce15bcebcedde2cb3cf9fe8f84fc0c', 'dika@gmail.com', 'dika', 'dika', 'peminjam');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `kategoribuku`
--
ALTER TABLE `kategoribuku`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  ADD PRIMARY KEY (`id_kategoribuku`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  ADD PRIMARY KEY (`id_koleksi`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  ADD PRIMARY KEY (`id_ulasan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `kategoribuku`
--
ALTER TABLE `kategoribuku`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  MODIFY `id_kategoribuku` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  MODIFY `id_koleksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  MODIFY `id_ulasan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  ADD CONSTRAINT `kategoribuku_relasi_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`),
  ADD CONSTRAINT `kategoribuku_relasi_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategoribuku` (`id_kategori`);

--
-- Constraints for table `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  ADD CONSTRAINT `koleksipribadi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `koleksipribadi_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);

--
-- Constraints for table `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  ADD CONSTRAINT `ulasanbuku_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `ulasanbuku_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
