import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

void main() {
  runApp(Calculadora());
}

class OperadorButton extends StatelessWidget {
  final IconData icone;
  final Function() funcao;

  OperadorButton(this.icone, this.funcao);

  Widget build(BuildContext context) {
    return Expanded(child: Container(
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: IconButton(
        icon: Icon(icone),
        color: Colors.white,
        onPressed: funcao,
      ),
    ),);
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final TextEditingController texto1Controller = TextEditingController();

  final TextEditingController texto2Controller = TextEditingController();

  _CalculadoraState() {
    texto1Controller.text = "12345";
    texto2Controller.text = "76543";
    resultado = 12345.74;
  }

  double resultado = 0.0;

  void somarOnPressed() {
    double operando1 = double.parse(texto1Controller.text);
    double operando2 = double.parse(texto2Controller.text);

    setState(() {
      resultado = operando1 + operando2;
    });
  }

  void subtrairOnPressed() {
    double operando1 = double.parse(texto1Controller.text);
    double operando2 = double.parse(texto2Controller.text);

    setState(() {
      resultado = operando1 - operando2;
    });
  }

  void multiplicarOnPressed() {
    double operando1 = double.parse(texto1Controller.text);
    double operando2 = double.parse(texto2Controller.text);

    setState(() {
      resultado = operando1 * operando2;
    });
  }

  void dividirOnPressed() {
    double operando1 = double.parse(texto1Controller.text);
    double operando2 = double.parse(texto2Controller.text);

    setState(() {
      resultado = operando1 / operando2;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculadora"),
        ),
        body: Container(
          child: Column(
            children: [
              Container(height: 20.0),
              // Operando 1
              Text("Operando 1"),
              // __________________
              OperandoInput(texto1Controller),

              // Operando 2
              Text("Operando 2"),
              // __________________
              OperandoInput(texto2Controller),

              // + - * /
              Container(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OperadorButton(Icons.add, somarOnPressed),
                    OperadorButton(LineIcons.minus, subtrairOnPressed),
                    OperadorButton(LineIcons.times, multiplicarOnPressed),
                    OperadorButton(LineIcons.divide, dividirOnPressed),
                  ],
                ),
              ),
              // Resultado da operacao
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      resultado.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                      ),
                    ),
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

class OperandoInput extends StatelessWidget {
  final TextEditingController textoController;

  const OperandoInput(this.textoController);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: textoController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(border: OutlineInputBorder()),
      ),
    );
  }
}
