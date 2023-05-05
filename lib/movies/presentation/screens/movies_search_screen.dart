import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_application/movies/presentation/Bloc/Search_Cubit/search_cubit.dart';
import 'package:flutter_movie_application/movies/presentation/widgets/searched_movies_list.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class MOvieSearchScreen extends StatefulWidget {
  const MOvieSearchScreen({super.key});

  @override
  State<MOvieSearchScreen> createState() => _MOvieSearchScreenState();
}

class _MOvieSearchScreenState extends State<MOvieSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  // late SearchCubit _movieSearchCubit;

  void initstate() {
    // _timer?.cancel();
    _searchController.dispose();
    // context.read<SearchCubit>().getSearchList(queryFromUI: widget.toString());
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // String searchData = '';

  // Timer? _timer;
  // _onSearchChanged(String value) {
  //   if (_debounce?.isActive ?? false) _debounce?.cancel();
  //   _debounce = Timer(const Duration(milliseconds: 500), () {
  //     searchText = value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Search Movies',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              Container(
                height: 60.00,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white12),
                child: TextFormField(
                  // onChanged: (String value) {
                  //   if (_timer?.isActive ?? false) _timer?.cancel();
                  //   _timer = Timer(const Duration(milliseconds: 500), () {
                  //     searchData = value;
                  //   });
                  // },
                  style: const TextStyle(color: Colors.white),
                  controller: _searchController,
                  onFieldSubmitted: (userInput) {
                    context
                        .read<SearchCubit>()
                        .getSearchList(queryFromUI: userInput);
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.white54,
                    border: InputBorder.none,
                    hintText: 'Search Movie ',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              BlocBuilder<SearchCubit, SearchState>(
                // bloc: _searchCubit,
                builder: (context, state) {
                  if (state is MovieSearchLoading) {
                    return const SpinKitPulsingGrid(
                      color: Colors.blue,
                    );
                  }
                  if (state is MovieSearchedFetched) {
                    final searchedData = state.searchedData;
                    return SearchedMovieList(
                        searchController: _searchController,
                        searchedData: searchedData,
                        height: height,
                        width: width);
                  }

                  return const Center(
                    child: Text(
                      'You havent search any movies',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
