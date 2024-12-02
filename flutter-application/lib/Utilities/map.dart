import 'package:dijkstra/dijkstra.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Graph {
  
  Map map = {};

  Future<void> loadFromJson(String filepath, BuildContext context) async {
      map = jsonDecode(json);
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

  String json = '''
{
  "H1": {
      "H2": 0,
      "J-135": 1,
      "J-134": 1          
  },
  "H2": {
      "H1": 0,
      "H3": 0,
      "J-132": 1
  },
  "H3": {
      "H2": 0,
      "H4": 0,
      "J-133": 1
  },
  "H4": {
      "H3": 0,
      "H5": 0,
      "J-131": 1
  },
  "H5": {
      "H4": 0,
      "H6": 0,
      "J-130": 1
  },
  "H6": {
      "H5": 0,
      "H7": 0,
      "J-110": 1
  },
  "H7": {
      "H6": 0,
      "H8": 0,
      "J-120": 1
  },
  "H8": {
      "H7": 0,
      "H9": 0,
      "J-109": 1
  },
  "H9": {
      "H8": 0,
      "H10": 0,
      "J-108": 1
  },
  "H10": {
      "H9": 0,
      "H11": 0,
      "J-106": 1
  },
  "H11": {
      "H10": 0,
      "H12": 0,
      "J-107": 1
  },
  "H12": {
      "H11": 0,
      "H13": 0,
      "J-102": 1
  },
  "H13": {
      "H12": 0,
      "H14": 0,
      "J-105": 1
  },
  "H14": {
      "H13": 0,
      "H15": 0,
      "J-103": 1
  },
  "H15": {
      "H14": 0,
      "H16": 0,
      "H19": 0,
      "H40": 0,
      "H41": 1
  },
  "H16": {
      "H15": 0,
      "H17": 0,
      "H19": 0,
      "J-104": 1
  },
  "H17": {
      "H16": 0,
      "H18": 0,
      "H19": 0,
      "J-103": 1
  },
  "H18": {
      "H17": 0,
      "H19": 0,
      "J-101": 1
  },
  "H19": {
      "H15": 0,
      "H16": 0,
      "H17": 0,
      "H18": 0,
      "H19": 0,
      "H20": 0,
      "H21": 0,
      "H22": 0,
      "H23": 1
  },
  "H20": {
      "H19": 0,
      "H21": 0,
      "J-151": 1
  },
  "H21": {
      "H19": 0,
      "H20": 0,
      "H22": 0,
      "J-149": 1
  },
  "H22": {
      "H19": 0,
      "H21": 0,
      "H23": 0,
      "J-150": 1
  },
  "H23": {
      "H19": 0,
      "H22": 0,
      "H24": 0,
      "H39": 0,
      "H40": 0
  },
  "H24": {
      "H23": 0,
      "H25": 1
  },
  "H25": {
      "H24": 0,
      "H26": 0,
      "J-153": 1
  },
  "H26": {
      "H25": 0,
      "H27": 0,
      "J-155": 1
  },
  "H27": {
      "H26": 0,
      "H28": 0,
      "J-152": 1
  },
  "H28": {
      "H27": 0,
      "H29": 0,
      "J-157": 1
  },
  "H29": {
      "H28": 0,
      "H31": 0,
      "J-157": 1
  },
  "H30": {
      "H29": 0,
      "H31": 0,
      "J-156": 1
  },
  "H31": {
      "H30": 0,
      "H32": 0,
      "J-158": 1
  },
  "H32": {
      "H31": 0,
      "H33": 0,
      "J-161": 1
  },
  "H33": {
      "H32": 0,
      "H34": 0,
      "J-161": 1
  },
  "H34": {
      "H33": 0,
      "H35": 0,
      "J-161": 1
  },
  "H35": {
      "H34": 0,
      "H36": 0,
      "J-164": 1
  },
  "H36": {
      "H35": 0,
      "H37": 0,
      "J-161": 1
  },
  "H37": {
      "H36": 0,
      "H38": 0,
      "J-165": 1
  },
  "H38": {
      "H37": 0,
      "J-163": 1
  },
  "H39": {
      "H23": 0,
      "H40": 0,
      "J-152": 1
  },
  "H40": {
      "H15": 0,
      "H23": 0,
      "H39": 0,
      "H41": 1
  },
  "H41": {
      "H40": 0,
      "H15": 0,
      "Stacks": 1
  },    
  "J-101": {
      "H18": 0
  },
  "J-102": {
      "H12": 0
  },
  "J-103": {
      "H14": 0,
      "H17": 0
  },
  "J-104": {
      "H16": 0
  },
  "J-105": {
      "H13": 0
  },
  "J-106": {
      "H10": 0
  },
  "J-107": {
      "H11": 0
  },
  "J-108": {
      "H9": 0
  },
  "J-109": {
      "H8": 0
  },
  "J-110": {
      "H6": 0
  },
  "J-120": {
      "H7": 1
  },
  "J-135": {
      "H1": 0
  },
  "J-130": {
      "H5": 0
  },
  "J-131": {
      "H4": 0
  },
  "J-132": {
      "H2": 0
  },
  "J-133": {
      "H3": 0
  },
  "J-134": {
      "H1": 0
  },
  "J-149": {
      "H20": 0
  },
  "J-151": {
      "H21": 0
  },
  "J-152": {
      "H39": 0
  },
  "J-153": {
      "H25": 0
  },
  "J-155": {
      "H26": 0
  },
  "J-156": {
      "H30": 0
  },
  "J-157": {
      "H28": 0,
      "H29": 0
  },
  "J-158": {
      "H31": 0
  },
  "J-160": {
      "H22": 0,
      "H33": 0,
      "H36": 0
  },
  "J-161": {
      "H32": 0,
      "H34": 0
  },
  "J-163": {
      "H38": 0
  },
  "J-164": {
      "H23": 0,
      "H35": 0
  },
  "J-165": {
      "H37": 0
  },
  "Stacks": {
      "H41": 0
  }    
}

''';
}