import 'dart:io';

void main() {
  stdout.write("Masukkan skor (0 - 100): ");
  int? skor = int.tryParse(stdin.readLineSync() ?? "");

  if (skor == null || skor < 0 || skor > 100) {
    print("Error: Skor harus angka antara 0 - 100!");
    return;
  }

  String grade;
  if (skor >= 85) grade = "A";
  else if (skor >= 70) grade = "B";
  else if (skor >= 60) grade = "C";
  else if (skor >= 50) grade = "D";
  else grade = "E";

  print("Skor Anda: $skor\nGrade Anda: $grade");
}
