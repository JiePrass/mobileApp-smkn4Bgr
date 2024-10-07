import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NewsScreen extends StatelessWidget {
  final List<Map<String, String?>> newsItems = [
    {
      'title': 'Penerimaan Peserta Didik Baru',
      'date': '2024-04-19',
      'description':
          'Pendaftaran peserta didik baru untuk smkn 4 bogor gelombang 1.',
      'image':
          'https://images.pexels.com/photos/7648023/pexels-photo-7648023.jpeg'
    },
    {
      'title': 'Neospragma',
      'date': '2024-09-08',
      'description':
          'Ikuti kegiatan pentas seni smkn 4 bogor NEOSPRAGMA yang akan diadakan di SMKN 4 Bogor pada tanggal 26 September 2024. Beli tiket Anda sekarang!',
      'image':
          'https://images.pexels.com/photos/915788/pexels-photo-915788.jpeg'
    },
    {
      'title': 'Classmeeting 2024',
      'date': '2024-09-05',
      'description': 'Jangan lewatkan kegiatan classmeeting smkn 4 bogor!',
      'image':
          'https://images.pexels.com/photos/1015430/pexels-photo-1015430.jpeg'
    },
    {
      'title': 'Pengumuman Hasil Pemilihan Ketua Osis',
      'date': '2024-09-01',
      'description':
          'Hasil pemilihan ketua osis smkn 4 bogor telah diumumkan. Cek pilihan anda di Announce.',
      'image':
          'https://images.pexels.com/photos/7648953/pexels-photo-7648953.jpeg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Hero Section for Latest News as Carousel with padding
          Padding(
            padding: const EdgeInsets.only(
                top: 24.0,
                left: 16.0,
                right: 16.0), // Tambahkan padding di atas, kiri, dan kanan
            child: CarouselSlider.builder(
              itemCount: newsItems.length,
              itemBuilder: (context, index, realIndex) {
                final item = newsItems[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(
                          item['image']!), // Use the image from the list
                      fit: BoxFit
                          .cover, // Make the image cover the entire container
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(
                            0.5), // Add dark overlay for text visibility
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'] ?? 'No Title', // Gunakan fallback value
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['date'] ?? 'No Date', // Gunakan fallback value
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Text(
                            item['description'] ??
                                'No Description', // Gunakan fallback value
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                viewportFraction: 0.8,
              ),
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: newsItems.length,
              itemBuilder: (context, index) {
                final item = newsItems[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'] ?? 'No Title', // Gunakan fallback value
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['date'] ?? 'No Date', // Gunakan fallback value
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Text(
                            item['description'] ??
                                'No Description', // Gunakan fallback value
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
