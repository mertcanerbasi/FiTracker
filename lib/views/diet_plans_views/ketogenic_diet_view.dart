import 'package:flutter/material.dart';

class KetogenicDietView extends StatelessWidget {
  const KetogenicDietView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Center(
        child: Text('Ketogenic Diet'),
      ),
    );
  }
}
