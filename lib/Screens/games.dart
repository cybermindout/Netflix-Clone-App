import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_ui/api/api.dart';
import 'package:netflix_ui/api/api_links.dart';
import 'package:netflix_ui/widgets/list_view_games.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<SearchPage> {
  List _filterdata = [];
  final _searchQuery = TextEditingController();
  Timer? _debounce;
  String searchText = "";

  @override
  void initState() {
    _filterdata = allMoviesList;

    _searchQuery.addListener(onSearchChanged);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Search Movies"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade700,
            width: double.infinity,
            child: TextFormField(
              controller: _searchQuery,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.white),
                suffixIcon: Icon(Icons.mic, color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12),
                ),
                hintText: "Search movies, shows, tv...",
              ),
              onChanged: (text) {
                onSearchChanged();
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: CustomListView(
              list: allMoviesList,
              s: _searchQuery.text,
              newList: _filterdata,
            ),
          ),
        ],
      ),
    );
  }

  onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (searchText != _searchQuery.text) {
        setState(() {
          searchMovies(_searchQuery.text);
        });
      }
      searchText = _searchQuery.text;
    });
  }

  Future<void> searchMovies(String query) async {
    if (query.isEmpty) {
      setState(() {
        _filterdata = allMoviesList;
      });
      return;
    }

    try {
      final response = await http.get(Uri.parse('$search&query=$query'));
      print('Search URL: ${Uri.parse('$search&query=$query')}');
      print('Response: ${response.body}');

      if (response.statusCode == 200) {
        var tempData = jsonDecode(response.body);
        List searchResults = tempData['results'];
        setState(() {
          _filterdata = searchResults.map((movie) {
            return {
              'title':
                  movie['title'] ?? movie['original_name'] ?? 'Unknown Title',
              'backdrop_path': movie['backdrop_path'] ?? '',
              'overview': movie['overview'] ?? 'No overview available',
              'vote_average': movie['vote_average']?.toString() ?? 'N/A',
              'release_date': movie['release_date'] ??
                  movie['first_air_date'] ??
                  'Unknown Release Date',
              'poster_path': movie['poster_path'] ?? '',
            };
          }).toList();
        });
      } else {
        print("Error: ${response.statusCode}");
        throw Exception("Error loading search results");
      }
    } catch (e) {
      print("Exception: $e");
      throw Exception("Error loading search results");
    }
  }

  @override
  void dispose() {
    _searchQuery.removeListener(onSearchChanged);
    _searchQuery.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}
