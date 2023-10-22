import 'package:contatos/models/contato.dart';
import 'package:contatos/repositories/contato_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final nomeController = TextEditingController();
  final numeroController = TextEditingController();

  final contato = Contato();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar contato')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
              onTap: () => uploadImage,
              child: CircleAvatar(
                radius: 80,
                child: Icon(Icons.add_a_photo, size: 56),
              ),
            ),
            SizedBox(height: 32),
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                label: Text('Nome'),
                hintText: 'Ex.: Fulano',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: numeroController,
              decoration: InputDecoration(
                label: Text('Número'),
                hintText: 'Ex.: (11)99999-9999',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => saveContato, child: Text('Salvar')),
            ),
          ],
        ),
      ),
    );
  }

  void saveContato(BuildContext context) {
    ContatoRepository repository = ContatoRepository.empty();

    contato.pathPhoto = '/path';
    contato.nome = nomeController.text;
    contato.numero = numeroController.text;

    repository.save(contato);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Contato salvo!')),
    );
  }

  void uploadImage(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () async {
                final picker = ImagePicker();

                final XFile? photo =
                    await picker.pickImage(source: ImageSource.camera);

                if (photo != null) {
                  String path =
                      (await path_provider.getApplicationDocumentsDirectory())
                          .path;

                  String name = basename(photo.path);

                  photo.saveTo('$path/$name');
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Galeria'),
              onTap: () async {
                final picker = ImagePicker();

                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
              },
            ),
          ],
        );
      },
    );

    // Pick an image.

// Capture a photo.
  }
}
