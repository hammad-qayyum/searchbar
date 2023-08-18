import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Search Bar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // list of all names
  List<String> names = [
    'John',
    'James',
    'Williams',
    'Sarah',
    'Sarmeen',
    'Thomas',
    'Alex'
  ];

  List<String> _filteredItems = [];
  TextEditingController _searchController = TextEditingController();


  // function to filter items according to the text in search bar
  void _filterItems(String query) {
    setState(() {
      _filteredItems = names
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _filteredItems.addAll(names);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            // Search bar UI
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300],
              ),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (_) => {_filterItems(_searchController.text)},
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Display of list of names
            Center(
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(20),
                        color: Colors.green.withOpacity(0.2),
                        height: 100,
                        width: 100,
                        child: Center(child: Text(_filteredItems[index])),
                      );
                    }),
              ),
            )
          ],
        ));
  }
}
