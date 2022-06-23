import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';
import 'package:wishes/src/api/estadisticasApi.dart';

class EstadisticasPage extends StatelessWidget {
  const EstadisticasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estadisticas generales')),
      body: FutureBuilder(
          future: EstadisticasApi.getGeneralEstadisticas(),
          builder: (context, AsyncSnapshot<Map<String, int>> data) {
            Map<String, int> map = data.data ?? {};
            if (map.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<String> key = map.entries.map((e) => e.key).toList();
              List<double> valores = [];
              for (String k in key) {
                valores.add(((map[k]! * 1.0) * 100).round() / 100);
              }
              double sum =
                  valores.reduce(((value, element) => value + element));
              valores = valores
                  .map((v) => ((v * 100 / sum) * 100).round() / 100)
                  .toList();
              return PieChart(
                values: valores,
                labels: key,
                size: Size(
                  MediaQuery.of(context).size.height * 0.8,
                  MediaQuery.of(context).size.height * 0.5,
                ),
              );
            }
          }),
    );
  }
}
