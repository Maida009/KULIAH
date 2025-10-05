import 'dart:io';

void main() {
  // Daftar menu makanan dan minuman
  Map<String, int> menu = {
    'Nasi Goreng': 20000,
    'Mie Ayam': 18000,
    'Ayam Geprek': 22000,
    'Es Teh Manis': 5000,
    'Jus Alpukat': 12000,
    'Kopi Hitam': 8000,
  };

  bool lanjutPesan = true;

  while (lanjutPesan) {
    print('==============================');
    print('     SELAMAT DATANG DI RESTO  ');
    print('==============================');
    print('\nDaftar Menu:');
    int nomor = 1;
    menu.forEach((nama, harga) {
      print('$nomor. $nama - Rp${harga}');
      nomor++;
    });

    // Menyimpan pesanan pengguna
    List<String> pesanan = [];
    int totalHarga = 0;

    while (true) {
      stdout.write('\nMasukkan nomor menu yang ingin dipesan (atau 0 untuk selesai): ');
      String? input = stdin.readLineSync();

      if (input == null || input.isEmpty) {
        print('Input tidak boleh kosong!');
        continue;
      }

      int pilihan = int.tryParse(input) ?? -1;

      if (pilihan == 0) break;

      if (pilihan < 1 || pilihan > menu.length) {
        print('Nomor menu tidak valid, coba lagi.');
        continue;
      }

      // Ambil item berdasarkan nomor
      String namaMenu = menu.keys.elementAt(pilihan - 1);
      pesanan.add(namaMenu);
      totalHarga += menu[namaMenu]!;

      print('✅ $namaMenu ditambahkan ke pesanan.');
    }

    if (pesanan.isEmpty) {
      print('\nAnda belum memesan apapun.');
    } else {
      print('\n==============================');
      print('       RINCIAN PESANAN');
      print('==============================');
      for (var item in pesanan) {
        print('- $item : Rp${menu[item]}');
      }
      print('------------------------------');
      print('Total Harga: Rp$totalHarga');
      print('==============================');

      // Proses pembayaran
      while (true) {
        stdout.write('\nMasukkan jumlah uang pembayaran: Rp');
        String? bayarInput = stdin.readLineSync();

        if (bayarInput == null || bayarInput.isEmpty) {
          print('Input tidak boleh kosong!');
          continue;
        }

        int bayar = int.tryParse(bayarInput) ?? 0;
        if (bayar < totalHarga) {
          print('❌ Uang Anda kurang! Total yang harus dibayar: Rp$totalHarga');
        } else {
          int kembalian = bayar - totalHarga;
          print('\n✅ Pembayaran berhasil!');
          print('Kembalian Anda: Rp$kembalian');
          break;
        }
      }
    }

    // Konfirmasi untuk pesan lagi
    stdout.write('\nApakah Anda ingin memesan lagi? (y/n): ');
    String? jawaban = stdin.readLineSync();

    if (jawaban == null || jawaban.toLowerCase() != 'y') {
      lanjutPesan = false;
      print('\nTerima kasih telah memesan di restoran kami!');
    } else {
      print('\nMemulai pesanan baru...\n');
    }
  }
}
