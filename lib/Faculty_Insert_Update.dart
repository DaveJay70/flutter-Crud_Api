import 'package:flutter/material.dart';

import 'Api_Executer.dart';

class Faculty_Insert_Update extends StatelessWidget {
  Map? map;

  Faculty_Insert_Update({this.map}) {
    NameSendController.text = map != null ? map!['FacultyName'] : '';
    DesSendController.text =
        map != null ? map!['FacultyDesignation'].toString() : '';
    ImageSendController.text = map != null ? map!['FacultyImage'] : '';
  }

  TextEditingController NameSendController = TextEditingController();
  TextEditingController DesSendController = TextEditingController();
  TextEditingController ImageSendController = TextEditingController();
  Api_Executer db = Api_Executer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("${map != null ? "Edit" : "Add"} Faculty Enter"),
          backgroundColor: Theme.of(context).primaryColor),
      body: Column(children: [
        TextFormField(
          controller: NameSendController,
          decoration: InputDecoration(label: Text("Enter the Name")),
        ),
        TextFormField(
          controller: DesSendController,
          decoration: InputDecoration(label: Text("Enter the Designation")),
        ),
        TextFormField(
          controller: ImageSendController,
          decoration: InputDecoration(label: Text("Enter the Image Path")),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              if (map == null) {
                final newFaculty = {
                  'FacultyName': NameSendController.text,
                  'FacultyDesignation': DesSendController.text.toString(),
                  'FacultyImage': ImageSendController.text,
                };
                db.insertFaculty(newFaculty).then((value) {
                  Navigator.pop(context);
                });
              } else {
                final Update = {
                  'id': map!['id'].toString(),
                  'FacultyName': NameSendController.text,
                  'FacultyDesignation': DesSendController.text.toString(),
                  'FacultyImage': ImageSendController.text,
                };
                db.updateFaculty(Update).then((value) {
                  Navigator.pop(context);
                });
              }
            },
            child: Text("Submit"))
      ]),
    );
  }
}
