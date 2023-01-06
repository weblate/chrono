import 'package:clock_app/data/paths.dart';
import 'package:clock_app/widgets/timezone_search_card.dart';
import 'package:flutter/material.dart';

import 'package:clock_app/types/city.dart';
import 'package:sqflite/sqflite.dart';

class SearchCityScreen extends StatefulWidget {
  const SearchCityScreen({super.key, required this.existingCities});

  final List<City> existingCities;

  @override
  _SearchCityScreenState createState() => _SearchCityScreenState();
}

class _SearchCityScreenState extends State<SearchCityScreen> {
  final TextEditingController _filter = TextEditingController();
  List<City> _filteredCities = [];
  Database? _db;
  bool _isDatabaseLoaded = false;

  _SearchCityScreenState() {
    _filter.addListener(() async {
      setState(() {
        if (_isDatabaseLoaded) {
          if (_filter.text.isEmpty) {
            _filteredCities = [];
          } else {
            _db
                ?.rawQuery(
                    "SELECT * FROM Timezones WHERE City LIKE '%${_filter.text}%' LIMIT 10")
                .then((results) {
              _filteredCities = results
                  .map((result) => City(
                      result['City'] as String,
                      result['Country'] as String,
                      result['Timezone'] as String))
                  .where((result) => !widget.existingCities
                      .any((city) => city.name == result.name))
                  .toList();
            });
          }
        }
      });
    });
  }

  _loadDatabase() async {
    String databasePath = await getTimezonesDatabasePath();
    _db = await openDatabase(databasePath, readOnly: true);
    setState(() {
      _isDatabaseLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          controller: _filter,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search for a city',
            hintStyle: Theme.of(context).textTheme.bodyLarge,
          ),
          textAlignVertical: TextAlignVertical.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: _filteredCities.length,
          itemBuilder: (BuildContext context, int index) {
            City city = _filteredCities[index];
            return TimeZoneSearchCard(
              city: city,
              onTap: () {
                Navigator.pop(context, city);
              },
            );
          },
        ),
      ),
    );
  }
}
