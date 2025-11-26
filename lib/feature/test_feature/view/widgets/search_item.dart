import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/app_assets.dart';
import 'package:movie_app/core/utils/app_apis.dart';
import 'package:movie_app/feature/test_feature/data/model/search_movie_model.dart';

class SearchItem extends StatelessWidget {
  final Results movie;
  const SearchItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      height: 100,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: movie.posterPath != null
                ? Image.network("${AppApis.imageBaseUrl}${movie.posterPath}", width: 100, fit: BoxFit.cover)
                : Container(width: 100, color: Colors.grey),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(movie.title ?? "No Title", style: const TextStyle(color: Colors.white, fontSize: 16)),
                const SizedBox(height: 5),
                Text(movie.releaseDate ?? "", style: const TextStyle(color: Colors.white70)),
                const SizedBox(height: 5),
                 Row(
                  children: [
                    SvgPicture.asset(AppIcons.star), 
                    const SizedBox(width: 4),
                    Text((movie.voteAverage ?? 0.0).toStringAsFixed(1), style: const TextStyle(color: Colors.white)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}