import 'package:flutter/material.dart';
import 'package:miniproject/response.dart';

class DetailScreen extends StatefulWidget {
  final Article responseValue;
  const DetailScreen({required this.responseValue,super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
              children: [
                Image.network(widget.responseValue.image ?? ""),
                Text(widget.responseValue.id ?? ""),
                Text(widget.responseValue.desc ?? ""),
              ],
            ),
          ),
      ),
    );
  }
}