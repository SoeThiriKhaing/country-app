import 'package:country/core/utils/appbar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/country_bloc.dart';
import '../bloc/country_state.dart';
//part of 'country_bloc.dart';
class SearchPage extends StatelessWidget {
  final String query;


   SearchPage({required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildAppBar("Search $query"),
      body: BlocBuilder<CountryBloc, CountryState>(
    builder: (context, state) {
      if(state is Initial){
       return CircularProgressIndicator();
      }else if(state is Loaded){
        return ListView.builder(
          itemCount:state.countries.length,
            itemBuilder: (context,index){
              final country=state.countries[index];
              debugPrint("Country data in UI:$country");
              return ListTile(
                title: Text(country.name),
                subtitle: Text(country.region),
                leading: Image.network(country.flagUrl,width: 100,),
              );
            });
      }else{
        Text("Data can't retrieve");
      }
      return Container();
    }

      ),



    );
  }
}






