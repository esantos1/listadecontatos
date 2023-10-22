import 'package:contatos/constants.dart';
import 'package:contatos/models/contato.dart';
import 'package:hive/hive.dart';

class ContatoRepository {
  static late Box _box;

  ContatoRepository.empty();

  static Future<ContatoRepository> load() async {
    if (Hive.isBoxOpen(boxContatos)) {
      _box = Hive.box(boxContatos);
    } else {
      _box = await Hive.openBox(boxContatos);
    }

    return ContatoRepository.empty();
  }

  void save(Contato contato) {
    _box.put(boxContatos, {
      'pathPhoto': contato.pathPhoto,
      'nome': contato.nome,
      'numero': contato.numero,
    });
  }

  List<Contato> getData() {
    var boxContatosSend = _box.get(boxContatos) ?? Contato();

    if (boxContatosSend == null) {
      return <Contato>[];
    }

    return _box.values.cast<Contato>().toList();
  }
}
