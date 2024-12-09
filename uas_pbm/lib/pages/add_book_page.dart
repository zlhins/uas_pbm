import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddBookPage extends StatefulWidget {
  const AddBookPage({Key? key}) : super(key: key);

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _synopsisController = TextEditingController();

  Future<void> addBook() async {
    final response = await http.post(
      Uri.parse('http://localhost/library_system/create.php'),
      body: {
        'title': _titleController.text,
        'author': _authorController.text,
        'genre': _genreController.text,
        'synopsis': _synopsisController.text,
      },
    );
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Book added successfully')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to add book')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Book')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Upper shape for title, author, and genre
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
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
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Bottom shape for synopsis
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: _synopsisController,
                decoration: const InputDecoration(labelText: 'Synopsis'),
                maxLines: 5,
                minLines: 3,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addBook,
              child: const Text('Add Book'),
            ),
          ],
        ),
      ),
    );
  }
}
