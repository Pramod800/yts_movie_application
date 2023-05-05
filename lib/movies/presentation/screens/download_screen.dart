import 'package:flutter/material.dart';

class DownLoadScreen extends StatefulWidget {
  const DownLoadScreen({super.key});

  @override
  State<DownLoadScreen> createState() => _DownLoadScreenState();
}

class _DownLoadScreenState extends State<DownLoadScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('download'),
        ),
      ),
    );
  }
}
