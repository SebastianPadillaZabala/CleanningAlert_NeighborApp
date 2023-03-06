import 'package:flutter/material.dart';

class AlertTabPage extends StatefulWidget {
  AlertTabPage({Key? key}) : super(key: key);

  @override
  State<AlertTabPage> createState() => _AlertTabPageState();
}

class _AlertTabPageState extends State<AlertTabPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Alerts Page'),
    );
  }
}
