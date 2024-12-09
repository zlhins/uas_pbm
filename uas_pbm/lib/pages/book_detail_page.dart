import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  final Map<String, dynamic> book; // Menerima parameter book dari HomePage

  const BookDetailPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Menampilkan judul buku
            Text(
              book['title'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Menampilkan penulis buku
            Text(
              'Author: ${book['author']}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),

            // Menampilkan genre buku
            Text(
              'Genre: ${book['genre']}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),

            // Menampilkan sinopsis buku
            const Text(
              'Synopsis:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              book['synopsis'] ??
                  'No synopsis available', // Menangani jika sinopsis kosong
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Tombol untuk meminjam buku
            ElevatedButton(
              onPressed: () {
                // Tampilkan dialog pemberitahuan
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Success'),
                      content: const Text(
                        'Buku berhasil dipinjam, silakan diambil.',
                        style: TextStyle(color: Colors.green),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Tutup dialog
                            Navigator.pop(
                                context); // Kembali ke halaman sebelumnya (home page)
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Borrow Book'),
            ),
          ],
        ),
      ),
    );
  }
}
