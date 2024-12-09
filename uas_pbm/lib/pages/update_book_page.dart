import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateBookPage extends StatefulWidget {
  final Map<String, dynamic> book; // Menerima data buku untuk diupdate

  const UpdateBookPage({Key? key, required this.book}) : super(key: key);

  @override
  State<UpdateBookPage> createState() => _UpdateBookPageState();
}

class _UpdateBookPageState extends State<UpdateBookPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _synopsisController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Menampilkan data buku yang ada ke dalam form
    _titleController.text = widget.book['title'];
    _authorController.text = widget.book['author'];
    _genreController.text = widget.book['genre'];
    _synopsisController.text = widget.book['synopsis'] ?? '';
  }

  Future<void> updateBook() async {
    final response = await http.post(
      Uri.parse('http://localhost/library_system/update.php'),
      body: {
        'id': widget.book['id'], // ID buku yang diupdate
        'title': _titleController.text,
        'author': _authorController.text,
        'genre': _genreController.text,
        'synopsis': _synopsisController.text,
      },
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responseData['message'])),
      );
      Navigator.pop(context); // Kembali ke halaman sebelumnya setelah update
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update book')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _authorController,
              decoration: const InputDecoration(labelText: 'Author'),
            ),
            TextField(
              controller: _genreController,
              decoration: const InputDecoration(labelText: 'Genre'),
            ),
            TextField(
              controller: _synopsisController,
              decoration: const InputDecoration(labelText: 'Synopsis'),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateBook,
              child: const Text('Update Book'),
            ),
          ],
        ),
      ),
    );
  }
}
