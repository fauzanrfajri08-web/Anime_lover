import '../models/anime_item.dart';

const List<AnimeItem> kAnimeCatalog = [
  AnimeItem(
    title: 'A Whisker Away',
    imagePath: 'assets/images/A Whisker Away.jpg',
    genre: 'Keluarga',
    year: 2020,
    rating: '6.8',
    duration: '1h 45m',
    synopsis:
        'Seorang gadis unik berubah menjadi kucing untuk menarik perhatian orang yang disukainya. '
        'Namun perlahan, batas antara manusia dan hewan mulai kabur.',
    cast: ['Mirai Shida', 'Natsuki Hanae', 'Hiroaki Ogi'],
  ),
  AnimeItem(
    title: 'Spirited Away',
    imagePath: 'assets/images/spirited away.jpg',
    genre: 'Petualangan',
    year: 2001,
    rating: '8.6',
    duration: '2h 5m',
    synopsis:
        'Chihiro tersesat di dunia roh dan harus bekerja di pemandian ajaib untuk menyelamatkan orang tuanya.',
    cast: ['Rumi Hiiragi', 'Miyu Irino'],
  ),
  AnimeItem(
    title: 'Chainsaw Man',
    imagePath: 'assets/images/Chainsaw_Man.jpg',
    genre: 'Aksi',
    year: 2022,
    rating: '8.5',
    duration: '22m / episode',
    synopsis:
        'Denji, seorang remaja miskin yang menyatu dengan iblis gergaji mesin bernama Pochita dan berubah menjadi manusia setengah iblis untuk membasmi ancaman makhluk jahat.',
    cast: ['Tomori Kusunoki', 'Akari Kitō', 'Shogo Sakata'],
  ),
  AnimeItem(
    title: 'A Silent Voice',
    imagePath: 'assets/images/A Silent Voice.jpg',
    genre: 'Drama',
    year: 2016,
    rating: '8.2',
    duration: '2h 10m',
    synopsis:
        'Kisah penebusan dosa antara seorang mantan perundung dan teman tunarungu yang dulu ia sakiti.',
    cast: ['Miyu Irino', 'Saori Hayami'],
  ),
  AnimeItem(
    title: 'Your Name',
    imagePath: 'assets/images/Your Name.jpg',
    genre: 'Romansa',
    year: 2016,
    rating: '8.4',
    duration: '1h 46m',
    synopsis:
        'Dua remaja asing bertukar tubuh secara misterius dan perlahan jatuh cinta melintasi waktu.',
    cast: ['Ryunosuke Kamiki', 'Mone Kamishiraishi'],
  ),
  AnimeItem(
    title: 'Frieren: Beyond Journeys End',
    imagePath: 'assets/images/Frieren.jpg',
    genre: 'Fantasi',
    year: 2023,
    rating: '8.7',
    duration: '22m / episode',
    synopsis:
        'Frieren, seorang penyihir yang telah bertualang selama bertahun-tahun, kini berada di akhir perjalanannya dan mempertanyakan makna dari hidupnya.',
    cast: ['Yui Ishikawa', 'Kensho Ono'],
  ),
  AnimeItem(
    title: 'Oshi No Ko',
    imagePath: 'assets/images/Oshi No Ko.jpg',
    genre: 'Drama',
    year: 2023,
    rating: '8.3',
    duration: '22m / episode',
    synopsis:
        'Seorang dokter kandungan yang bereinkarnasi menjadi anak kembar dari idola pop terkenal dan menghadapi sisi gelap industri hiburan.',
    cast: ['Ayane Sakura', 'Kaito Ishikawa', 'Akari Kitō'],
  ),
];

List<String> get kAnimeGenres => [
      'Semua',
      ...{for (final item in kAnimeCatalog) item.genre},
    ];