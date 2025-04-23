import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'temperature_provider.dart';

class TemperatureConverterScreen extends StatelessWidget {
  const TemperatureConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tempProvider = Provider.of<TemperatureProvider>(context);
    final celciusController = TextEditingController(text: tempProvider.celcius.toStringAsFixed(2));
    final reamurController = TextEditingController(text: tempProvider.reamur.toStringAsFixed(2));
    final fahrenheitController = TextEditingController(text: tempProvider.fahrenheit.toStringAsFixed(2));
    final kelvinController = TextEditingController(text: tempProvider.kelvin.toStringAsFixed(2));

    Widget buildField(String label, TextEditingController controller, Function(String) onChanged) {
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

    return Scaffold(
      appBar: AppBar(title: const Text('Temperature Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildField('Celcius', celciusController, (val) {
              if (val.isNotEmpty) tempProvider.fromCelcius(double.tryParse(val) ?? 0);
            }),
            const SizedBox(height: 10),
            buildField('Reamur', reamurController, (val) {
              if (val.isNotEmpty) tempProvider.fromReamur(double.tryParse(val) ?? 0);
            }),
            const SizedBox(height: 10),
            buildField('Fahrenheit', fahrenheitController, (val) {
              if (val.isNotEmpty) tempProvider.fromFahrenheit(double.tryParse(val) ?? 0);
            }),
            const SizedBox(height: 10),
            buildField('Kelvin', kelvinController, (val) {
              if (val.isNotEmpty) tempProvider.fromKelvin(double.tryParse(val) ?? 0);
            }),
          ],
        ),
      ),
    );
  }
}
