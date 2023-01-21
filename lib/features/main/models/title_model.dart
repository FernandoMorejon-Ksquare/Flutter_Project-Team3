import 'package:flutter/material.dart';

class TitleModel {
  titleModel(context, String? search) {
    search = search ?? "action";
    // return Text('Books on $search');
    return const Text("Books");
  }
}
