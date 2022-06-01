import 'package:flutter/material.dart';
import 'package:jfamosdelivery/helper/consts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Forms extends StatefulWidget {
  final String pageName;
  const Forms({Key? key, required this.pageName}) : super(key: key);

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  Future getData() async {
    String pageName = widget.pageName;
    var api =
        'http://www.jfamoslogistics.com/APIs/APIs2.asmx/Forms?ftype=$pageName';
    var data = await http.get(Uri.parse(api));
    if (data.statusCode == 200) {
      // print(data.body);
      return data.body;
    } else {
      throw Exception('Failed to load data, statusCode: ${data.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Future<String> getTitle() async {
    var data = await getData();
    var title = jsonDecode(data.toString())[0]['ftitle'];
    // print(title);
    return title;
  }

  getContent() async {
    var data = await getData();
    var content = jsonDecode(data.toString())[0]['fdescription'];
    // print(content);
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Create Password',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontFamily: 'fredoka',
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              style: ListTileStyle.list,
              tileColor: Colors.white,
              leading: const Icon(
                Icons.info,
                color: kGreenColor,
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: FutureBuilder(
                  future: getTitle(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data.toString(),
                        style: const TextStyle(
                            fontFamily: 'fredoka',
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color: kGreenColor),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const Text('');
                  },
                ),
              ),
              subtitle: FutureBuilder(
                future: getContent(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data.toString(),
                      style: const TextStyle(
                          fontFamily: 'fredoka',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const Text('');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
