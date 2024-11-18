import 'package:flutter/material.dart';

class PetRegistrationScreen extends StatefulWidget {
  @override
  _PetRegistrationScreenState createState() => _PetRegistrationScreenState();
}

class _PetRegistrationScreenState extends State<PetRegistrationScreen> {
  String? selectedAnimal;
  String? selectedBreed;
  String? selectedGender;
  bool isCastrated = false;

  List<String> dogBreeds = ["Golden Retriever", "Husky Siberiano", "Labrador", "Poodle", "Bulldog"];
  List<String> catBreeds = ["Persa", "Siamês", "Maine Coon", "Sphynx", "Bengal"];
  List<String> genderOptions = ["Macho", "Fêmea"];

  List<String> get currentBreeds {
    return selectedAnimal == "Cachorro" ? dogBreeds : catBreeds;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Nome",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedAnimal,
              items: ["Cachorro", "Gato"].map((String animal) {
                return DropdownMenuItem<String>(
                  value: animal,
                  child: Text(animal),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedAnimal = value;
                  selectedBreed = null; // Reseta a raça quando o tipo muda
                });
              },
              decoration: InputDecoration(
                labelText: "Tipo de Animal",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedBreed,
              items: currentBreeds.map((String breed) {
                return DropdownMenuItem<String>(
                  value: breed,
                  child: Text(breed),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedBreed = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Raça",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedGender,
              items: genderOptions.map((String gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Sexo",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: "Nascimento",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Castrado(a)", style: TextStyle(fontSize: 16)),
                Switch(
                  value: isCastrated,
                  onChanged: (value) {
                    setState(() {
                      isCastrated = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(
              children: [
                ListTile(
                  title: Text("Não sei a idade, mas tem menos de um ano."),
                  leading: Radio(
                    value: "menos de um ano",
                    groupValue: null, // Adicione o valor correspondente ao estado
                    onChanged: (value) {
                      // Atualize o estado aqui, se necessário
                    },
                  ),
                ),
                ListTile(
                  title: Text("Não sei a idade, mas tem mais de um ano."),
                  leading: Radio(
                    value: "mais de um ano",
                    groupValue: null, // Adicione o valor correspondente ao estado
                    onChanged: (value) {
                      // Atualize o estado aqui, se necessário
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Ação ao salvar o cadastro
                },
                child: Text("Salvar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
