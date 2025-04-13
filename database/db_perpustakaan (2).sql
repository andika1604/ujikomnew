-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Mar 2024 pada 05.33
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 8.0.3

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
-- Struktur dari tabel `buku`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `id_kategori`, `judul`, `image`, `penulis`, `penerbit`, `tahun_terbit`, `deskripsi`) VALUES
(1, 13, 'Kancil dan Buaya', 'kanccil dan buaya.jpg', 'Rahimidin Zahari', 'Bestari', 2016, 'Suatu hari, ada Kancil berjalan-jalan di dalam hutan untuk mencari makanan. Karena makanan di sekitar kediamannya telah berkurang, Kancil pun pergi untuk mencari di luar kawasannya.\r\n\r\nSaat dihadapkan dengan sungai yang harus disebranginya, Kancil mendapati banyak sekali buaya yang sedang kelaparan. Saat mendekati tepi sungai, ia pun memerintahkan kepada Buaya untuk memanggil kawanannya sebab Raja Hutan akan memberi mereka makan.\r\n\r\nKawanan Buaya itu pun diminta berbaris ke permukaan karena jumlah mereka hendak dihitung Kancil. Buaya pun menuruti perintah Kancil. Tapi ternyata itu hanyalah tipu daya Kancil agar ia dapat menyebrangi sungai tanpa cengkraman para Buaya.'),
(2, 10, 'Laut Bercerita', 'laut bercerita.jpg', 'Leila Salikha Chudori', 'Gramedia Pustaka Utama', 2017, 'Kisah dan narasi akan diceritakan melalui perspektif Biru Laut. Laut adalah seorang mahasiswa program studi Sastra Inggris di Universita Gadjah Mada, Yogyakarta. Ia sangat menggeluti dunia sastra dan tentunya tidak sedikit buku sastra klasik yang dimilikinya, baik itu buku sastra bahasa Indonesia maupun bahasa Inggris.\r\n\r\nLaut gemar membaca berbagai buku karangan Pramoedya Ananta Toer yang ketika itu peredarannya dilarang di Indonesia. Hal itu yang menekatkan dirinya secara diam-diam untuk memfotokopi buku-buku tersebut di salah satu tempat yang disebut sebagai fotokopi terlarang. Mulai dari sana, dirinya bertemu dengan Kinan, salah satu mahasiswa FISIP yang memperkenalkan Laut akan organisasi Winatra dan Wirasena.\r\n\r\nSetelah ikut bergabung dengan organisasi Winatra, Laut jadi semakin menggiatkan aktivitas diskusi buku bersama rekan-rekan seorganisasi nya. Bukan hanya buku, melainkan beberapa konsep yang hendak mereka lakukan untuk menentang doktrin pemerintah di negara ini yang telah dipimpin oleh satu presiden selama lebih dari 30 tahun.                   Kegiatan Laut tidak hanya berdiskusi di organisasinya, ia juga gemar menulis. Laut kerap menuangkan gagasannya ke dalam bentuk tulisan, kemudian tulisan itu ia kirim agar dapat dimuat oleh media cetak harian. Laut juga beberapa kali bekerja sebagai translator, misal, penerjemah dari novel bahasa Inggris ke bahasa Indonesia.\r\n\r\n\r\nDalam novel ini, diceritakan bahwa Laut beserta rekan-rekannya melaksanakan beberapa aksi atau gerakan untuk membela rakyat yang telah diambil haknya oleh pemerintah, salah satunya “Aksi Tanam Jagung Blangguan”.\r\n\r\nAkan tetapi, jauh sebelum mereka melakukan aksi tersebut, Laut bersama teman-temannya berdiskusi terlebih dahulu yang dikenal sebagai diskusi kwangju. Dari situlah, awal mula Laut dan rekan-rekannya mengetahui dan mengenal arti dari sebuah pengkhianatan.\r\n\r\n\r\nDiskusi kwangju yang semestinya berlangsung baik dan lancar justru terhambat karena adanya intel yang secara tiba-tiba mendatangi markas mereka. Namun, tidak ada yang tahu pelaku yang membocorkan diskusi mereka. Beberapa anggota dari organisasi Winatra sedikit menaruh curiga pada Naratama sebab dirinya tidak pernah tampak saat penangkapan dilakukan, tetapi itu hanyalah dugaan mereka. Belum diketahui kebenaran yang sesungguhnya seperti apa.\r\n\r\nSesudah melancarkan aksi tanam jagung di Blangguan, Laut beserta rekan-rekannya kembali ke terminal. Mereka berpisah-pisah, ada yang ke Pacet, kemudian ada yang ke Yogyakarta. Saat berada di ruang tunggu bis, terdapat sekelompok orang mencurigakan yang mengintai mereka. Hingga akhirnya, Laut, Bram, dan Alex, sementara yang lainnya entah melarikan diri ke mana.\r\n\r\nLaut, Bram, dan Alex dibawa ke suatu tempat, semacam markas tentara. Di markas, sekelompok orang itu menginterogasi Laut, Bram, dan Alex. Tidak hanya diinterogasi, mereka pun diperlakukan secara tidak manusiawi, seperti disiksa, diinjak, dipukul, dan disetrum. Pertanyaan sekelompok orang tersebut tidak lain adalah siapa dalang atas aktivitas yang mereka lakukan.\r\n\r\nSetelah kurang lebih dua hari satu malam, penganiayaan dan penyekapan itu pun berakhir. Laut, Bram, dan Alex dikembalikan ke terminal Bungurasih. Di terminal Bungurasih, Laut, Bram, dan Alex dijemput oleh kedua kakak dari Anjani. Mereka bertiga dibawa dan ditempatkan ke sebuah tempat yang aman di Pacet. Di sana ada Daniel, Kinan, Anjani, beserta teman-teman yang lain menunggu mereka.\r\n\r\n\r\nSingkatnya, Laut diringkus lagi oleh sekelompok orang yang tidak dikenal, tepatnya tanggal 13 Maret 1998. Semenjak mereka menjadi buronan di tahun 1996 sebab organisasi Winatra dan Wirasena dikatakan berbahaya bagi pemerintah kemudian Sunu, Mas Gala, dan Narendra secara tiba-tiba hilang. Kemudian, lambat laun beberapa rekan-rekan yang lain pun hilang entah ke mana. Lalu, sekarang Laut disusul oleh Alex dan Daniel yang menghilang.\r\n\r\nSaat penculikan dan penyekapan itu, mereka memperoleh siksaan yang sangat tidak manusiawi, bisa dikatakan sangat sadis dan biadab. Mereka semua dipukuli, disiram dengan air es, disetrum, digantung dengan kaki yang berada di atas dan kepala berada di bawah, ditelentangkan di atas batangan es yang sangat dingin, serta penyiksaan lainnya.\r\n\r\n\r\nDi bagian pertama, tidak hanya membicarakan terkait aktivitas Laut dan teman-temannya dalam pergerakan yang hendak mereka jalani, melain ada pula sisipan kisah antara Laut dan anggota keluarganya. Saat Laut dan teman-temannya menghilang, semua kehidupan mereka dan orang-orang terdekat mereka pun senantiasa berubah.\r\n\r\n\r\nSejak Laut kuliah di Yogyakarta, ia dengan bapak, ibu, dan Asmara (adiknya Laut) semakin jarang berkumpul bersama. Oleh sebab itu, bapaknya memutuskan bahwa hari Minggu adalah hari bersama untuk keluarga mereka, tidak boleh ada yang mengganggu. Saat makan malam adalah hal yang paling menarik bisa dikatakan menjadi sebuah ritual bagi mereka. Di sana adanya kebersamaan dan kebahagiaan yang terpancar dari wajah-wajah mereka.\r\n\r\nTak hanya itu, novel Laut Bercerita juga menyisipkan kisah antara laut dengan kegiatan kuliahnya, yakni sebagai seorang mahasiswa Sastra Inggris. Laut memang aktif di organisasi Winatra itu, tetapi dirinya tidak lupa akan pelajaran kuliahnya. Hal itu terbukti bahwa dia masih menyusun skripsi dan dapat menuntaskannya.'),
(10, 7, 'Asya Story', 'AsyaStory.jpg', 'Sabrina Febrianti', 'Rain Book', 2019, 'NAMAKU Asyara Dwista. Keluargaku sering memanggilku Syasya, sedangkan yang lain biasa memanggilku Asya. Aku baru menginjak kelas 11 SMA. Aku termasuk gadis pendiam yang tidak terlalu menyukai keramaian atau bahkan obrolan. Hobi yang pantas untukku hanyalah membaca buku.\r\nAku anak pertama dari tiga bersaudara. Bisa dibilang, aku yang paling berbeda dari adik-adikku. Bukan karena aku cacat fisik atau mempunyai kekurangan, melainkan aku diperlakukan berbeda dari adik-adikku. Mereka selalu mendapat kasih sayang lebih, sedangkan aku? Untuk mendapat sapaan lembut dari kedua orangtuaku saja jarang. Terakhir, aku-mendengarnya ketika adik-adikku belum terlahir di dunia.\r\nDan, masalahku pun hadir. Masalah yang mungkin tidak akan pernah dimaafkan oleh kedua orangtuaku.\r\nAku hamil.\r\nAku hamil bukan keinginanku, melainkan karena lelaki bernama Alex yang merupakan kakak kelasku di sekolah. Lelaki itu mengambil kehormatanku secara paksa dan membuat kehancuran masa depanku yang sudah kurancang begitu indah.\r\nPeristiwa itu terjadi ketika diriku tengah pulang sendiri, tiba-tiba Alex merigajakku untuk pulang bersama. Awalnya aku tidak percaya karena mengenainya saja aku tidak. Dengan takut, aku mencoba untuk menolaknya. Akan tetapi, dia terus memaksa, membuatku diharuskannya ikut bersamanya. Dia membawaku ke rumah kosong dan &quot;menghabisiku&quot; saat itu juga.\r\nAku begitu terpuruk. Ditambah beberapa minggu kemudian, aku mendapati diriku &quot;tidak datang tamu&quot;. Dan saat memeriksanya melalui testpack, hasilnya positif Betapa frustrasinya aku saat tahu kenyataan tersebut. Hampir berminggu-minggu aku menyimpan rahasia ini dengan sangat baik. Namun, benar kata pepatah &quot;sepandai-pandainya tupai melompat, pasti akan jatuh juga&quot;.Rahasiaku ketahuan oleh ibuku saat ia masuk ke kamarku dan menemukan testpack tersebut. Padahal, seingatku sudah kusimpan dengan baik.\r\nDengan amarah yang memuncak, ibuku langsung menarik rambutku, menyeretku sampai ke lantai bawah dan langsung menghempaskanku begitu saja, bagaikan barang yang tidak berguna.\r\n&quot;DASAR ANAK TIDAK BERGUNAI MEMALUKAN ORANGTUA!&quot; pekik ibuku sembari terus melayangkan sapu dan mendaratkannya di tubuhku, ditambah ayahku tiba-tiba menendang tubuhku sampai aku terhempas.\r\n&quot;ANAK MACAM APA KAMU, SYA! AYAH SEKOLAHKAN KAMU BUKAN UNTUK INI AKHIRNYAII&quot; Ucapan itu langsung menusuk jantungku, kata-kata yang begitu menohok dan menyakiti perasaanku.\r\nNapasku tercekat. Belati putih sudah menancap di dadaku. Aku menunduk lesu dan tidak mampu untuk berkata apa pun selain menangis. Tiba-tiba, aku merasa sakit di rambutku. Ternyata, ibuku menarik\r\nrambutku sampai aku terseret keluar rumah. Betapa malunya aku saat\r\norang-orang mulai berdatangan dan melihat betapa nahasnya aku saat ini. Ibuku sudah habis kesabaran. Aku benar-benar dipermalukan. Aku diseret Ibu sampai ke dalam mobil.\r\n&quot;Bu... sakit... lepasin rambut... Syasya, Bu,&quot; lirihku.\r\nBukannya melepaskan, kepalaku malah didorong sampai menabrak kaca mobil.\r\n&quot;DIAM, SYASYAI KAMU HARUS MENDAPATKAN PERTANGGUNGJAWABAN!!&quot;\r\nucap ibuku tanpa melihat betapa tersiksanya aku. Aku melotot. &quot;Apa yang akan ibu lakukan? Kita mau ke mana, Bu?&quot; tanyaku mencoba meminta penjelasan dari ucapan ibuku barusan.\r\n&quot;Kita akan ke sekolahmu dan menanyakan kepada semua murid di sana siapa yang membuatmu hamil!&quot; terangnya dengan nada marah, aku langsung lemas seketika.\r\nAyahku sudah menyetir mobil, sedangkan tangan ibuku masih setia menjenggut rambutku. Air mataku sudah berurai sedari tadi.\r\nHari ini, aku sudah berniat tidak masuk sekolah karena tidak enak badan. Tetapi, ibu dan ayahku tidak peduli. Kuyakin mereka akan mempermalukanku di sekolah, aku tidak mampu membayangkannya.\r\nPercayalah, setelah ini aku akan bunuh diri agar semuanya selesai. Sebelum itu, aku berdoa kepada Tuhan agar mendatangkan musibah kecelakaan di jalan dan akhirnya rencana ibuku tidak terjadi.\r\nSayangnya... kini aku, ayah, dan ibuku sudah berada di dalam area sekolah. Aku berharap hari ini aku mati dan tidak pernah dihidupkan kembali di dunia mana pun.\r\nTuhan... ujian macam apa yang kau tuliskan pada takdirku?.\r\n'),
(17, 10, 'Matahari', 'Novel Matahari.jpg', 'Tere Liye ', 'Gramedia Pustaka Utama', 2016, 'Cerita ini dibuka dengan suasana duka yang menyelimuti Raib, Seli, dan Ali atas tewasnya Ily saat pertarungan di klan Matahari (di novel sebelumnya). Para ksatria dari klan Bulan pun turut merasakan yang sama, hingga membuat Miss Selena tak dapat pulang ke klan Bumi.\r\n\r\nSaat mereka kembali ke klan Bumi, seperti biasa, disambut oleh tugas-tugas selayaknya anak sekolahan pada umumnya. Terlebih, Ali yang mendadak jadi bintang lapangan saat kompetisi basket antarsekolah yang dicurigai bahwa Raib melakukan kecurangan sebab telah menyalahgunakan hasil percobaan atau eksperimennya.\r\n\r\nSampai final pun, kelakukan tidak sportif yang dilakukan oleh lawan tanding basket sekolah mereka, mengundang amarah Ali hingga nyaris mengubah Ali menjadi seekor beruang besar. Mengetahui hal tersebut, Raib mencoba untuk menenangkan keadaan dengan kemampuan teleportasi yang ia miliki. Namun, ternyata Ali lebih cepat dibawa oleh pesawat kapsul perak.\r\n\r\n\r\nDari situlah, aksi kejar-mengejar berlangsung hingga membawa Seli dan Raib ke sebuah parkiran pesawat kapsul perak itu, tepatnya di basement rumah mewah Ali. Ternyata, Kapsul perak ini adalah sebuah eksperimen Ali yang dinamakannya Ily. Hal itu dilakukannya sebagai bentuk pengabdian bagi sahabat mereka yang sudah tewas di pertarungan. Barangkali bisa dibilang itu merupakan Ily versi kedua.\r\n\r\nAli mengakui bahwa dirinya telah menyelami berbagai pengetahuan atau ilmu baru dari tabung perak yang diberikan oleh Av. Merchandise Gift yang diberikan oleh Av ketika mereka kembali dari klan Bulan. Adapun tabung itu berisikan softcopy segala penyimpanan berkas (arsip) perpustakaan klan Bulan yang akhirnya menjadi ‘bahan’ baru bagi Ali, Raib, dan Seli.\r\n\r\n\r\nDari Av, Ali menekuni teknologi dari klan Matahari dan klan Bulan, terlebih dirinya menemukan letak posisi klan Bintang. Rasa semangat Ali kian membara untuk mengunjungi klan Bintang. Akan tetapi, Seli dan Raib enggan dan menolak ajakan Ali, bahkan Ali meminta Raib untuk memakai Buku Kehidupan yang dimilikinya. Hal tersebut tentu dibantah oleh Raib sebab itu akan menghancurkan kepercayaan Miss Selena yang mengatakan agar tidak menyentuh barang itu.\r\n\r\nDi balik itu, akhirnya ada sebuah pengakuan dari orang tua Raib mengenai dirinya, bahkan orang tuanya juga sudah tahu tujuan Raib ‘pergi liburan’ yang ia katakan selama ini adalah melakukan perjalan ke dunia paralel, termasuk petualangan dan penjelajahan kali ini, yakni ke klan Bintang.\r\n\r\nAkhirnya, tiga sekawan itu melakukan perjalan menggunakan pesawat kapsul yang terbaru, yakni Ily versi kedua. Mereka berpetualang menuju gua yang ada di perbatasan danau sebab berdasarkan pengamatan Ily V.2 lokasi tersebut menjadi mulut lorong kuno. Kemudian, berbagai pertarungan pun terjadi dan ambisi mereka terus-menerus diuji dengan berbagai hal berbahaya lainnya.\r\n\r\nSaat di Padang Kristal, mereka tepergok oleh penjaga lembah dengan seragam hitam dan dibawa hingga di Lembah Hijau. Faarazaraaf merupakan pemimpin di Lembah Hijau yang meyambut ketiga sekawan itu dengan pelayanan yang baik. Akan tetapi, sayangnya hal tersebut hanya bertahan sesaat saat pasukan bayangan hadir, dipimpin oleh Marsekal Laar.\r\n\r\n\r\nAdapun Sekretaris Dewan Kota yang ikut di rombongan tersebut melahirkan kericuhan di pondok Faar dan membawa Ali, Raib, dan Seli ke kota Zaramaraz. Pengadilan memberikan peringatan pada mereka sebab ketiga sekawan itu mempunyai kekuatan yang dilarang dekrit kota.\r\n\r\nUntungnya, ada granat EMP sehingga Ali, Raib, dan Seli bisa lolos dari pesawat ketika hendak mendarat di kota Zaramaraz. Kemudian, dengan bantuan Marsekal Lar, mereka pun menyelamatkan diri ke Restoran Lezalezel dengan tujuan bertemu Sang Hantu alias Kaar.\r\n\r\n\r\nKaar adalah perantara antara mereka untuk menjumpai arsitek kota, yakni Mer. Mer menunjukkan blue print tata kota, serta ruang Dewan Sekretaris Kota yang diduga sebagai tempat penyimpanan Buku Kehidupan Raib yang dirampas sang empunya ruangan.\r\n\r\n\r\nDi samping itu, Faar membuat kegaduhan di kota sebagai bentuk pengalihan tentara klan Bintang agar Ali, Raib, dan Seli dapat mengambil kembali Buku Kehidupan milik Raib. Nahasnya, mereka tertangkap hingga akhirnya terjadilah pertarungan yang mengharuskan Ali berubah menjadi seekor beruang besar dengan kemampuan petir milik Seli dan kekuatan teleportasi Raib. Kekuatan itu tergabung menjadi satu kesatuan, tetapi hal itu tidaklah sebanding sehingga mereka dibawa ke semacam ruangan isolasi yang menyeramkan.\r\n\r\nLantas, bagaimanakah nasib ketiga sekawan itu? Akankah ada kekuatan yang dapat mengeluarkan dan membebaskan mereka dari ruangan tersebut? Ikut keseruan kisah petualangan Raib, Ali, dan Seli dalam menghadapi berbagai pertarungan yang terjadi di klan Bintang dengan membaca novel ketiga dari serial Bumi, yakni Matahari. '),
(21, 7, 'Timun Emas', 'timun mas.jpg', 'Rahmah Asa', 'Pustaka Obor Indonesia', 2021, 'Mbok Sirni tinggal sebatang kara. Suaminya sudah lama meninggal dan ia tidak dikarunia seorang anak pun. Kesehariannya, Mbok Sirni bertani sayur-sayuran di sekitar rumah. Kemudian menjualnya ke pasar.\r\n\r\nSetiap hari Mbok Sirni selalu memohon kepada Tuhan agar dikaruniai seorang anak. Suatu hari, saat sedang berdo\'a tiba-tiba datang raksasa bermuka hijau bernama Buto Ijo.\r\n\r\n&quot;Aku bisa memberimu anak, tapi dengan satu syarat. Setelah berusia enam tahun, anak itu harus kamu berikan lagi kepadaku,&quot; kata Buto Ijo.\r\n\r\nTanpa pikir panjang, Mbok Sirni pun menyetujuinya. Buto Ijo memberikan bibit timun untuk ditanam. Katanya salah satu dari timun itu nanti ada timun paling besar berwarna emas. Timun itulah yang berisi bayi.\r\n\r\nBenar saja, dua minggu setelah bibit timun ditanam, Mbok Sirni menemukan timun yang paling besar diantara timun lainnya dan berwarna emas. Ketika dibelah, berisi bayi perempuan yang kemudian diberi nama Timun Emas oleh Mbok Sirni.\r\n\r\nBeberapa tahun berlalu, Timun Emas dan Mbok Sirni selalu bersama sampai tiba saatnya Buto Ijo datang untuk mengambil Timun Emas. Mbok Sirni sangat menyayangi Timun Emas lalu ia berdo\'a agar selalu bersama. Kemudian datanglah seorang petapa yang memberinya bungkusan kecil berisi biji mentimun, jarum, garam, dan terasi.\r\n\r\nKetika Buto Ijo mengejar Timun Emas, satu persatu bungkusan tersebut ditabur hingga menghalangi langkah Buto Ijo. Bungkusan terakhir berisi terasi yang ditabur ke arah Buto Ijo berubah menjadi lumpur panas hingga Buto Ijo meninggal.\r\n\r\nTimun Emas pun terbebas dari Buto Ijo. Ia kembali ke rumah dan hidup bahagia kembali bersama Mbok Sirni.'),
(23, 14, 'Ketika Laut Marah', 'ketika laut marah.jpg', ' Widya Suwarna', 'Bobo Grid', 2019, 'Sudah empat hari nelayan-nelayan tak bisa turun ke laut. Pada malam hari, hujan lebat turun. Gemuruh gelombang, tiupan angin kencang di kegelapan malam seolah-olah memberi tanda bahwa alam sedang murka, laut sedang marah. Bahkan, bintang-bintang pun seolah tak berani menampakkan diri.\r\n\r\nNelayan-nelayan miskin yang menggantungkan rezekinya pada laut setiap hari bersusah hati. Ibu-ibu nelayan terpaksa merelakan menjual emas simpanannya yang hanya satu dua gram untuk membeli kebutuhan sehari-hari. Mereka yang tak punya benda berharga terpaksa meminjam pada lintah darat.\r\n\r\nNamun, selama hari-hari sulit itu, ada pesta di rumah Pak Yus. Tak ada yang menikah, tak ada yang ulang tahun, dan Pak Yus juga bukan orang kaya. Pak Yus hanyalah nelayan biasa, seperti para tetangganya.\r\n\r\nPada hari-hari sulit itu, Pak Yus menyuruh istrinya memasak nasi dan beberapa macam lauk-pauk banyak-banyak. Lalu, ia mengundang anak-anak tetangga yang berkekurangan untuk makan di rumahnya. Dengan demikian rengek tangis anak yang lapar tak terdengar lagi, diganti dengan perut kenyang dan wajah berseri-seri.\r\n\r\nKini tibalah hari kelima. Pagi-pagi Ibu Yus memberi laporan, “Pak, uang kita tinggal 20.000. Kalau hari ini kita menyediakan makanan lagi untuk anak-anak tetangga, besok kita sudah tak punya uang. Belum tentu nanti sore Bapak bisa melaut!”\r\n\r\nPak Yus terdiam sejenak. Sosok tubuhnya yang hitam kukuh melangkah ke luar rumah, memandang ke arah pantai dan memandang ke langit. Nun jauh di sana segumpal awan hitam menjanjikan cuaca buruk nanti petang.\r\n\r\nKemudian, ia masuk ke rumah dan berkata mantap, “Ibu pergi saja ke pasar dan berbelanja. Seperti kemarin, ajak anak-anak tetangga makan. Urusan besok jangan dirisaukan.”\r\n\r\nIbu Yus pergi ke dapur dan mengambil keranjang pasar. Seperti biasa, ia patuh pada perintah suaminya. Selama ini Pak Yus sanggup mengatasi kesulitan apa pun. Sementara itu Pak Yus masuk ke kamar dan berdoa. la mohon agar Tuhan memberikan cuaca yang baik nanti petang dan malam. Dengan demikian para nelayan bisa pergi ke laut menangkap ikan dan besok ada cukup makanan untuk seisi desa.\r\n\r\nSiang harinya, anak-anak makan di rumah Pak Yus. Mereka bergembira. Setelah selesai, mereka menyalami Pak dan Bu Yus lalu mengucapkan terima kasih.\r\n\r\n“Pak Yus, apakah besok kami boleh makan di sini lagi?” seorang gadis kecil yang menggendong adiknya bertanya. Matanya yang besar hitam memandang penuh harap.\r\n\r\nIbu Yus tersenyum sedih. la tak tahu harus menjawab apa. Tapi dengan mantap, dengan suaranya yang besar dan berat Pak Yus berkata, “Tidak Titi, besok kamu makan di rumahmu dan semua anak ini akan makan enak di rumahnya masing-masing.”\r\n\r\nTiti dan adiknya tersenyum. Mereka percaya pada perkataan Pak Yus. Pak Yus nelayan berpengalaman. Mungkin ia tahu bahwa nanti malam cuaca akan cerah dan para nelayan akan panen ikan.\r\n\r\nKira-kira jam empat petang Pak Yus ke luar rumah dan memandang ke pantai. Laut tenang, angin bertiup sepoi-sepoi dan daun pohon kelapa gemerisik ringan. Segumpal awan hitam yang menjanjikan cuaca buruk sirna entah ke mana. la pergi tanpa pamit.\r\n\r\nMalam itu, Pak Yus dan para tetangganya pergi melaut. Perahu meluncur tenang. Para nelayan berhasil menangkap banyak ikan. Ketika fajar merekah perahu-perahu mereka menuju pantai dan disambut oleh para anggota keluarga dengan gembira.\r\n\r\nPak Yus teringat pada anak-anak tetangga. Tuhan telah menjawab doanya. Semua nelayan itu mendapat rezeki. Hari itu tak ada pesta di rumah Pak Yus. Semua anak makan di rumah ibunya masing-masing. Sekali lagi di atas perahunya, Pak Yus memanjatkan doa syukur.\r\n\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoribuku`
--

CREATE TABLE `kategoribuku` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategoribuku`
--

INSERT INTO `kategoribuku` (`id_kategori`, `nama_kategori`) VALUES
(1, 'NonFiksi'),
(7, 'Fiksi'),
(10, 'Novel'),
(13, 'Dongeng'),
(14, 'Cerpen');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoribuku_relasi`
--

CREATE TABLE `kategoribuku_relasi` (
  `id_kategoribuku` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `koleksipribadi`
--

CREATE TABLE `koleksipribadi` (
  `id_koleksi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `koleksipribadi`
--

INSERT INTO `koleksipribadi` (`id_koleksi`, `id_user`, `id_buku`) VALUES
(1, 15, 17),
(2, 8, 2),
(3, 8, 1),
(4, 8, 2),
(5, 8, 21),
(6, 15, 1),
(7, 18, 17),
(8, 8, 2),
(9, 15, 10),
(10, 8, 17),
(11, 18, 23),
(12, 18, 17),
(13, 18, 10),
(14, 18, 2),
(15, 15, 21),
(16, 15, 23),
(17, 15, 1),
(18, 18, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `tanggal_peminjaman` date NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  `status_peminjaman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_user`, `id_buku`, `tanggal_peminjaman`, `tanggal_pengembalian`, `status_peminjaman`) VALUES
(6, 8, 10, '2024-02-11', '2024-02-14', 'dikembalikan'),
(10, 15, 10, '2024-02-07', '2024-02-10', 'dikembalikan'),
(15, 15, 17, '2024-02-11', '2024-02-14', 'telat'),
(19, 8, 21, '2024-02-21', '2024-02-28', 'telat'),
(22, 8, 2, '2024-02-23', '2024-03-01', 'dipinjam'),
(26, 18, 17, '2024-03-01', '2024-03-08', 'dipinjam'),
(32, 18, 10, '2024-03-01', '2024-03-08', 'dipinjam');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ulasanbuku`
--

CREATE TABLE `ulasanbuku` (
  `id_ulasan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `ulasan` text NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ulasanbuku`
--

INSERT INTO `ulasanbuku` (`id_ulasan`, `id_user`, `id_buku`, `ulasan`, `rating`) VALUES
(6, 8, 10, 'ceritanya seru dan juga baper', 4),
(7, 15, 10, 'Bagus bikin baper', 3),
(8, 8, 21, 'bagus dongengnya, saya suka', 4),
(10, 8, 2, 'saya suka dengan ceritanya\r\n', 3),
(11, 15, 17, 'ceritanya keren\r\n', 3),
(12, 18, 23, 'ceritanya seruu\r\n', 3),
(13, 18, 17, 'sangat bagus critanya', 4),
(14, 18, 10, 'baper banget bacanya\r\n', 3),
(15, 18, 2, 'cerita fiksi sejarah yang bagus\r\n', 4),
(16, 15, 21, 'dongeng yang seru', 3),
(17, 15, 23, 'cerita cerpen yang seru', 4),
(18, 15, 1, 'dongeng kancil dan buaya yg bagus\r\n', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `level` enum('admin','petugas','peminjam') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `email`, `nama_lengkap`, `alamat`, `level`) VALUES
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@gmail.com', 'admin', '-', 'admin'),
(3, 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', 'petugas@gmail.com', 'petugas', '-', 'petugas'),
(8, 'ayu', '29c65f781a1068a41f735e1b092546de', 'ayu@gmail.com', 'ayu', 'tanggul', 'peminjam'),
(15, 'suga', '202cb962ac59075b964b07152d234b70', 'yoongi93@gmail.com', 'min yoongi', 'seoul', 'peminjam'),
(16, 'jeni', 'e8c9c132d620617aadef4ec5f51afa1d', 'jeni@gmail.com', 'jennie kim', 'surabaya', 'petugas'),
(17, 'imel', '562ab9ed1e25505af0859695c28f2588', 'imel@gmail.com', 'imel', 'Jember', 'petugas'),
(18, 'sinta', '202cb962ac59075b964b07152d234b70', 'irmanda@gmail.com', 'irmanda', 'gadingrejo', 'peminjam');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `kategoribuku`
--
ALTER TABLE `kategoribuku`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  ADD PRIMARY KEY (`id_kategoribuku`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  ADD PRIMARY KEY (`id_koleksi`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indeks untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  ADD PRIMARY KEY (`id_ulasan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `kategoribuku`
--
ALTER TABLE `kategoribuku`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  MODIFY `id_kategoribuku` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  MODIFY `id_koleksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  MODIFY `id_ulasan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  ADD CONSTRAINT `kategoribuku_relasi_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`),
  ADD CONSTRAINT `kategoribuku_relasi_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategoribuku` (`id_kategori`);

--
-- Ketidakleluasaan untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  ADD CONSTRAINT `koleksipribadi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `koleksipribadi_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);

--
-- Ketidakleluasaan untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  ADD CONSTRAINT `ulasanbuku_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `ulasanbuku_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
