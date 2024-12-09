// import 'package:flutter/material.dart';

// class PetRegistrationScreen extends StatefulWidget {
//   @override
//   _PetRegistrationScreenState createState() => _PetRegistrationScreenState();
// }

// class _PetRegistrationScreenState extends State<PetRegistrationScreen> {
//   String? selectedAnimal;
//   String? selectedBreed;
//   String? selectedGender;
//   bool isCastrated = false;

//   List<String> dogBreeds = ["Golden Retriever", "Husky Siberiano", "Labrador", "Poodle", "Bulldog"];
//   List<String> catBreeds = ["Persa", "Siamês", "Maine Coon", "Sphynx", "Bengal"];
//   List<String> genderOptions = ["Macho", "Fêmea"];

//   List<String> get currentBreeds {
//     return selectedAnimal == "Cachorro" ? dogBreeds : catBreeds;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cadastro"),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 labelText: "Nome",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16),
//                   borderSide: BorderSide(color: Colors.orange),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             DropdownButtonFormField<String>(
//               value: selectedAnimal,
//               items: ["Cachorro", "Gato"].map((String animal) {
//                 return DropdownMenuItem<String>(
//                   value: animal,
//                   child: Text(animal),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedAnimal = value;
//                   selectedBreed = null; // Reseta a raça quando o tipo muda
//                 });
//               },
//               decoration: InputDecoration(
//                 labelText: "Tipo de Animal",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16),
//                   borderSide: BorderSide(color: Colors.orange),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             DropdownButtonFormField<String>(
//               value: selectedBreed,
//               items: currentBreeds.map((String breed) {
//                 return DropdownMenuItem<String>(
//                   value: breed,
//                   child: Text(breed),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedBreed = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 labelText: "Raça",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16),
//                   borderSide: BorderSide(color: Colors.orange),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             DropdownButtonFormField<String>(
//               value: selectedGender,
//               items: genderOptions.map((String gender) {
//                 return DropdownMenuItem<String>(
//                   value: gender,
//                   child: Text(gender),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedGender = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 labelText: "Sexo",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16),
//                   borderSide: BorderSide(color: Colors.orange),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: "Nascimento",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16),
//                   borderSide: BorderSide(color: Colors.orange),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Castrado(a)", style: TextStyle(fontSize: 16)),
//                 Switch(
//                   value: isCastrated,
//                   onChanged: (value) {
//                     setState(() {
//                       isCastrated = value;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Column(
//               children: [
//                 ListTile(
//                   title: Text("Não sei a idade, mas tem menos de um ano."),
//                   leading: Radio(
//                     value: "menos de um ano",
//                     groupValue: null, // Adicione o valor correspondente ao estado
//                     onChanged: (value) {
//                       // Atualize o estado aqui, se necessário
//                     },
//                   ),
//                 ),
//                 ListTile(
//                   title: Text("Não sei a idade, mas tem mais de um ano."),
//                   leading: Radio(
//                     value: "mais de um ano",
//                     groupValue: null, // Adicione o valor correspondente ao estado
//                     onChanged: (value) {
//                       // Atualize o estado aqui, se necessário
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Ação ao salvar o cadastro
//                 },
//                 child: Text("Salvar"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.orange,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';

// class PetRegistrationScreen extends StatefulWidget {
//   final List<Map<String, dynamic>> pets; // Lista para armazenar os pets

//   PetRegistrationScreen({Key? key, required this.pets}) : super(key: key);

//   @override
//   _PetRegistrationScreenState createState() => _PetRegistrationScreenState();
// }

// class _PetRegistrationScreenState extends State<PetRegistrationScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _birthController = TextEditingController();

//   String? selectedAnimal;
//   String? selectedBreed;
//   String? selectedGender;
//   bool isCastrated = false;
//   String? ageOption;

