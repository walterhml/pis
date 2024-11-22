// import 'package:flutter/material.dart';
// import 'login.dart'; // Importe o arquivo login.dart
// import 'home.dart'; // Importe o arquivo home.dart

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CadastroScreen(),
//     );
//   }
// }

// class CadastroScreen extends StatefulWidget {
//   @override
//   _CadastroScreenState createState() => _CadastroScreenState();
// }

// class _CadastroScreenState extends State<CadastroScreen> {
//   final _formKey = GlobalKey<FormState>();

//   String nomeCompleto = '';
//   String email = '';
//   String telefone = '';
//   String senha = '';
//   String confirmaSenha = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Cadastro',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 24),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Nome completo',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(16),
//                         borderSide: BorderSide(color: Colors.orange),
//                       ),
//                     ),
//                     onChanged: (value) {
//                       setState(() {
//                         nomeCompleto = value;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 16),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(16),
//                         borderSide: BorderSide(color: Colors.orange),
//                       ),
//                     ),
//                     onChanged: (value) {
//                       setState(() {
//                         email = value;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 16),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Telefone',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(16),
//                         borderSide: BorderSide(color: Colors.orange),
//                       ),
//                     ),
//                     onChanged: (value) {
//                       setState(() {
//                         telefone = value;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 16),
//                   TextFormField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: 'Senha',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(16),
//                         borderSide: BorderSide(color: Colors.orange),
//                       ),
//                     ),
//                     onChanged: (value) {
//                       setState(() {
//                         senha = value;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 16),
//                   TextFormField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: 'Confirma senha',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(16),
//                         borderSide: BorderSide(color: Colors.orange),
//                       ),
//                     ),
//                     onChanged: (value) {
//                       setState(() {
//                         confirmaSenha = value;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 24),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.orange,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//                     ),
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // Simulando o salvamento dos dados
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                               content: Text('Cadastro salvo com sucesso!')),
//                         );
//                       }
//                     },
//                     child: Text('Salvar'),
//                   ),
//                   SizedBox(height: 16),
//                   TextButton(
//                     onPressed: () {
//                       // Navegação para a tela de login
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => LoginScreen()),
//                       );
//                     },
//                     child: Text('Login'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'login.dart'; // Importe o arquivo login.dart

void main() {
  runApp(MyApp());
}

// Banco de dados local (Array para armazenar os usuários)
List<Map<String, String>> usersDatabase = [];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CadastroScreen(),
    );
  }
}

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();

  String nomeCompleto = '';
  String email = '';
  String telefone = '';
  String senha = '';
  String confirmaSenha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cadastro',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome completo',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe o nome completo';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        nomeCompleto = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe o email';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Email inválido';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        telefone = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe a senha';
                      } else if (value.length < 6) {
                        return 'A senha deve ter pelo menos 6 caracteres';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        senha = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirma senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirme a senha';
                      } else if (value != senha) {
                        return 'As senhas não conferem';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        confirmaSenha = value;
                      });
                    },
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Adiciona o novo usuário no banco de dados local
                        usersDatabase.add({
                          'nomeCompleto': nomeCompleto,
                          'email': email,
                          'telefone': telefone,
                          'senha': senha,
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Cadastro salvo com sucesso!')),
                        );
                        // Limpa os campos do formulário
                        _formKey.currentState!.reset();
                      }
                    },
                    child: Text('Salvar'),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      // Navegação para a tela de login
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
