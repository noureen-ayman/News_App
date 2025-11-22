import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/API/model/responses/articles/Article.dart';
import 'package:news/AppCore/extensions/context_extensions.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../AppCore/AppColors/AppColors.dart';
import '../../../AppCore/providers/ThemeProvider.dart';
import '../../../l10n/app_localizations.dart';

class SelectedArticlePanel extends StatelessWidget {
  final Article article;

  const SelectedArticlePanel({super.key, required this.article});

  Future<void> _launchUrl(BuildContext context, String? Url) async {
    if (Url == null || Url.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not open article, URL is missing.'),
        ),
      );
      return;
    }

    final Uri url = Uri.parse(Url);

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not launch $url')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final l10n = AppLocalizations.of(context)!;

    return Container(
      height: 420,
      width: 388,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: themeProvider.isDark ? AppColors.white : AppColors.black,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Container(
                height: 220,
                width: 345,
                color: Colors.grey.shade300,
                child: const Icon(Icons.broken_image, color: Colors.grey),
              ),
            ),
          ),
          Text(
            article.description ?? 'No Description',
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: themeProvider.isDark ? AppColors.black : AppColors.white,
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                _launchUrl(context, article.url);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.grey,
                foregroundColor: AppColors.white,
                overlayColor: Colors.transparent,
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(width: 2, color: Colors.transparent),
                ),
              ),
              child: Text(
                l10n.viewFullArticle,
                style: context.fonts.titleLarge?.copyWith(
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
