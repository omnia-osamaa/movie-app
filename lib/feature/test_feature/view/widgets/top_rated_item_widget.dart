import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';

class TopRatedItemWidget extends StatelessWidget {
  const TopRatedItemWidget({super.key, this.index, this.imageUrl});
  final int? index;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: 145,
            height: 220,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: imageUrl == null || imageUrl!.isEmpty
                  ? Container(color: AppColors.grey)
                  : CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: imageUrl!,
                      placeholder: (context, url) =>
                          Container(color: AppColors.primary),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: -15,
            child: Stack(
              children: [
                Text(
                  '${index! + 1}',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 96,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
                Text(
                  '${index! + 1}',
                  style: TextStyle(
                    fontSize: 96,
                    fontWeight: FontWeight.bold,
                    height: 1,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 0.5
                      ..color = AppColors.secondary,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
