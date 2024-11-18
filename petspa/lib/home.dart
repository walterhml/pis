import 'package:flutter/material.dart';
import 'cadastroPet.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  void _openAddPetModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 40,
                color: Colors.orange,
              ),
              SizedBox(height: 16),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/gato.jpg'), // Imagem do pet
                ),
                title: Text('Billy'),
                subtitle: Text('Golden Retriever'),
                trailing: Radio(value: null, groupValue: null, onChanged: (value) {}),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/gato.jpg'), // Imagem do pet
                ),
                title: Text('Brandy'),
                subtitle: Text('Husky Siberiano'),
                trailing: Radio(value: null, groupValue: null, onChanged: (value) {}),
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PetRegistrationScreen()),
                          );
                },
                icon: Icon(Icons.add),
                label: Text("Adicionar novo Pet"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.orange,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Olá Luis, tudo bem?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: AssetImage('assets/gato.jpg'), // Substitua pelo diretório da foto do usuário
                      ),
                      SizedBox(width: 16),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => _openAddPetModal(context), // Abre o modal ao clicar
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.grey[200],
                              child: Icon(Icons.add, size: 24, color: Colors.grey),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text("Adicione"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "O que seu dog precisa?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      ServiceCard(
                        title: "Banho Terapêutico",
                        imagePath: '../assets/gato.jpg', // Substitua pelo diretório da imagem do pet
                      ),
                      ServiceCard(
                        title: "Corte de Unhas",
                        imagePath: '../assets/gato.jpg',
                      ),
                      ServiceCard(
                        title: "Limpeza de ouvido",
                        imagePath: '../assets/gato.jpg',
                      ),
                      ServiceCard(
                        title: "Tosas especializada",
                        imagePath: '../assets/gato.jpg',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        selectedItemColor: Colors.blue,
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const ServiceCard({
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imagePath,
              height: 80,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text("saiba mais", style: TextStyle(color: Colors.grey)),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Agendar"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
