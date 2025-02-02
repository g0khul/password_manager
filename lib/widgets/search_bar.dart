import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final List<String> data;
  final ValueChanged<List<String>> onResultsUpdated;

  const SearchBarWidget({
    super.key,
    required this.data,
    required this.onResultsUpdated,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();
  List<String> _filteredData = [];
  List<String> _searchHistory = [];
  bool _showHistory = true;
  bool _showClearIcon = false; // Tracks whether to show the clear icon

  @override
  void initState() {
    super.initState();
    _filteredData = widget.data;
  }

  void _onSearchChanged(String query) {
    setState(() {
      _showHistory = query.isEmpty;
      _showClearIcon = query.isNotEmpty; // Show clear icon when user types

      if (query.isEmpty) {
        _filteredData = widget.data;
      } else {
        _filteredData = widget.data
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
    widget.onResultsUpdated(_filteredData);
  }

  void _onSearchSubmitted(String query) {
    if (query.isNotEmpty && !_searchHistory.contains(query)) {
      setState(() {
        _searchHistory.insert(0, query);
      });
    }
  }

  void _clearSearch() {
    setState(() {
      _controller.clear();
      _showClearIcon = false;
      _filteredData = widget.data;
      _showHistory = true;
    });
    widget.onResultsUpdated(_filteredData);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          onChanged: _onSearchChanged,
          onSubmitted: _onSearchSubmitted,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: _showClearIcon
                ? GestureDetector(
                    onTap: _clearSearch,
                    child: Icon(Icons.clear),
                  )
                : const Icon(Icons.mic),
            hintText: 'Search...',
            filled: true,
            fillColor: theme.colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
        if (_showHistory && _searchHistory.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text('Recent Searches', style: theme.textTheme.bodyMedium),
          ..._searchHistory.map((query) => ListTile(
                title: Text(query),
                onTap: () {
                  _controller.text = query;
                  _onSearchChanged(query);
                },
              )),
          TextButton(
            onPressed: _clearSearch,
            child: const Text('Clear History'),
          )
        ]
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
