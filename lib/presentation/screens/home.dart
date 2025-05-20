import 'package:country/core/utils/appbar_style.dart';
import 'package:country/presentation/screens/view_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../inject.dart';
import '../bloc/country_bloc.dart';
import '../bloc/country_event.dart';
import '../bloc/country_state.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  late CountryBloc countryBloc;

  @override
  void initState() {
    super.initState();
    countryBloc = sl<CountryBloc>();
    countryBloc.add(CountryEvent.loadAllCountries()); // Load all countries on start
  }

  void _onSearch() {
    final query = controller.text.trim();
    if (query.isEmpty) {
      countryBloc.add(CountryEvent.loadAllCountries()); // If empty, reload all
    } else {
      countryBloc.add(CountryEvent.search(query));
      // Search
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: countryBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Country Search',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: controller,
                onChanged: (_) => _onSearch(), // Live update
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  hintText: "Search country",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: _onSearch,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<CountryBloc, CountryState>(
                  builder: (context, state) {
                    if (state is Loading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is Loaded) {
                      final countries = state.countries;
                      if (countries.isEmpty) {
                        return Center(child: Text('No countries found.'));
                      }
                      return ListView.builder(
                        itemCount: countries.length,
                        itemBuilder: (context, index) {
                          final country = countries[index];
                          return Card(
                            elevation: 4.0,
                            color: Colors.white,
                            child: ListTile(
                              title: Text(country.name),
                              subtitle: Text(country.region),
                              leading: Image.network(country.flagUrl,width: 100,),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CountryDetailsPage(country: country),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    } else if (state is Error) {
                      return Center(child: Text('Failed to load countries.'));
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
