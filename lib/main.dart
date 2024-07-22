import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
void main() => runApp(MaterialApp(
      title: 'cemera open',
      debugShowCheckedModeBanner: false,
      home: homepage(),
    ));

class homepage extends StatefulWidget {
   homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  dynamic selectimage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'cemera',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          selectimage == null
              ? SizedBox()
              : Container(
                  height: 450,
                  width: double.infinity,
                  margin: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: FileImage(selectimage),
                      fit: BoxFit.cover,)),
                ),
          ElevatedButton(
            onPressed: () async {

                    final picker = ImagePicker();

              final pickImqage =await picker.pickImage(source: ImageSource.camera);

              if(pickImqage!=null){
File pickfile = File(pickImqage.path);
setState(() {
  selectimage=pickfile; 
});

              }else{

print('file is Empty');

              }
            },  
            child: Icon(
              Icons.photo_camera,
              size: 45,
              color: Colors.black,
            ),
          ),
        ]),
      ),
    );
  }
}



