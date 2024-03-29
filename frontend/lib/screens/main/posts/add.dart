import 'package:flutter/material.dart';
import 'package:foasvet/services/posts.dart';

class Add extends StatefulWidget {
  Add({Key key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final PostService _postService = PostService();
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Post an Aspiration',
            style: TextStyle(fontFamily: 'Poppins'),
          ),
          backgroundColor: Color.fromRGBO(4, 116, 132, 1),
          actions: <Widget>[
            FlatButton(
                textColor: Colors.white,
                onPressed: () async {
                  _postService.savePost(text);
                  Navigator.pop(context);
                },
                child: Text(
                  'Post',
                  style: TextStyle(fontFamily: 'Poppins'),
                ))
          ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: new Form(
                child: TextFormField(
              style: TextStyle(fontFamily: 'Poppins'),
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              minLines: 2,
              maxLines: 5,
              onChanged: (val) {
                setState(() {
                  text = val;
                });
              },
            ))));
  }
}