//   List<String> animalTypes = ["Cachorro", "Gato"];
//   Map<String, List<String>> breeds = {
//     "Cachorro": ["Golden Retriever", "Husky Siberiano", "Labrador", "Poodle", "Bulldog"],
//     "Gato": ["Persa", "Siamês", "Maine Coon", "Sphynx", "Bengal"],
//   };
//   List<String> genderOptions = ["Macho", "Fêmea"];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cadastro de Pet"),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: "Nome",
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) return "Informe o nome do pet.";
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16),
//               DropdownButtonFormField<String>(
//                 value: selectedAnimal,
//                 items: animalTypes.map((String animal) {
//                   return DropdownMenuItem<String>(
//                     value: animal,
//                     child: Text(animal),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedAnimal = value;
//                     selectedBreed = null; // Reseta a raça quando o tipo muda
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: "Tipo de Animal",
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
//                 ),
//               ),
//               SizedBox(height: 16),
//               DropdownButtonFormField<String>(
//                 value: selectedBreed,
//                 items: (breeds[selectedAnimal] ?? []).map((String breed) {
//                   return DropdownMenuItem<String>(
//                     value: breed,
//                     child: Text(breed),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedBreed = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: "Raça",
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
//                 ),
//               ),
//               SizedBox(height: 16),
//               DropdownButtonFormField<String>(
//                 value: selectedGender,
//                 items: genderOptions.map((String gender) {
//                   return DropdownMenuItem<String>(
//                     value: gender,
//                     child: Text(gender),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedGender = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: "Sexo",
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
//                 ),
//               ),
//               SizedBox(height: 16),
//               TextFormField(
//                 controller: _birthController,
//                 decoration: InputDecoration(
//                   labelText: "Nascimento",
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) return "Informe a data de nascimento.";
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Castrado(a)", style: TextStyle(fontSize: 16)),
//                   Switch(
//                     value: isCastrated,
//                     onChanged: (value) {
//                       setState(() {
//                         isCastrated = value;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               Column(
//                 children: [
//                   ListTile(
//                     title: Text("Não sei a idade, mas tem menos de um ano."),
//                     leading: Radio<String>(
//                       value: "menos de um ano",
//                       groupValue: ageOption,
//                       onChanged: (value) {
//                         setState(() {
//                           ageOption = value;
//                         });
//                       },
//                     ),
//                   ),
//                   ListTile(
//                     title: Text("Não sei a idade, mas tem mais de um ano."),
//                     leading: Radio<String>(
//                       value: "mais de um ano",
//                       groupValue: ageOption,
//                       onChanged: (value) {
//                         setState(() {
//                           ageOption = value;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       widget.pets.add({
//                         "nome": _nameController.text,
//                         "tipo": selectedAnimal,
//                         "raca": selectedBreed,
//                         "sexo": selectedGender,
//                         "nascimento": _birthController.text,
//                         "castrado": isCastrated,
//                         "idade": ageOption,
//                       });
//                       Navigator.pop(context);
//                     }
//                   },
//                   child: Text("Salvar"),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class PetRegistrationScreen extends StatefulWidget {
//   @override
//   _PetRegistrationScreenState createState() => _PetRegistrationScreenState();
// }

// class _PetRegistrationScreenState extends State<PetRegistrationScreen> {
//   final _formKey = GlobalKey<FormState>();
//   String _petName = '';
//   String _petBreed = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.orange,
//         title: Text('Cadastro de Pet'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Nome do Pet:',
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: 'Digite o nome do pet',
//                   ),
//                   onSaved: (value) => _petName = value!,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor, insira o nome do pet';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   'Raça do Pet:',
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: 'Digite a raça do pet',
//                   ),
//                   onSaved: (value) => _petBreed = value!,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor, insira a raça do pet';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState?.validate() ?? false) {
//                       _formKey.currentState?.save();
//                       // Aqui você pode adicionar o código para salvar os dados do pet.
//                       // Por enquanto, vamos apenas mostrar um alert.
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: Text('Pet Cadastrado'),
//                           content: Text('Nome: $_petName\nRaça: $_petBreed'),
//                           actions: <Widget>[
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text('OK'),
//                             ),
//                           ],
//                         ),
//                       );
//                     }
//                   },
//                   child: Text('Cadastrar Pet'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class PetRegistrationScreen extends StatefulWidget {
//   @override
//   _PetRegistrationScreenState createState() => _PetRegistrationScreenState();
// }

// class _PetRegistrationScreenState extends State<PetRegistrationScreen> {
//   final _formKey = GlobalKey<FormState>();
//   String _petName = '';
//   String _petBreed = '';
//   List<Map<String, String>> _pets = []; // Lista para armazenar os pets cadastrados

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.orange,
//         title: Text('Cadastro de Pet'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Formulário de cadastro
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Nome do Pet:',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: 'Digite o nome do pet',
//                       ),
//                       onSaved: (value) => _petName = value!,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Por favor, insira o nome do pet';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       'Raça do Pet:',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: 'Digite a raça do pet',
//                       ),
//                       onSaved: (value) => _petBreed = value!,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Por favor, insira a raça do pet';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 16),
//                     ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState?.validate() ?? false) {
//                           _formKey.currentState?.save();
                          
