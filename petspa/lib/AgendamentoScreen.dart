import 'package:flutter/material.dart';
import 'selecionar_data_horario_screen.dart';

class AgendamentoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banho Terapêutico"),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("../assets/gato.jpg"), // Altere o caminho da imagem
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Billy",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Golden Retriever",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),

            // Service Selection
            Text(
              "Selecione o serviço:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: [
                _buildChip("Banho Terapêutico"),
                _buildChip("Banho Terapêutico"),
                _buildChip("Banho Terapêutico"),
              ],
            ),
            SizedBox(height: 24),

            // Time Selection
            Text(
              "Escolha um horário:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: [
                _buildTimeChip("22 out\n09:00 - 10:00", true),
                _buildTimeChip("22 out\n09:00 - 10:00", false),
                _buildTimeChip("22 out\n09:00 - 10:00", false),
                _buildTimeChip("Todas as Datas", false),
              ],
            ),
            SizedBox(height: 24),

            // Taxi Dog Option
            Text(
              "Táxi Dog:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                _buildTaxiDogOption("Sim", true),
                SizedBox(width: 16),
                _buildTaxiDogOption("Não", false),
              ],
            ),
            SizedBox(height: 24),

            // Service Value
            Text(
              "Valor serviço:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "R\$ 80,00",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),

            // Observation Field
            Text(
              "Observação:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Escreva sua observação aqui...",
              ),
            ),
            SizedBox(height: 24),

            // Schedule Button
          Center(
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
       MaterialPageRoute(builder: (context) => SelecionarDataHorarioScreen()),
      );
    },
    child: Text(
      "Agendar",
      style: TextStyle(fontSize: 18),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.orange,
      padding: const EdgeInsets.symmetric(
        horizontal: 100,
        vertical: 16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
  ),
),
          ],
        ),
      ),
    );
  }

  // Helper Widgets
  Widget _buildChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.orange,
      labelStyle: TextStyle(color: Colors.white),
    );
  }

  Widget _buildTimeChip(String label, bool selected) {
    return ChoiceChip(
      label: Text(
        label,
        textAlign: TextAlign.center,
      ),
      selected: selected,
      onSelected: (bool value) {},
      selectedColor: Colors.orange,
      backgroundColor: Colors.grey[200],
      labelStyle: TextStyle(color: selected ? Colors.white : Colors.black),
    );
  }

  Widget _buildTaxiDogOption(String label, bool selected) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (bool value) {},
      selectedColor: Colors.orange,
      backgroundColor: Colors.grey[200],
      labelStyle: TextStyle(color: selected ? Colors.white : Colors.black),
    );
  }
}
