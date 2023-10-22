import 'package:contatos/models/contato.dart';
import 'package:contatos/pages/add_contact_page.dart';
import 'package:contatos/repositories/contato_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ContatoRepository repository;
  late List<Contato> contatos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getContatos();
  }

  void getContatos() async {
    // repository = await ContatoRepository.load();
    // contatos = repository.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contatos')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: 2,
        itemBuilder: (context, index) {
          if (contatos.isNotEmpty) {
            final item = Contato.create('/foto', 'Erick', '999999999');

            return _buildItem(item);
          } else {
            return Center(child: Text('Nenhum contato salvo.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => AddContactPage()),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget _buildItem(Contato item) => Card(
      child: ListTile(
        title: Text(
          item.nome,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Text(item.numero),
      ),
    );
