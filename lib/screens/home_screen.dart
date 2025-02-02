import 'package:flutter/material.dart';
import 'package:password_manager/widgets/info_card.dart';
import 'package:password_manager/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> cardData = [
    {"icon": Icons.key, "title": "All", "count": 210},
    {"icon": Icons.person, "title": "Passkeys", "count": 51},
    {"icon": Icons.lock, "title": "Codes", "count": 17},
    {"icon": Icons.wifi, "title": "Wi-Fi", "count": 24},
    {"icon": Icons.error, "title": "Security", "count": 0},
    {"icon": Icons.delete, "title": "Deleted", "count": 0},
  ];

  List<Map<String, dynamic>> _filteredData = [];

  @override
  void initState() {
    super.initState();
    _filteredData = List.from(cardData);
  }

  void _updateSearchResults(List<String> results) {
    setState(() {
      _filteredData =
          cardData.where((card) => results.contains(card['title'])).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchBarWidget(
              data: cardData.map((card) => card['title'] as String).toList(),
              onResultsUpdated: _updateSearchResults,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: _filteredData.length,
                itemBuilder: (context, index) {
                  final card = _filteredData[index];
                  return InfoCard(
                    icon: card['icon'],
                    title: card['title'],
                    count: card['count'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
