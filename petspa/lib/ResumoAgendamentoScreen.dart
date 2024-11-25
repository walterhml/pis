import 'package:flutter/material.dart';

import 'HistoricoServicosScreen.dart';

class ResumoAgendamentoScreen extends StatelessWidget {
  final String petName;
  final String service;
  final double price;
  final String schedule;
  final String location;

  ResumoAgendamentoScreen({
    required this.petName,
    required this.service,
    required this.price,
    required this.schedule,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resumo do agendamento"),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Pet", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(petName),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(service, style: TextStyle(fontWeight: FontWeight.bold)),
                Text("R\$ ${price.toStringAsFixed(2)}"),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Horário", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(schedule),
              ],
            ),
            SizedBox(height: 16),
            Text("Pet Spa", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(location),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("R\$ ${price.toStringAsFixed(2)}"),
              ],
            ),
            SizedBox(height: 16),
           ElevatedButton(
  onPressed: () {
    // Navega para a página de Histórico de Serviços
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HistoricoServicosScreen()),
    );
  },
  child: Text("FINALIZAR"),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.orange,
    padding: const EdgeInsets.symmetric(vertical: 16),
  ),
),

          ],
        ),
      ),
    );
  }
}
