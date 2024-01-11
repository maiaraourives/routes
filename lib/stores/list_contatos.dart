// ignore_for_file: prefer_final_fields

import 'package:routes/configs/assets/assets_path.dart';

import '../models/contatos_model.dart';

class Listas {
  List<ContatosModel> _listaContatos = [
    ContatosModel(
      nome: 'Camila Lemos',
      numero: '(55) 55 9 9061-7342',
      perfil: AssetsPath.CAMILA,
    ),
    ContatosModel(
      nome: 'Carlos Mateus',
      numero: '(55) 55 9 9875-5214',
      perfil: AssetsPath.CARLOS,
    ),
    ContatosModel(
      nome: 'Carmelinda Patos',
      numero: '(55) 55 9 9957-3175',
      perfil: AssetsPath.CARMELINDA,
    ),
    ContatosModel(
      nome: 'Gabriel Matos',
      numero: '(55) 55 9 9725-7154',
      perfil: AssetsPath.GABRIEL,
    ),
    ContatosModel(
      nome: 'Luana Maria',
      numero: '(55) 55 9 9317-6596',
      perfil: AssetsPath.LUANA,
    ),
    ContatosModel(
      nome: 'Leona de Paula',
      numero: '(55) 55 9 9125-3642',
      perfil: AssetsPath.LEONA,
    ),
    ContatosModel(
      nome: 'Micaela Franco',
      numero: '(55) 55 9 9510-3014',
      perfil: AssetsPath.MICAELA,
    ),
    ContatosModel(
      nome: 'Pedro França',
      numero: '(55) 55 9 9201-7816',
      perfil: AssetsPath.PEDRO,
    ),
    ContatosModel(
      nome: 'Paulo Will',
      numero: '(55) 55 9 9636-3636',
      perfil: AssetsPath.PEDRO_WILL,
    ),
    ContatosModel(
      nome: 'Tomás Carter',
      numero: '(55) 55 9 9487-0241',
      perfil: AssetsPath.TOMAS,
    ),
  ];

  List<ContatosModel> get listaContatoss => _listaContatos;
}
