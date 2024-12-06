// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert'; 
// import 'Servico.dart'; // Importe a classe Servico que criamos
// import 'HistoricoServicosScreen.dart';
// import 'ProfileScreen.dart';
// import 'cadastroPet.dart';
// import 'AgendamentoScreen.dart';

// // Para rodar:
// // flutter run --web-browser-flag "--disable-web-security"

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Future<List<Servico>> _servicos;  // Variável para armazenar os serviços

//   @override
//   void initState() {
//     super.initState();
//     _servicos = fetchServicos();  // Carregar os serviços assim que a tela for inicializada
//   }

//   // Função para fazer a requisição HTTP e trazer os dados da API
//   Future<List<Servico>> fetchServicos() async {
//     final response = await http.get(Uri.parse('http://localhost/petSpa/servico/listAll.php'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body)['Servicos'];
//       return data.map((json) => Servico.fromJson(json)).toList();
//     } else {
//       throw Exception('Falha ao carregar os serviços');
//     }
//   }

//   void _openAddPetModal(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       ),
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 height: 4,
//                 width: 40,
//                 color: Colors.orange,
//               ),
//               SizedBox(height: 16),
//               ListTile(
//                 leading: CircleAvatar(
//                   backgroundImage: AssetImage('../assets/gato.jpg'),
//                 ),
//                 title: Text('Billy'),
//                 subtitle: Text('Golden Retriever'),
//                 trailing: Radio(value: null, groupValue: null, onChanged: (value) {}),
//               ),
//               ListTile(
//                 leading: CircleAvatar(
//                   backgroundImage: AssetImage('../assets/gato.jpg'),
//                 ),
//                 title: Text('Brandy'),
//                 subtitle: Text('Husky Siberiano'),
//                 trailing: Radio(value: null, groupValue: null, onChanged: (value) {}),
//               ),
//               SizedBox(height: 16),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => PetRegistrationScreen()),
//                   );
//                 },
//                 icon: Icon(Icons.add),
//                 label: Text("Adicionar novo Pet"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.orange,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Topo com fundo laranja e saudação
//             Container(
//   padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 36.0),  // Ajuste o padding lateral
//   color: Colors.orange,
//   width: double.infinity, // Isso faz o container ocupar toda a largura disponível
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         "O que seu dog precisa?",
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       SizedBox(height: 20),
//       // Aqui você pode adicionar o seu avatar ou outras informações
//     ],
//   ),
// ),

//             // Carregamento dos serviços
//             FutureBuilder<List<Servico>>(
//               future: _servicos,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator()); // Carregando
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Erro: ${snapshot.error}')); // Exibe erro
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return Center(child: Text('Nenhum serviço disponível')); // Caso não tenha dados
//                 } else {
//                   final servicos = snapshot.data!;  // Dados carregados com sucesso
//                   return Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: GridView.builder(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 16,
//                         mainAxisSpacing: 16,
//                       ),
//                       itemCount: servicos.length,
//                       itemBuilder: (context, index) {
//                         final servico = servicos[index];
//                         return ServiceCard(
//                           title: servico.tipoServico,
//                           imagePath: '../assets/gato.jpg',  // Ajuste de acordo com seu código de imagem
//                         );
//                       },
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.pets),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: '', // Ícone do perfil
//           ),
//         ],
//         selectedItemColor: Colors.blue,
//         onTap: (index) {
//           if (index == 1) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => HistoricoServicosScreen()),
//             );
//           } else if (index == 2) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ProfileScreen()),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class ServiceCard extends StatelessWidget {
//   final String title;
//   final String imagePath;

//   const ServiceCard({
//     required this.title,
//     required this.imagePath,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       elevation: 4,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//             child: Image.asset(
//               imagePath,
//               height: 80,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   "Saiba mais",
//                   style: TextStyle(color: Colors.grey),
//                 ),
//                 SizedBox(height: 8),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => AgendamentoScreen(),
//                       ),
//                     );
//                   },
//                   child: Text("Agendar"),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 
import 'Servico.dart'; // Importe a classe Servico que criamos
import 'HistoricoServicosScreen.dart';
import 'ProfileScreen.dart';
import 'cadastroPet.dart';
import 'AgendamentoScreen.dart';

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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Servico>> _servicos;  // Variável para armazenar os serviços

  @override
  void initState() {
    super.initState();
    _servicos = fetchServicos();  // Carregar os serviços assim que a tela for inicializada
  }

  // Função para fazer a requisição HTTP e trazer os dados da API
  Future<List<Servico>> fetchServicos() async {
    final response = await http.get(Uri.parse('http://localhost/petSpa/servico/listAll.php'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['Servicos'];
      return data.map((json) => Servico.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar os serviços');
    }
  }

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
                  backgroundImage: AssetImage('../assets/gato.jpg'),
                ),
                title: Text('Billy'),
                subtitle: Text('Golden Retriever'),
                trailing: Radio(value: null, groupValue: null, onChanged: (value) {}),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('../assets/gato.jpg'),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Topo com fundo laranja, saudação e botão
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 36.0),  // Ajuste o padding lateral
              color: Colors.orange,
              width: double.infinity, // Isso faz o container ocupar toda a largura disponível
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Texto de boas-vindas
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bem-vindo, João!",  // Nome fictício do usuário
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward, color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PetRegistrationScreen()),  // Navegar para outra tela (ProfileScreen)
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Texto "O que seu dog precisa?"
                  Text(
                    "O que seu dog precisa?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),

            // Carregamento dos serviços
            FutureBuilder<List<Servico>>(
              future: _servicos,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator()); // Carregando
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erro: ${snapshot.error}')); // Exibe erro
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Nenhum serviço disponível')); // Caso não tenha dados
                } else {
                  final servicos = snapshot.data!;  // Dados carregados com sucesso
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: servicos.length,
                      itemBuilder: (context, index) {
                        final servico = servicos[index];
                        return ServiceCard(
                          title: servico.tipoServico,
                          imagePath: '../assets/gato.jpg',  // Ajuste de acordo com seu código de imagem
                        );
                      },
                    ),
                  );
                }
              },
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
            label: '', // Ícone do perfil
          ),
        ],
        selectedItemColor: Colors.blue,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HistoricoServicosScreen()),
            );
          } else if (index == 2) {
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
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Saiba mais",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AgendamentoScreen(),
                      ),
                    );
                  },
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
