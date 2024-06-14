import 'package:flutter/material.dart';

import '../../models/settins.dart';

class Eslatmalar extends StatefulWidget {
  @override
  _EslatmalarState createState() => _EslatmalarState();
}

class _EslatmalarState extends State<Eslatmalar> {
  List<Reja> Eslatma = [];

  void _addReja() {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController dateController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Yangi Eslatma qo'shish"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'reja nomi'),
              ),
              TextField(
                controller: dateController,
                decoration: InputDecoration(labelText: 'Qachon bajarmoqchisiz'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Bekor qilish'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty &&
                      dateController.text.isNotEmpty) {
                    Eslatma.add(Reja(
                      id: Eslatma.length + 1,
                      title: titleController.text,
                      date: dateController.text,
                    ));
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text("Qo'shish"),
            ),
          ],
        );
      },
    );
  }

  void _editReja(int index) {
    TextEditingController titleController =
    TextEditingController(text: Eslatma[index].title);
    TextEditingController dateController =
    TextEditingController(text: Eslatma[index].date);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Eslatmani tahrirlash'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: dateController,
                decoration: InputDecoration(labelText: 'Date (yyyy-MM-dd)'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Bekor qilish'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  Eslatma[index] = Reja(
                    id: Eslatma[index].id,
                    title: titleController.text,
                    date: dateController.text,
                  );
                });
                Navigator.of(context).pop();
              },
              child: Text('Saqlash'),
            ),
          ],
        );
      },
    );
  }

  void _deleteReja(int index) {
    setState(() {
      Eslatma.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eslatma'),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: Eslatma.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200]),
                child: ListTile(
                  title: Text(Eslatma[index].title),
                  subtitle:
                  Text('${Eslatma[index].date}'),
                  isThreeLine: true,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _editReja(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteReja(index),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addReja,
        child: Icon(Icons.add),
      ),
    );
  }
}
