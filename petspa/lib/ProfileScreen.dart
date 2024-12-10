// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Perfil'),
//         backgroundColor: Colors.orange,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: AssetImage('assets/gato.jpg'), // Substitua pelo caminho da foto do usuário
//             ),
//             SizedBox(height: 16),
//             Text(
//               "Luis",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               "luis@example.com",
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: () {
//                 // Adicione funcionalidades, como edição de perfil
//               },
//               child: Text("Editar Perfil"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.orange,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:petspa/HistoricoServicosScreen.dart';
import 'package:petspa/home.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Perfil",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: AssetImage('../assets/gato.jpg'),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Olá Walter;)",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              SectionTitle(title: "Seus dados"),
              ListTile(
                leading: Icon(Icons.person_outline, color: Colors.black),
                title: Text("Dados Pessoais"),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  // Navegação para a tela de edição de perfil
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfileScreen()),
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.credit_card_outlined, color: Colors.black),
                title: Text("Pagamentos"),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  // Função de pagamentos
                },
              ),
              Divider(),
              SectionTitle(title: "Seu Dog"),
              ListTile(
                leading: Icon(Icons.pets_outlined, color: Colors.black),
                title: Text("Dados do Pet"),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  // Navegação para dados do pet
                },
              ),
              Divider(),
              SectionTitle(title: "Siga-nos"),
              ListTile(
                leading: Icon(Icons.pets_outlined, color: Colors.black),
                title: Text("Instagram"),
                onTap: () {
                  // Função para abrir link do Instagram
                },
              ),
              ListTile(
                leading: Icon(Icons.facebook, color: Colors.black),
                title: Text("Facebook"),
                onTap: () {
                  // Função para abrir link do Facebook
                },
              ),
              ListTile(
                leading: Icon(Icons.phone, color: Colors.black),
                title: Text("(11) 97828-5433"),
                onTap: () {
                  // Função para ligar ou enviar mensagem
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.black),
                title: Text("Sair"),
                onTap: () {
                  // Função de logout
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        selectedItemColor: Colors.blue,
        onTap: (index) {
          if (index == 0) {
            // Navega para a Home (Página Inicial)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (index == 1) {
            // Navega para a página de Histórico de Serviços ao clicar no ícone Pets
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HistoricoServicosScreen()),
            );
          } else if (index == 2) {
            // Navega para a página de Perfil
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Editar Perfil",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Editar informações do perfil",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: "Nome",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: "E-mail",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Salvar alterações
              },
              child: Text("Salvar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
