import 'package:flutter/material.dart';
import 'package:routes/widgets/cs_app_bar.dart';

import '../../models/contatos_model.dart';
import '../../widgets/cs_icon.dart';

class DadosView extends StatefulWidget {
  const DadosView({required this.dados, super.key});

  final ContatosModel dados;

  @override
  State<DadosView> createState() => _DadosViewState();
}

class _DadosViewState extends State<DadosView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const CsAppBar(title: 'Dados'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        primary: true,
        child: SizedBox(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: double.maxFinite,
                height: 300,
                color: theme.primaryColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 79,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          widget.dados.perfil,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 220,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(62), topRight: Radius.circular(62)),
                  ),
                  child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.only(left: 15, top: 5, bottom: 10, right: 20),
                    children: [
                      ListTile(
                        title: const Text('Nome', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          widget.dados.nome,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(color: Color.fromRGBO(158, 158, 158, 1), fontSize: 14),
                        ),
                        leading: const CsIcon.icon(
                          icon: Icons.person,
                          size: 30,
                        ),
                      ),
                      ListTile(
                        title: const Text('Número', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          widget.dados.numero,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(color: Color.fromRGBO(158, 158, 158, 1), fontSize: 14),
                        ),
                        leading: const CsIcon.icon(
                          icon: Icons.phone,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
