import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_eco/blocs/movie/movie_bloc.dart';
import 'package:project_eco/blocs/movie/movie_state.dart';
//import 'package:project_eco/viewmodels/movie_viewmodel.dart';
import 'package:project_eco/widgets/genre_filter.dart';
import 'package:project_eco/widgets/movie_list.dart';
//import 'package:project_eco/widgets/movie_search.dart';
//import 'package:provider/provider.dart';

class MyHomePageBloc extends StatelessWidget {
  const MyHomePageBloc({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF1f1f2b),
      appBar: AppBar(
        backgroundColor: Color(0xFF1f1f2b),
        foregroundColor: Colors.white,
        title: Text(title),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if(state.isLoading){
            return const Center(child: CircularProgressIndicator());
          }
          if(state.error != null){
            return Center(child: Text(state.error.toString()),);
          }
          return ListView(
          padding: EdgeInsets.all(10),
          children: [
            //SearchMovie(),
            //SizedBox(height: 16),
            GenreFilter(),
            SizedBox(height: 16),
            SizedBox(
              height: 290,
              child: MovieList(
                title: 'Os mais populares',
                movies: state.popular,
              ),
            ),
            SizedBox(
              height: 290,
              child: MovieList(
                title: 'Agora nos cinemas',
                movies: state.now,
              ),
            ),
            SizedBox(
              height: 290,
              child: MovieList(
                title: 'Em breve nos cinemas',
                movies: state.upcoming,
              ),
            ),
            
          ],
        );
        }
      ),
    );
  }
}
