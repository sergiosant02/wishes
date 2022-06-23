import 'dart:convert';

import 'package:wishes/src/constant/constantes.dart';
import 'package:http/http.dart' as http;

class EstadisticasApi {
  static Future<Map<String, int>> getGeneralEstadisticas() async {
    Map<String, int> map = {};
    try {
      final url = Uri.parse(Constantes.estadisticasGenerales);
      final resp = await http.get(url);
      final decode = json.decode(resp.body);
      Map mapAux = Map.from(decode);
      for (String i in Map.from(decode).keys) {
        map[i.split(", ")[1].split("=")[1].replaceAll(',', '')] = mapAux[i];
      }
    } catch (e) {
      print(e);
    }
    return map;
  }
}
