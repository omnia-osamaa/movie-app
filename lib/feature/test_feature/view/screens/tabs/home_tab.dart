import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_apis.dart';
import 'package:movie_app/feature/test_feature/view/widgets/top_rated_item_widget.dart';
import 'package:movie_app/feature/test_feature/view_model/top_rated_cubit.dart';
import 'package:movie_app/feature/test_feature/view_model/top_rated_state.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 24),
              child: Text(
                'What do you want to watch?',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 260,
              child: BlocBuilder<TopRatedCubit, TopRatedState>(
                bloc: TopRatedCubit()..getTopRatedMovies(),
                builder: (context, state) {
                  if (state is TopRatedSuccess) {
                    return ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final fullPosterUrl =
                            "${AppApis.imageBaseUrl}${state.movies[index].posterPath}";
                        return TopRatedItemWidget(
                          imageUrl: fullPosterUrl,
                          index: index,
                        );
                      },
                      itemCount: state.movies.length,
                    );
                  }
                  if (state is TopRatedError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: TextTheme.of(context).bodyMedium,
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
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
