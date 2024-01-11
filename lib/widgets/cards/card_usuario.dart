// ignore_for_file: non_constant_identifier_names

library criando_package;

import 'package:flutter/material.dart';

import '../../models/contatos_model.dart';

class CardUsuario extends StatelessWidget {
  const CardUsuario({
    required this.onSelect,
    required this.contato,
    this.future,
    this.hasSelected = false,
    this.textColor,
    super.key,
  });

  final ContatosModel contato;

  final void Function(ContatosModel) onSelect;
  final Future<Object?>? future;
  final bool hasSelected;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      child: InkWell(
        onTap: () => onSelect(contato),
        borderRadius: BorderRadius.circular(15),
        splashColor: theme.colorScheme.onPrimary,
        focusColor: theme.colorScheme.onPrimary,
        hoverColor: theme.colorScheme.onPrimary,
        highlightColor: theme.colorScheme.onPrimary,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image.asset(
                        contato.perfil,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contato.nome,
                          style: TextStyle(
                            color: Colors.grey[600] ?? textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          contato.numero,
                          style: TextStyle(
                            color: Colors.grey[600] ?? textColor,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
