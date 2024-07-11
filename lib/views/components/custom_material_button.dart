import 'package:flutter/material.dart';

class CustomMaterialButtom extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomMaterialButtom({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      onPressed: onPressed,
      color: Theme.of(context).primaryColor, // Cor do botão conforme o tema do aplicativo
      textColor: Colors.white, // Cor do texto dentro do botão
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0), // Raio de borda de 4 pixels
      ),
      child: Text(text),
    );
  }
}
