import 'package:dijkstra/dijkstra.dart';
import 'dart:io';
import 'dart:convert';

class Graph {
  Map map = {};

  void loadFromJson(String filepath) {
    File file = File(filepath);
    map = jsonDecode(file.readAsStringSync());
  }

  route(String start, String end) {
    if (map[start] == null) {
      throw Exception('$start is an invalid starting node');
    }
    if (map[end] == null) {
      throw Exception('$end is an invalid destination node');
    }
    return Dijkstra.findPathFromGraph(map, start, end);
  }
}
