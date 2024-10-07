import 'package:flutter/material.dart';

// Kelas untuk tampilan utama
class InfoScreen extends StatelessWidget {
  final List<Map<String, String>> informationItems = [
    {
      'title': 'Pentas Seni',
      'date': '2024-09-24',
      'description':
          'Pentas seni akan dimulai hari kamis ini pada tanggal 26 September 2024. Have Fun!!!.'
    },
    {
      'title': 'TransFourKr4b',
      'date': '2024-09-15',
      'description': 'Transforkrab hadir kembali pada tanggal 10 Oktober 2024.'
    },
    {
      'title': 'Kegiatan Pembiasaan P5 Senam Pagi',
      'date': '2024-09-17',
      'description':
          'Ikuti kegiatan pembiasaan p5 senam pagi pada tanggal 17 September 2024. Jangan lupa memakai seragam.'
    },
    {
      'title': 'Pendaftaran Kegiatan Ekstrakurikuler',
      'date': '2024-08-03',
      'description':
          'Pendaftaran untuk kegiatan ekstrakurikuler semester ini akan ditutup pada tanggal 20 September 2024. Daftarkan diri Anda sekarang!'
    },
    {
      'title': 'Classmeeting Mobile Legends',
      'date': '2024-06-28',
      'description':
          'Final Classmeeting mobile legends antara kelas XI PPLG 2 dan X TJKT 2.'
    },
    {
      'title': 'Workshop Pengembangan Pengajar',
      'date': '2024-08-24',
      'description':
          'Terdapat workshop untuk para guru sehingga murid pulang lebih awal'
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Group information by time periods
    final today = DateTime.now();
    final oneWeekAgo = today.subtract(const Duration(days: 7));
    final oneMonthAgo = today.subtract(const Duration(days: 30));

    final todayItems = informationItems.where((item) {
      final date = DateTime.parse(item['date']!);
      return date.isAfter(today.subtract(const Duration(days: 1))) &&
          date.isBefore(today.add(const Duration(days: 1)));
    }).toList();

    final weekAgoItems = informationItems.where((item) {
      final date = DateTime.parse(item['date']!);
      return date.isAfter(oneWeekAgo) && date.isBefore(today);
    }).toList();

    final monthAgoItems = informationItems.where((item) {
      final date = DateTime.parse(item['date']!);
      return date.isBefore(oneWeekAgo) && date.isAfter(oneMonthAgo);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              // Navigasi ke tampilan riwayat informasi
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HistoryScreen(informationItems: informationItems),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          if (todayItems.isNotEmpty) _buildSection('Today', todayItems),
          if (weekAgoItems.isNotEmpty)
            _buildSection('A Week Ago', weekAgoItems),
          if (monthAgoItems.isNotEmpty)
            _buildSection('A Month Ago', monthAgoItems),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Map<String, String>> items) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          for (var item in items)
            Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['date']!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['description']!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Kelas untuk tampilan riwayat informasi
class HistoryScreen extends StatelessWidget {
  final List<Map<String, String>> informationItems;

  const HistoryScreen({super.key, required this.informationItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat Informasi',
          style: TextStyle(
            color: Colors.white, // Mengubah warna teks menjadi putih
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: informationItems.length,
        itemBuilder: (context, index) {
          final item = informationItems[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['date']!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['description']!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
