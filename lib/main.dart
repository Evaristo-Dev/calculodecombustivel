import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home(), debugShowCheckedModeBanner: false));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController valor = TextEditingController();
  TextEditingController autonomia = TextEditingController();
  TextEditingController distancia = TextEditingController();
  double _resultado = 0.0;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _calcular() {
    setState(() {
      double v = double.parse(
        valor.text.replaceAll(",", "."),
      );
      double a = double.parse(
        autonomia.text.replaceAll(",", "."),
      );
      double d = double.parse(
        distancia.text.replaceAll(",", ".")
      );
      _resultado = (d / a) * v;
    });
  }

  void _reset() {
    valor.text = "";
    autonomia.text = "";
    distancia.text = "";
    setState(() {
      _resultado = 0.0;
      _formKey = GlobalKey<FormState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculo de Combustível",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.refresh, color: Colors.white,
              ),
              onPressed: _reset,
              splashColor: Colors.blueAccent,
            highlightColor: Colors.lightBlue,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
             Container(
               margin: EdgeInsets.only(bottom: 30),
               child:  Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Icon(
                     Icons.attach_money,
                     size: 50.0,
                     color: Colors.lightBlue[900],
                   ),
                   Text(
                     _resultado.toStringAsFixed(2),

                     textAlign: TextAlign.center,
                     style: TextStyle(color: Colors.lightBlue[900], fontSize: 26.0),
                   ),
                 ],
               ),
             ),
             Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 TextFormField(
                   validator:
                       (value) =>
                   (value == null || value.isEmpty)
                       ? "Informe o Valor do Combustivel"
                       : null,
                   controller: valor,
                   keyboardType: TextInputType.number,
                   textAlign: TextAlign.center,
                   decoration: InputDecoration(
                     labelText: "Valor do Combustivel",
                     labelStyle: TextStyle(color: Colors.lightBlue[900]),
                   ),
                   style: TextStyle(color: Colors.lightBlue[900], fontSize: 26.0),
                 ),
                 TextFormField(
                   validator:
                       (value) =>
                   (value == null || value.isEmpty)
                       ? "Informe a autonomia do Veículo"
                       : null,
                   controller: autonomia,
                   keyboardType: TextInputType.number,
                   textAlign: TextAlign.center,
                   decoration: InputDecoration(
                     labelText: "Autonomia do Veículo",
                     labelStyle: TextStyle(color: Colors.lightBlue[900]),
                   ),
                   style: TextStyle(color: Colors.lightBlue[900], fontSize: 26.0),
                 ),
                 TextFormField(
                   validator:
                       (value) =>
                   (value == null || value.isEmpty)
                       ? "Informe a distancia percorrida"
                       : null,
                   controller: distancia,
                   keyboardType: TextInputType.number,
                   textAlign: TextAlign.center,
                   decoration: InputDecoration(
                     labelText: "Distancia percorrida",
                     labelStyle: TextStyle(color: Colors.lightBlue[900]),
                   ),
                   style: TextStyle(color: Colors.lightBlue[900], fontSize: 26.0),
                 ),
                 Padding(
                   padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                   child: Container(
                     height: 50.0,
                     child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.lightBlue[900],
                       ),
                       onPressed: () {
                         if (_formKey.currentState!.validate()) {
                           _calcular();
                         }
                       },
                       child: Text(
                         "Verificar",
                         style: TextStyle(color: Colors.white, fontSize: 25.0),
                       ),
                     ),
                   ),
                 ),
               ],
             )
            ],
          ),
        ),
      ),
    );
  }
}
