import 'package:findoutmole/screen/register_screen/terms_Screen.dart';
import 'package:flutter/material.dart';

class Condiciones extends StatefulWidget {
  final void Function(bool accepted)? onChanged;

  const Condiciones({
    super.key,
    this.onChanged,
  });

  @override
  State<Condiciones> createState() => _CondicionesState();
}

class _CondicionesState extends State<Condiciones> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value ?? false;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(_isChecked);
            }
          },
        ),
        Expanded(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Text(
                'Acepto los ',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
                
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TermsScreen()),
                  );
                },
                style: estiloBoton(),
                child: const Text(
                  'términos y condiciones',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ButtonStyle estiloBoton() {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
      overlayColor: WidgetStateProperty.all<Color>(
        Colors.white.withOpacity(0.1),
      ),
      padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
    );
  }
}