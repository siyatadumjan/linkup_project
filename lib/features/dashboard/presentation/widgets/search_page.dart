import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];

  // Sample data for demonstration
  final List<String> _allUsers = [
    'John Doe',
    'Jane Smith',
    'Robert Johnson',
    'Emily Davis',
    'Michael Brown',
    'Sarah Wilson',
    'David Miller',
    'Lisa Taylor',
    'James Anderson',
    'Jennifer Thomas'
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_performSearch);
  }

  void _performSearch() {
    final query = _searchController.text.toLowerCase();

    setState(() {
      if (query.isEmpty) {
        _searchResults = [];
      } else {
        _searchResults = _allUsers
            .where((user) => user.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for people...',
                prefixIcon:
                    const Icon(Icons.search, color: AppColors.primaryPink),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _searchController.text.isEmpty
                  ? const Center(
                      child: Text(
                        'Search for people nearby',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : _searchResults.isEmpty
                      ? const Center(
                          child: Text(
                            'No users found',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: _searchResults.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: AppColors.primaryPink,
                                child: Text(
                                  _searchResults[index][0],
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              title: Text(_searchResults[index]),
                              subtitle: const Text('Tap to view profile'),
                              onTap: () {
                                // Handle user selection
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Selected ${_searchResults[index]}'),
                                    duration: const Duration(seconds: 1),
                                  ),
                                );
                              },
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
