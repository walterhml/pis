import 'package:flutter/material.dart';

class HistoricoServicosScreen extends StatelessWidget {
  final List<Map<String, String>> agendados = [
    {"titulo": "Táxi Dog Pet", "descricao": "descrição"},
    {"titulo": "Banho & Tosa", "descricao": "08/08/24\nR\$ 80,00"},
  ];

  final Map<String, String> emAndamento = {
    "titulo": "Táxi Dog",
    "descricao": "2 anos y medio",
    "imagem": "assets/dog.png", // Substitua pelo caminho real da imagem
  };

  final List<Map<String, String>> concluidos = [
    {"titulo": "Táxi Dog Pet", "descricao": "descrição"},
    {"titulo": "Banho & Tosa", "descricao": "08/08/24\nR\$ 80,00"},
    {"titulo": "Táxi Dog Pet", "descricao": "descrição"},
    {"titulo": "Banho & Tosa", "descricao": "08/08/24\nR\$ 80,00"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Histórico de serviços"),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Seção Agendados
              Text(
                "Agendados",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: agendados.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/dog.png"), // Substitua pela sua imagem
                    ),
                    title: Text(agendados[index]["titulo"]!),
                    subtitle: Text(agendados[index]["descricao"]!),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      // Ação ao clicar
                    },
                  );
                },
              ),
              SizedBox(height: 16),

              // Seção Em andamento
              Text(
                "Em andamento",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),
              Card(
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(emAndamento["imagem"]!), // Substitua pela sua imagem
                    radius: 30,
                  ),
                  title: Text(
                    emAndamento["titulo"]!,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    emAndamento["descricao"]!,
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Ação ao clicar
                  },
                ),
              ),
              SizedBox(height: 16),

              // Seção Concluídos
              Text(
                "Concluídos",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: concluidos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/dog.png"), // Substitua pela sua imagem
                    ),
                    title: Text(concluidos[index]["titulo"]!),
                    subtitle: Text(concluidos[index]["descricao"]!),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      // Ação ao clicar
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
