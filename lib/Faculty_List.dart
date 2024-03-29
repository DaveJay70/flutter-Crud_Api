import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Api_Executer.dart';
import 'Faculty_Insert_Update.dart';

class Faculty_List extends StatefulWidget {
  @override
  State<Faculty_List> createState() => _Faculty_ListState();
}

class _Faculty_ListState extends State<Faculty_List> {
  Api_Executer api = Api_Executer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Api Crud",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).primaryColor),
      body: FutureBuilder(
        future: api.getFacultyApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      selectedColor: Colors.amber,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Faculty_Insert_Update(
                                map: snapshot.data![index]);
                          },
                        )).then((value) {
                          setState(() {});
                        });
                      },
                      leading:
                          Image.network(snapshot.data![index]['FacultyImage']),
                      title: Text(snapshot.data![index]['FacultyName']),
                      subtitle: Text(snapshot.data![index]['FacultyDesignation']
                          .toString()),
                      trailing: IconButton(
                        onPressed: () {
                          api
                              .deleteFaculty(
                                  snapshot.data![index]['id'].toString())
                              .then((value) {
                            setState(() {});
                          });
                        },
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                      )),
                );
              },
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return Faculty_Insert_Update();
              },
            )).then((value) {
              setState(() {});
            });
          },
          child: Icon(CupertinoIcons.add)),
    );
  }
}
