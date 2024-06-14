import 'package:flutter/material.dart';
import 'package:dars_45/model/App_settings.dart';

class Rejalar extends StatefulWidget {
  @override
  _RejalarState createState() => _RejalarState();
}

class _RejalarState extends State<Rejalar> {
  List<Reja> rejalar = [];

  void _addReja() {
    TextEditingController titleController = TextEditingController();
    TextEditingController dateController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Yangi Reja yaratayapsiz"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Reja nomi'),
              ),
              TextField(
                controller: dateController,
                decoration: InputDecoration(labelText: 'soati'),
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
                      dateController.text.isNotEmpty) {
                    rejalar.add(Reja(
                      id: rejalar.length + 1,
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
        TextEditingController(text: rejalar[index].title);
    TextEditingController dateController =
        TextEditingController(text: rejalar[index].date);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Rejani tahrirlash'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
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
                  rejalar[index] = Reja(
                    id: rejalar[index].id,
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
      rejalar.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Reja'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: rejalar.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200]),
                child: ListTile(
                  title: Text(rejalar[index].title),
                  subtitle:
                      Text('${rejalar[index].date}'),
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
