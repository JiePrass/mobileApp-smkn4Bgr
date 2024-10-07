import 'package:flutter/material.dart'; // Mengimpor paket Material Design Flutter
import '../pages/home.dart'; // Mengimpor file home.dart yang berisi halaman HomeScreen
import '../pages/info.dart'; // Mengimpor file info.dart yang berisi halaman InfoScreen
import '../pages/profile.dart'; // Mengimpor file profile.dart yang berisi halaman ProfileScreen
import '../pages/news.dart'; // Mengimpor file news.dart yang berisi halaman NewsScreen
import 'login.dart'; // Mengimpor file login.dart yang berisi halaman LoginScreen

// ===================== CLASS WelcomeScreen =======================
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() =>
      _WelcomeScreenState(); // Membuat state untuk WelcomeScreen
}

// =================== STATE dari WelcomeScreen =====================
class _WelcomeScreenState extends State<WelcomeScreen> {
  // Variabel untuk melacak indeks tab yang dipilih
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan berdasarkan tab yang dipilih
  final List<Widget> _pages = [
    const HomeScreen(), // Halaman HomeScreen
    InfoScreen(), // Halaman InfoScreen
    NewsScreen(), // Halaman NewsScreen - Pindah ke posisi ini
    const ProfileScreen(), // Halaman ProfileScreen - Pindah ke posisi ini
  ];

  // Fungsi untuk mengganti tab yang dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Mengubah indeks tab yang dipilih
    });
  }

  // Fungsi untuk melakukan logout dan kembali ke halaman login
  void _logout() {
    // Mengarahkan pengguna ke halaman LoginScreen dan mengganti halaman saat ini
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              LoginScreen()), // Arahkan ke halaman LoginScreen
    );
  }

  // ======================= BUILD METHOD ==========================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ===================== APPBAR ===========================
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu,
              color: Colors.white), // Warna tombol hamburger putih
          onPressed: () {
            // Aksi ketika tombol hamburger ditekan
          },
        ),
        title: const Text(
          'SMKN 4 Bogor',
          style: TextStyle(
            fontSize: 24, // Ukuran teks
            fontWeight: FontWeight.bold, // Teks tebal
            color: Colors.white, // Warna teks putih
          ),
        ),
        centerTitle: true, // Memusatkan teks di AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.logout,
                color: Colors.white), // Warna ikon notifikasi putih
            onPressed: () {
              _logout();
            },
          ),
        ],
        backgroundColor: Colors.blueAccent, // Warna background AppBar
        elevation: 4.0, // Shadow bawah AppBar
      ),

      // ===================== BODY ===========================
      body: _pages[
          _selectedIndex], // Menampilkan halaman berdasarkan indeks tab yang dipilih

      // ============== BOTTOM NAVIGATION BAR =================
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // Daftar item navigasi bawah
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon untuk tab Home
            label: 'Home', // Label untuk tab Home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info), // Ikon untuk tab Info
            label: 'Info', // Label untuk tab Info
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article), // Ikon untuk tab News
            label: 'News', // Label untuk tab News
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Ikon untuk tab Profile
            label: 'Profile', // Label untuk tab Profile
          ),
        ],
        currentIndex: _selectedIndex, // Menandakan tab yang saat ini dipilih
        selectedItemColor: Colors.blue, // Warna untuk item yang dipilih
        unselectedItemColor: Colors.grey, // Warna untuk item yang tidak dipilih
        onTap: _onItemTapped, // Fungsi yang dipanggil saat tab diklik
        showUnselectedLabels:
            true, // Menampilkan label pada item yang tidak dipilih
      ),
    );
  }
}
