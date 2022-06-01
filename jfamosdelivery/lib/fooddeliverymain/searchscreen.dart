import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/searchmenuitems.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    futureMenuItems = fetchSearchMenuItem();
    super.initState();
  }

  late Future<List<SearchMenuItems>> futureMenuItems;
  Future<List<SearchMenuItems>> fetchSearchMenuItem() async {
    final response = await http.get(Uri.parse(
        'http://www.jfamoslogistics.com/APIs/APIs2.asmx/SearchMenuItems'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<SearchMenuItems>((json) => SearchMenuItems.fromMap(json))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  // ignore: unused_field
  String? _selectedItem;

  // This list holds all the suggestions
  List<String> _suggestions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Search Food item or Restraunt',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: FutureBuilder<List<SearchMenuItems>>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _suggestions = snapshot.data!.map((e) => e.itemname!).toList();

              return Column(
                children: [
                  InputDecorator(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.all(12),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 24.0, right: 16.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 28,
                        ),
                      ),
                    ),
                    child: Autocomplete<String>(
                      optionsBuilder: (TextEditingValue value) {
                        // When the field is empty
                        if (value.text.isEmpty) {
                          return [];
                        }

                        // The logic to find out which ones should appear
                        return _suggestions.where((suggestion) => suggestion
                            .toLowerCase()
                            .contains(value.text.toLowerCase()));
                      },
                      onSelected: (value) {
                        setState(() {
                          _selectedItem = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TabBar(
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.green,
                    tabs: const [
                      Tab(
                        text: 'Food Items',
                      ),
                      Tab(
                        text: 'Restaurants',
                      )
                    ],
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Column(
                          children: const [],
                        ),
                        const Text('Person')
                      ],
                    ),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          future: futureMenuItems,
        ));
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }
}