//                           // Adiciona o pet à lista
//                           setState(() {
//                             _pets.add({
//                               'name': _petName,
//                               'breed': _petBreed,
//                             });
//                           });

//                           // Limpa os campos após salvar
//                           _formKey.currentState?.reset();
//                         }
//                       },
//                       child: Text('Cadastrar Pet'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.orange,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // Exibe a lista de pets cadastrados
//               SizedBox(height: 20),
//               Text(
//                 'Pets Cadastrados:',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: _pets.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     leading: CircleAvatar(
//                       child: Icon(Icons.pets),
//                     ),
//                     title: Text(_pets[index]['name']!),
//                     subtitle: Text(_pets[index]['breed']!),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class PetRegistrationScreen extends StatefulWidget {
  @override
  _PetRegistrationScreenState createState() => _PetRegistrationScreenState();
}

class _PetRegistrationScreenState extends State<PetRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _petName = '';
  String _petBreed = '';
  String _petSpecies = '';
  bool _isNeutered = false;
  String _petSex = 'Macho';
  DateTime? _birthDate;
  List<Map<String, dynamic>> _pets = []; // Lista para armazenar os pets cadastrados

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Cadastro de Pet'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Formulário de cadastro
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nome do Pet:',
                      style: TextStyle(fontSize: 18),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Digite o nome do pet',
                      ),
                      onSaved: (value) => _petName = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o nome do pet';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Raça do Pet:',
                      style: TextStyle(fontSize: 18),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Digite a raça do pet',
                      ),
                      onSaved: (value) => _petBreed = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira a raça do pet';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Espécie do Pet:',
                      style: TextStyle(fontSize: 18),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Digite a espécie do pet',
                      ),
                      onSaved: (value) => _petSpecies = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira a espécie do pet';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    // Campo de castrado
                    Row(
                      children: [
                        Text(
                          'Castrado:',
                          style: TextStyle(fontSize: 18),
                        ),
                        Switch(
                          value: _isNeutered,
                          onChanged: (value) {
                            setState(() {
                              _isNeutered = value;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Campo de sexo
                    Text(
                      'Sexo do Pet:',
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Macho',
                          groupValue: _petSex,
                          onChanged: (value) {
                            setState(() {
                              _petSex = value!;
                            });
                          },
                        ),
                        Text('Macho'),
                        Radio<String>(
                          value: 'Fêmea',
                          groupValue: _petSex,
                          onChanged: (value) {
                            setState(() {
                              _petSex = value!;
                            });
                          },
                        ),
                        Text('Fêmea'),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Campo de nascimento
                    Text(
                      'Data de Nascimento do Pet:',
                      style: TextStyle(fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null && picked != _birthDate)
                          setState(() {
                            _birthDate = picked;
                          });
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: TextEditingController(
                            text: _birthDate != null
                                ? '${_birthDate!.day}/${_birthDate!.month}/${_birthDate!.year}'
                                : '',
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Escolha a data de nascimento',
                          ),
                          onSaved: (value) {
                            // Não precisamos salvar a data diretamente aqui
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();

                          // Adiciona o pet à lista
                          setState(() {
                            _pets.add({
                              'name': _petName,
                              'breed': _petBreed,
                              'species': _petSpecies,
                              'neutered': _isNeutered ? 'Sim' : 'Não',
                              'sex': _petSex,
                              'birthDate': _birthDate != null
                                  ? '${_birthDate!.day}/${_birthDate!.month}/${_birthDate!.year}'
                                  : '',
                            });
                          });

                          // Limpa os campos após salvar
                          _formKey.currentState?.reset();
                          setState(() {
                            _isNeutered = false;
                            _petSex = 'Macho';
                            _birthDate = null;
                          });
                        }
                      },
                      child: Text('Cadastrar Pet'),
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

              // Exibe a lista de pets cadastrados
              SizedBox(height: 20),
              Text(
                'Pets Cadastrados:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _pets.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.pets),
                    ),
                    title: Text(_pets[index]['name']!),
                    subtitle: Text(
                      'Raça: ${_pets[index]['breed']} - Espécie: ${_pets[index]['species']} - Sexo: ${_pets[index]['sex']} - Castrado: ${_pets[index]['neutered']} - Nascimento: ${_pets[index]['birthDate']}',
                    ),
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

