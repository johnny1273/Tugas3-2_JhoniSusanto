import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'NEW RECEIP',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            centerTitle: true,
            actions: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: TextButton(
                    child: Text(
                      'Close',
                      style: TextStyle(
                        color: Color.fromARGB(255, 240, 58, 48),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Center(
                child: Container(
                  width: double.infinity,
                  height: 80,
                  color: Color.fromARGB(255, 241, 37, 22),
                  padding: EdgeInsets.all(16),
                  child: const Text(
                    "Super Cool you are creating a new recipe!\nLet's get started",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              MyReceipForm(),
            ],
          )),
    );
  }
}

class MyReceipForm extends StatefulWidget {
  const MyReceipForm({Key? key}) : super(key: key);

  @override
  State<MyReceipForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyReceipForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController waktuController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController resepController = TextEditingController();

  String resultName = '';
  String resultWaktu = '';
  String resultDeskripsi = '';
  String resultResep = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Form Inputan
            Text(
              'Give your receip a name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            TextFormField(
              controller: nameController,
              onChanged: (value) {
                setState(() {
                  TextSelection previousSelection = nameController.selection;
                  nameController.text = value;
                  nameController.selection = previousSelection;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Masukkan Nama Menu",
              ),
            ),
            Container(height: 15),
            //2
            Text(
              'Estimasi Waktu Memasak (menit)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            TextFormField(
              controller: waktuController,
              onChanged: (value) {
                setState(() {
                  TextSelection previousSelection = waktuController.selection;
                  waktuController.text = value;
                  waktuController.selection = previousSelection;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Masukkan Waktu Pembuatan",
              ),
            ),
            Container(height: 15),
            //3
            Text(
              'Deskripsi',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),

            TextFormField(
              controller: deskripsiController,
              onChanged: (value) {
                setState(() {
                  TextSelection previousSelection =
                      deskripsiController.selection;
                  deskripsiController.text = value;
                  deskripsiController.selection = previousSelection;
                });
              },
              maxLines: 2,
              minLines: 2,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Masukkan Deskripsi",
              ),
            ),
            Container(
              height:
                  15, // Atur tinggi container untuk memberikan jarak vertikal
            ),
            //4
            Text(
              'Resep, bahan dan langkah',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            TextFormField(
              controller: resepController,
              onChanged: (value) {
                setState(() {
                  TextSelection previousSelection = resepController.selection;
                  resepController.text = value;
                  resepController.selection = previousSelection;
                });
              },
              maxLines: 2,
              minLines: 2,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Masukkan Resep dan Cara Pembuatan",
              ),
            ),

//Batas

            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        resultName = nameController.text;
                        resultWaktu = waktuController.text;
                        resultDeskripsi = deskripsiController.text;
                        resultResep = resepController.text;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Your data successfully to add!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 240, 21, 6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add Menu",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
                "Result: ${nameController.text}|${waktuController.text}|${deskripsiController.text}|${resepController.text}"),
          ],
        ),
      ),
    );
  }
}
