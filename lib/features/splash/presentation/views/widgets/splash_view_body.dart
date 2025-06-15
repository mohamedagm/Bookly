import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100),
        Center(child: Text('SplashViewBody')),
        Expanded(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            child: Text('BODY'),
            height: 50,
            color: Colors.amber,
          ),
        ),
      ],
    );
  }
}
