import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MeuWidged extends StatefulWidget {
  const MeuWidged({super.key});

  @override
  State<MeuWidged> createState() => _MeuWidgedState();
}

class _MeuWidgedState extends State<MeuWidged> {
  String respostaFinal = '';
  final dio = Dio();
  Map<String, dynamic>? endereco;


  Future<Map<String, dynamic>> getHttp() async {
    final response = await dio.get('https://viacep.com.br/ws/76873122/json/');
    return response.data;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teste"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Consumo de APIS usando DIO'),
            ElevatedButton(onPressed: () async {
              Map<String, dynamic> enderecoAuxiliar = await getHttp();
              setState(() {
                endereco = enderecoAuxiliar;
              });
            }, child: Text('Consultar')),
            SizedBox(height: 20),
            Text("${endereco?['logradouro'] ?? ''}"),
            Text("${endereco?['bairro'] ?? ''}"),
            Text("${endereco?['estado'] ?? ''}"),
          ],
        ),
      )
          );
  }
}
