// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: Home(), debugShowCheckedModeBanner: false));
// }

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   TextEditingController valor = TextEditingController();
//   TextEditingController autonomia = TextEditingController();
//   TextEditingController distancia = TextEditingController();
//   double _resultado = 0.0;
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   void _calcular() {
//     setState(() {
//       double v = double.parse(valor.text.replaceAll(",", "."));
//       double a = double.parse(autonomia.text.replaceAll(",", "."));
//       double d = double.parse(distancia.text.replaceAll(",", "."));
//       _resultado = (d / a) * v;
//     });
//   }

//   void _reset() {
//     valor.text = "";
//     autonomia.text = "";
//     distancia.text = "";
//     setState(() {
//       _resultado = 0.0;
//       _formKey = GlobalKey<FormState>();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Calculo de Combustível",
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.lightBlue[900],
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.refresh, color: Colors.white),
//             onPressed: _reset,
//             splashColor: Colors.blueAccent,
//             highlightColor: Colors.lightBlue,
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Container(
//                 margin: EdgeInsets.only(bottom: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Icon(
//                       Icons.attach_money,
//                       size: 50.0,
//                       color: Colors.lightBlue[900],
//                     ),
//                     Text(
//                       _resultado.toStringAsFixed(2),

//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.lightBlue[900],
//                         fontSize: 26.0,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   TextFormField(
//                     validator:
//                         (value) =>
//                             (value == null || value.isEmpty)
//                                 ? "Informe o Valor do Combustivel"
//                                 : null,
//                     controller: valor,
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: InputDecoration(
//                       labelText: "Valor do Combustivel",
//                       labelStyle: TextStyle(color: Colors.lightBlue[900]),
//                     ),
//                     style: TextStyle(
//                       color: Colors.lightBlue[900],
//                       fontSize: 26.0,
//                     ),
//                   ),
//                   TextFormField(
//                     validator:
//                         (value) =>
//                             (value == null || value.isEmpty)
//                                 ? "Informe a autonomia do Veículo"
//                                 : null,
//                     controller: autonomia,
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: InputDecoration(
//                       labelText: "Autonomia do Veículo",
//                       labelStyle: TextStyle(color: Colors.lightBlue[900]),
//                     ),
//                     style: TextStyle(
//                       color: Colors.lightBlue[900],
//                       fontSize: 26.0,
//                     ),
//                   ),
//                   TextFormField(
//                     validator:
//                         (value) =>
//                             (value == null || value.isEmpty)
//                                 ? "Informe a distancia percorrida"
//                                 : null,
//                     controller: distancia,
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: InputDecoration(
//                       labelText: "Distancia percorrida",
//                       labelStyle: TextStyle(color: Colors.lightBlue[900]),
//                     ),
//                     style: TextStyle(
//                       color: Colors.lightBlue[900],
//                       fontSize: 26.0,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
//                     child: SizedBox(
//                       height: 50.0,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.lightBlue[900],
//                         ),
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             _calcular();
//                           }
//                         },
//                         child: Text(
//                           "Verificar",
//                           style: TextStyle(color: Colors.white, fontSize: 25.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
      double v = double.parse(valor.text.replaceAll(",", "."));
      double a = double.parse(autonomia.text.replaceAll(",", "."));
      double d = double.parse(distancia.text.replaceAll(",", "."));
      _resultado = (d / a) * v;
    });
  }

  void _reset() {
    valor.clear();
    autonomia.clear();
    distancia.clear();
    setState(() {
      _resultado = 0.0;
      _formKey = GlobalKey<FormState>();
    });
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.lightBlue[900]),
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Cálculo de Combustível", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _reset,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 48.0),
                  child: Column(
                    children: [
                      Icon(Icons.local_gas_station, size: 60, color: Colors.lightBlue[900]),
                      SizedBox(height: 10),
                      Text(
                        "Custo Estimado",
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "R\$ ${_resultado.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.lightBlue[900]),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                validator: (value) => (value == null || value.isEmpty) ? "Informe o valor do combustível" : null,
                controller: valor,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration("Valor do Combustível (R\$)"),
              ),
              SizedBox(height: 16),
              TextFormField(
                validator: (value) => (value == null || value.isEmpty) ? "Informe a autonomia do veículo" : null,
                controller: autonomia,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration("Autonomia do Veículo (Km/L)"),
              ),
              SizedBox(height: 16),
              TextFormField(
                validator: (value) => (value == null || value.isEmpty) ? "Informe a distância percorrida" : null,
                controller: distancia,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration("Distância Percorrida (Km)"),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _calcular();
                    }
                  },
                  icon: Icon(Icons.calculate, color: Colors.white,),
                  label: Text("Calcular", style: TextStyle(fontSize: 20, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue[900],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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

