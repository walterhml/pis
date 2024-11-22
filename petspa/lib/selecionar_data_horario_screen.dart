import 'package:flutter/material.dart';
// import 'selecionar_data_horario_screen.dart';

class SelecionarDataHorarioScreen extends StatefulWidget {
  @override
  _SelecionarDataHorarioScreenState createState() => _SelecionarDataHorarioScreenState();
}

class _SelecionarDataHorarioScreenState extends State<SelecionarDataHorarioScreen> {
  String? selectedDay;
  String? selectedTime;

  final List<String> days = ["Quarta 23/Out.", "Quinta 24/Out.", "Sexta 25/Out."];
  final List<String> times = [
    "09:00 - 10:00",
    "10:00 - 11:00",
    "10:00 - 11:00",
    "11:00 - 12:00",
    "12:00 - 13:00",
    "13:00 - 14:00",
    "13:00 - 14:00"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agendamento"),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Day Selection
            Text(
              "Escolha o dia:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: days.map((day) {
                return ChoiceChip(
                  label: Text(day),
                  selected: selectedDay == day,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedDay = selected ? day : null;
                    });
                  },
                  selectedColor: Colors.orange,
                  backgroundColor: Colors.grey[200],
                  labelStyle: TextStyle(
                    color: selectedDay == day ? Colors.white : Colors.black,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 24),

            // Time Selection
            Text(
              "Escolha o Horário:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: times.length,
                itemBuilder: (context, index) {
                  final time = times[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedTime = time;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedTime == time ? Colors.orange : Colors.white,
                        foregroundColor: selectedTime == time ? Colors.white : Colors.black,
                        side: BorderSide(color: Colors.orange, width: 1),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        time,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Advance Button
            Center(
              child: ElevatedButton(
                onPressed: selectedDay != null && selectedTime != null
                    ? () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => NextScreen()), // Replace NextScreen with your target screen
                        // );
                      }
                    : null,
                child: Text(
                  "Avançar",
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
                  disabledBackgroundColor: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}