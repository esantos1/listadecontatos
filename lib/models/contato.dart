// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'contato.g.dart';

@HiveType(typeId: 0)
class Contato extends HiveObject {
  @HiveField(0)
  late String _pathPhoto;

  @HiveField(1)
  late String _nome;

  @HiveField(2)
  late String _numero;

  Contato();

  Contato.create(this._pathPhoto, this._nome, this._numero);

  String get pathPhoto => _pathPhoto;
  set pathPhoto(String pathPhoto) => _pathPhoto = pathPhoto;

  String get nome => _nome;
  set nome(String nome) => _nome = nome;

  String get numero => _numero;
  set numero(String numero) => _numero = numero;

  @override
  String toString() =>
      'Contato(_pathPhoto: $_pathPhoto, _nome: $_nome, _numero: $_numero)';
}
