import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Stack untuk bagian atas (background gambar + konten profil)
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                // Background gambar di bagian atas
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/img/profileRenji.jpg"), // Ganti dengan path gambar Anda
                      fit: BoxFit
                          .cover, // Mengatur gambar agar mengisi container
                    ),
                  ),
                ),

                // Kotak putih yang berisi profil dan menu
                Positioned(
                  top: 100, // Agar kotak masuk ke dalam area background gambar
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.only(top: 70, bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'Renjie Syarbaini Prasetya',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'renjieprass@gmail.com',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // List menu
                          ListTile(
                            leading:
                                const Icon(Icons.person, color: Colors.black87),
                            title: const Text('Profile Details'),
                            trailing:
                                const Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () {},
                          ),
                          const Divider(height: 1),
                          ListTile(
                            leading:
                                const Icon(Icons.grade, color: Colors.black87),
                            title: const Text('Grades'),
                            trailing:
                                const Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () {},
                          ),
                          const Divider(height: 1),
                          ListTile(
                            leading: const Icon(Icons.assignment,
                                color: Colors.black87),
                            title: const Text('Assignments'),
                            trailing:
                                const Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () {},
                          ),
                          const Divider(height: 1),
                          ListTile(
                            leading: const Icon(Icons.schedule,
                                color: Colors.black87),
                            title: const Text('Schedule'),
                            trailing:
                                const Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () {},
                          ),
                          const Divider(height: 1),
                          ListTile(
                            leading: const Icon(Icons.message,
                                color: Colors.black87),
                            title: const Text('Messages'),
                            trailing:
                                const Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Foto Profil
                const Positioned(
                  top: 50,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/img/profileRenji.jpg"),
                  ),
                ),
              ],
            ),

            const SizedBox(
                height: 20), // Jarak antar elemen setelah kotak profil

            // Tambahkan konten tambahan untuk memastikan tampilan bisa di-scroll
            Container(
              height: 400, // Memastikan ada ruang untuk scroll
              color: Colors.transparent, // Warna transparan
            ),

            // Tombol Logout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                // Menempatkan tombol di tengah
                child: SizedBox(
                  width: 121, // Mengatur lebar tombol menjadi lebih pendek
                  child: ElevatedButton(
                    onPressed: () {
                      // Aksi logout di sini
                      // Contoh: Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .red, // Menggunakan backgroundColor untuk warna tombol
                      padding: const EdgeInsets.symmetric(
                          vertical: 11), // Padding vertikal
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Menempatkan elemen di tengah
                      children: const [
                        Icon(Icons.logout, color: Colors.white), // Ikon logout
                        SizedBox(width: 10), // Jarak antara ikon dan teks
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
                height: 20), // Jarak antar elemen setelah tombol logout
          ],
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(
      home: ProfileScreen(),
    ));
