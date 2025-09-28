void main() {
  String nama = "Maida";
  int jamKerja = 21;
  double upahPerJam = 50000;
  bool tetap = true;

  double gajiKotor = jamKerja * upahPerJam;

  double pajak;
  if (tetap) {
    pajak = 0.10 * gajiKotor;
  } else {
    pajak = 0.05 * gajiKotor;
  }

  double gajiBersih = gajiKotor - pajak;

  print("Nama         : $nama");
  print("Jam Kerja    : $jamKerja jam");
  print("Upah per Jam : Rp$upahPerJam");
  print("Status       : ${tetap ? "Tetap" : "Kontrak"}");
  print("Gaji Kotor   : Rp$gajiKotor");
  print("Pajak        : Rp$pajak");
  print("Gaji Bersih  : Rp$gajiBersih");
}
