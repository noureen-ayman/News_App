import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/API/model/responses/articles/Article.dart';
import 'package:news/AppCore/AppColors/AppColors.dart';
import 'package:news/AppCore/extentions/dateFormatter_extentions.dart';
import 'package:provider/provider.dart';
import '../../AppCore/providers/ThemeProvider.dart';

class NewsCardView extends StatelessWidget {
  Article articleModel;

  NewsCardView({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      width: 361,
      height: 322,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(
          color: themeProvider.isDark ? AppColors.white : AppColors.black,
          width: 2,
        ),
      ),
      child: Column(
        spacing: 10,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child:
                  (articleModel.urlToImage != null &&
                      articleModel.urlToImage!.isNotEmpty)
                  ? CachedNetworkImage(
                      imageUrl: articleModel.urlToImage!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                          size: 40,
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.grey.shade300,
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                          size: 40,
                        ),
                      ),
                    ),
            ),
          ),
          Text(
            articleModel.description ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'By : ${articleModel.author}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              Expanded(
                child: Text(
                  articleModel.publishedAt?.formateArticlesDate() ?? " ",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
