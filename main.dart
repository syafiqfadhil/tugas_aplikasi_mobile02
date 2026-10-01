enum JenisKendaraan {motor,mobil}

int hitungJamParkir(int totalMenit) {
  int jam =totalMenit ~/ 60;
  final int sisaMenit = totalMenit % 60; // pake final karena nilai sisa waktu ga akan diubah lagi
  
  // jika ada sisa menit di bulatkan keatas
  if (sisaMenit > 0) { 
    jam = jam + 1;
  }

  // rule minimal parkir itu 1 jam
  if (jam < 1) {
    jam = 1;
  }

  return jam;
}

int hitungTarifParkir(JenisKendaraan kendaraan, int totalMenit) {
  final int totalJam = hitungJamParkir(totalMenit);
  int totalTarif = 0;

  switch (kendaraan) {
    case JenisKendaraan.motor:
      totalTarif = 2000 + ((totalJam - 1) * 1000);
      break;

    case JenisKendaraan.mobil:
      totalTarif = 5000 + ((totalJam - 1) * 3000);
      break;
  }

  return totalTarif;
}

void main() {
  print('Motor, 30 menit   : Rp${hitungTarifParkir(JenisKendaraan.motor, 30)}');
  print('Motor, 150 menit  : Rp${hitungTarifParkir(JenisKendaraan.motor, 150)}');
  print('Mobil, 60 menit   : Rp${hitungTarifParkir(JenisKendaraan.mobil, 60)}');
  print('Mobil, 181 menit  : Rp${hitungTarifParkir(JenisKendaraan.mobil, 181)}');
}
