import 'package:flutter/material.dart';
import 'package:flutter_test_app/core/presentation/bottombar.dart';
import 'package:flutter_test_app/core/presentation/widgets/circle_back_button.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Container(

          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: CircleBackButton(
            onTap: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Column(
        children: [
          Text('DEATIL SCREEN'),
          FloatingActionButton(
              onPressed: () => {
                    setState(() {
                      counter++;
                    })
                  }),
          Center(
            child: TextButton(
              child: const Text('POP'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      bottomSheet: BottomBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
        ),
      ),
    );
  }
}
