import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(const TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}

class TemperatureConverterScreen extends StatefulWidget {
  const TemperatureConverterScreen({super.key});

  @override
  State<TemperatureConverterScreen> createState() => _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState extends State<TemperatureConverterScreen> {
  final TextEditingController celciusController = TextEditingController();
  final TextEditingController reamurController = TextEditingController();
  final TextEditingController fahrenheitController = TextEditingController();
  final TextEditingController kelvinController = TextEditingController();

  void convertFromCelcius(String value) {
    if (value.isEmpty) return;
    double c = double.parse(value);
    setState(() {
      reamurController.text = (c * 4 / 5).toStringAsFixed(2);
      fahrenheitController.text = ((c * 9 / 5) + 32).toStringAsFixed(2);
      kelvinController.text = (c + 273.15).toStringAsFixed(2);
    });
  }

  void convertFromReamur(String value) {
    if (value.isEmpty) return;
    double r = double.parse(value);
    setState(() {
      celciusController.text = (r * 5 / 4).toStringAsFixed(2);
      fahrenheitController.text = ((r * 9 / 4) + 32).toStringAsFixed(2);
      kelvinController.text = ((r * 5 / 4) + 273.15).toStringAsFixed(2);
    });
  }

  void convertFromFahrenheit(String value) {
    if (value.isEmpty) return;
    double f = double.parse(value);
    setState(() {
      celciusController.text = ((f - 32) * 5 / 9).toStringAsFixed(2);
      reamurController.text = ((f - 32) * 4 / 9).toStringAsFixed(2);
      kelvinController.text = (((f - 32) * 5 / 9) + 273.15).toStringAsFixed(2);
    });
  }

  void convertFromKelvin(String value) {
    if (value.isEmpty) return;
    double k = double.parse(value);
    setState(() {
      celciusController.text = (k - 273.15).toStringAsFixed(2);
      reamurController.text = ((k - 273.15) * 4 / 5).toStringAsFixed(2);
      fahrenheitController.text = (((k - 273.15) * 9 / 5) + 32).toStringAsFixed(2);
    });
  }

  Widget buildTemperatureField(String label, TextEditingController controller, Function(String) onChanged) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Temperature Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildTemperatureField('Celcius', celciusController, convertFromCelcius),
            const SizedBox(height: 10),
            buildTemperatureField('Reamur', reamurController, convertFromReamur),
            const SizedBox(height: 10),
            buildTemperatureField('Fahrenheit', fahrenheitController, convertFromFahrenheit),
            const SizedBox(height: 10),
            buildTemperatureField('Kelvin', kelvinController, convertFromKelvin),
          ],
        ),
      ),
    );
  }
}