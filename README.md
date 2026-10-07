# Anime Login + Home App (Flutter)

Template login (gaya "MuseStock") yang lanjut ke halaman home bertema anime

## Struktur

```
lib/
  main.dart                  -> entry point, tema, route awal (LoginPage)
  theme/app_theme.dart       -> warna & gradient terpusat
  widgets/
    animated_entrance.dart   -> fade + slide-up entrance (dipakai berulang)
    gradient_button.dart     -> tombol gradient dengan efek scale saat ditekan
    social_icon_button.dart  -> ikon Facebook / Apple / Google
  screens/
    login_page.dart          -> panel form kiri + panel navy kanan (responsif)
    home_page.dart           -> top bar, hero banner, list "More for you"
assets/images/
  login_banner.jpg           -> placeholder dari gambar referensi anda
  home_hero.jpg               -> placeholder dari gambar referensi anda
```

## Animasi yang sudah dipasang

- **Login page**
  - Semua elemen form (logo, judul, field, tombol, ikon sosial) muncul
    bertahap dengan efek fade + slide (`AnimatedEntrance`, delay berjenjang).
  - Karakter anime di panel kanan "mengambang" pelan (loop naik-turun).
  - Tombol **Login** mengecil saat ditekan lalu menampilkan spinner sebelum
    pindah halaman.
  - Transisi ke Home Page pakai `PageRouteBuilder` custom (fade + slide),
    bukan transisi default.
- **Home page**
  - Top bar meluncur dari atas.
  - Hero banner + judul + deskripsi + tombol "Watch Now" muncul bertahap.
  - Kartu rekomendasi di "More for you" muncul satu per satu dari kanan
    (staggered), dan membesar (scale) saat di-hover (mode desktop/web) atau
    disentuh.

## Cara menjalankan

1. Pastikan Flutter SDK sudah terpasang (`flutter --version`).
2. Dari folder project ini:
   ```bash
   flutter pub get
   flutter run -d chrome   # untuk web
   # atau
   flutter run              # untuk emulator/device   ```

## Kustomisasi cepat

- Ganti warna tema di `lib/theme/app_theme.dart`.
- Ganti daftar rekomendasi anime di `_recommended` dalam `home_page.dart`.
- Ganti logika login (`_handleLogin` di `login_page.dart`) dengan pemanggilan
  API/auth sungguhan — saat ini hanya simulasi delay 900ms.
