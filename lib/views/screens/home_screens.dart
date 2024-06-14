import 'package:flutter/material.dart';

import '../widgets/eslatma.dart';
import '../widgets/reja.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text('Bosh sahifa')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Rejalar()));
                },
                child: Text("Rejalar",  style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),)
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Eslatmalar()));
              },
              child: Text(
                'Eslatmalar',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
