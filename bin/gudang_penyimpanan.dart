
import 'dart:io';

void main() {

  var AnggotaMasukMenu = true;
  var BrandaSistem = true;
  var pin = 999;

  // DATA GUDANG A SAMPAI D
  List<Map<String, dynamic>> DataGudang = [
    {"Gudang": "A", "Barang": []},
    {"Gudang": "B", "Barang": []},
    {"Gudang": "C", "Barang": []},
    {"Gudang": "D", "Barang": []}
  ];

  // =====================================
  // MENU LOGIN
  // =====================================
  void loginmenu() {
    print("==================================");
    print("            MENU LOGIN            ");
    print("==================================");

    stdout.write("Masukan Pin = ");
    var MasukanPinLogin = int.parse(stdin.readLineSync()!);

    if (MasukanPinLogin == pin) {
      AnggotaMasukMenu = false;
      print("Login Berhasil !!!");
    } else {
      print("Anda Gagal Masuk Ke Menu Gudang !!!");
    }
  }

  // =====================================
  // NOMOR 1 - TAMBAH BARANG
  // =====================================
  void TambahBarangAnda() {

    print("==================================");
    print("         MENU TAMBAH BARANG       ");
    print("==================================");

    stdout.write("Apakah Anda Ingin Menambahkan Barang (Y/T) = ");
    var TambahBarang = stdin.readLineSync()!;

    if (TambahBarang == 'Y' || TambahBarang == 'y') {

      stdout.write("Masukan Nama Barang = ");
      var NamaBarang = stdin.readLineSync()!;

      stdout.write("Masukan Jumlah Barang = ");
      var JumlahBarang = int.parse(stdin.readLineSync()!);

      stdout.write("Pilih Gudang A/B/C/D = ");
      var PilihGudang = stdin.readLineSync()!.toUpperCase();

      var GudangDitemukan = false;

      for (var i = 0; i < DataGudang.length; i++) {

        if (DataGudang[i]["Gudang"] == PilihGudang) {

          DataGudang[i]["Barang"].add({
            "Nama": NamaBarang,
            "Jumlah": JumlahBarang
          });

          GudangDitemukan = true;

          print("==================================");
          print("Barang Berhasil Ditambahkan !!!");
          print("Nama Barang : $NamaBarang");
          print("Jumlah      : $JumlahBarang");
          print("Gudang      : $PilihGudang");
          print("==================================");

          break;
        }
      }

      if (GudangDitemukan == false) {
        print("Gudang Tidak Ditemukan !!!");
      }

    } else if (TambahBarang == 'T' || TambahBarang == 't') {

      print("Proses Penambahan Barang Dibatalkan");

    } else {

      print("Inputan Anda Tidak Valid Brooo !!!");

    }
  }

  // =====================================
  // NOMOR 2 - LIHAT BARANG
  // =====================================
  void LihatBarangGudang() {

    print("==================================");
    print("         MENU LIHAT BARANG        ");
    print("==================================");

    stdout.write("Apakah Anda Ingin Melihat Barang (Y/T) = ");
    var LihatBarang = stdin.readLineSync()!;

    if (LihatBarang == 'Y' || LihatBarang == 'y') {

      stdout.write("Pilih Gudang A/B/C/D = ");
      var PilihGudang = stdin.readLineSync()!.toUpperCase();

      var GudangDitemukan = false;

      for (var i = 0; i < DataGudang.length; i++) {

        if (DataGudang[i]["Gudang"] == PilihGudang) {

          GudangDitemukan = true;

          print("==================================");
          print("       DAFTAR BARANG GUDANG       ");
          print("==================================");
          print("Gudang : ${DataGudang[i]["Gudang"]}");

          if (DataGudang[i]["Barang"].isEmpty) {

            print("Gudang Masih Kosong !!!");

          } else {

            for (var j = 0; j < DataGudang[i]["Barang"].length; j++) {

              print("${j + 1}. ${DataGudang[i]["Barang"][j]["Nama"]}");
              print("   Jumlah : ${DataGudang[i]["Barang"][j]["Jumlah"]}");

            }
          }

          break;
        }
      }

      if (GudangDitemukan == false) {
        print("Gudang Tidak Ditemukan !!!");
      }

    } else if (LihatBarang == 'T' || LihatBarang == 't') {

      print("Pengecekan Barang Dibatalkan");

    } else {

      print("Inputan Anda Tidak Valid Brooo !!!");

    }
  }

  // =====================================
  // NOMOR 3 - HAPUS BARANG GUDANG
  // =====================================
  void HapusBarangGudang() {

    print("==================================");
    print("         MENU HAPUS GUDANG        ");
    print("==================================");

    stdout.write("Apakah Anda Ingin Menghapus Barang (Y/T) = ");
    var HapusBarang = stdin.readLineSync()!;

    if (HapusBarang == 'Y' || HapusBarang == 'y') {

      stdout.write("Pilih Gudang A/B/C/D = ");
      var PilihGudang = stdin.readLineSync()!.toUpperCase();

      var GudangDitemukan = false;

      for (var i = 0; i < DataGudang.length; i++) {

        if (DataGudang[i]["Gudang"] == PilihGudang) {

          GudangDitemukan = true;

          if (DataGudang[i]["Barang"].isEmpty) {

            print("Gudang $PilihGudang Masih Kosong !!!");

          } else {

            DataGudang[i]["Barang"].clear();

            print("==================================");
            print("Barang Gudang $PilihGudang Berhasil Dihapus !!!");
            print("Gudang $PilihGudang Sekarang Kosong");
            print("==================================");

          }

          break;
        }
      }

      if (GudangDitemukan == false) {
        print("Gudang Tidak Ditemukan !!!");
      }

    } else if (HapusBarang == 'T' || HapusBarang == 't') {

      print("Proses Penghapusan Barang Dibatalkan");

    } else {

      print("Inputan Anda Tidak Valid Brooo !!!");

    }
  }

  // =====================================
  // NOMOR 4 - KELUAR
  // =====================================
  void KeluarMenuPilih() {

    print("==================================");
    print("Terima Kasih Telah Menggunakan");
    print("SISTEM MANAJEMEN GUDANG");
    print("==================================");

    exit(0);
  }

  // =====================================
  // MENU UTAMA
  // =====================================
  void tampilanutama() {

    print("==================================");
    print("       SISTEM MANAJEMEN GUDANG    ");
    print("==================================");
    print("1. Tambah Barang");
    print("2. Lihat Barang Gudang");
    print("3. Hapus Barang Gudang");
    print("4. Keluar");
    print("==================================");

    stdout.write("Pilih Menu = ");
    var PiihMenuAnda = int.parse(stdin.readLineSync()!);

    switch (PiihMenuAnda) {

      case 1:
        TambahBarangAnda();
        break;

      case 2:
        LihatBarangGudang();
        break;

      case 3:
        HapusBarangGudang();
        break;

      case 4:
        KeluarMenuPilih();
        break;

      default:
        print("Pilihan Menu Tidak Valid !!!");
    }
  }

  // =====================================
  // SISTEM BERJALAN
  // =====================================
  while (BrandaSistem == true) {

    if (AnggotaMasukMenu == true) {

      loginmenu();

    } else if (AnggotaMasukMenu == false) {

      tampilanutama();

    } else {

      print("Waduh Salah Cikkkk");

    }
  }
}
