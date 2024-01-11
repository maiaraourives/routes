// ignore_for_file: non_constant_identifier_names

library criando_package;

import 'package:flutter/material.dart';

class CardUsuario extends StatelessWidget {
  const CardUsuario({
    required this.numero,
    required this.nome,
    required this.perfil,
    this.textColor,
    this.onSelect,
    this.future,
    this.hasSelected = false,
    super.key,
  });

  final Function()? onSelect;
  final Future<Object?>? future;
  final bool hasSelected;
  final String nome;
  final String numero;
  final String perfil;
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
        onTap: onSelect,
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
                        perfil,
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
                          nome,
                          style: TextStyle(
                            color: Colors.grey[600] ?? textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          numero,
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
