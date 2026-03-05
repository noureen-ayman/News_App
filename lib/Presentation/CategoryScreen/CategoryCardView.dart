import 'package:flutter/material.dart';
import 'package:news/AppCore/AppColors/AppColors.dart';
import 'package:news/AppCore/extensions/context_extensions.dart';
import 'package:provider/provider.dart';

import '../../AppCore/providers/ThemeProvider.dart';
import '../../data/CategoryCardModel/CategoryCardModel.dart';
import '../../l10n/app_localizations.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final int index;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.select<ThemeProvider, bool>((p) => p.isDark);
    final l10n = AppLocalizations.of(context)!;
    final bool imageOnLeft = index.isEven;
    final languageCode = Localizations.localeOf(context).languageCode;
    final categoryName =
        (languageCode == 'ar' ? category.catNameAr : category.catNameEn) ?? "";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(35),
        child: Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            color: isDark ? AppColors.white : AppColors.grey,
            borderRadius: BorderRadius.circular(35),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Stack(
              children: [
                Positioned(
                  top: -10,
                  bottom: -10,
                  left: imageOnLeft ? -30 : null,
                  right: !imageOnLeft ? -30 : null,
                  child: _CategoryImage(imagePath: category.image),
                ),

                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Align(
                    alignment: imageOnLeft
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: imageOnLeft
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Text(
                            categoryName,
                            textAlign: imageOnLeft
                                ? TextAlign.right
                                : TextAlign.left,
                            style: context.fonts.titleLarge?.copyWith(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: isDark ? AppColors.black : AppColors.white,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ViewAllButton(
                            text: l10n.viewAll,
                            isDark: isDark,
                            imageOnLeft: imageOnLeft,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryImage extends StatelessWidget {
  final String? imagePath;

  const _CategoryImage({this.imagePath});

  @override
  Widget build(BuildContext context) {
    if (imagePath == null || imagePath!.isEmpty) return const SizedBox();
    return Image.asset(imagePath!, fit: BoxFit.contain);
  }
}

class ViewAllButton extends StatelessWidget {
  final String text;
  final bool isDark;
  final bool imageOnLeft;

  const ViewAllButton({
    super.key,
    required this.text,
    required this.isDark,
    required this.imageOnLeft,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = (isDark ? AppColors.black : AppColors.white).withAlpha(124);
    final contentColor = isDark ? AppColors.white : AppColors.black;
    final iconBgColor = isDark ? AppColors.black : AppColors.white;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: bgColor,
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (imageOnLeft) ...[
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 12),
                child: Text(
                  text,
                  style: TextStyle(
                    color: contentColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              _buildIcon(iconBgColor, contentColor, Icons.chevron_right),
            ],
            if (!imageOnLeft) ...[
              _buildIcon(iconBgColor, contentColor, Icons.chevron_left),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 16),
                child: Text(
                  text,
                  style: TextStyle(
                    color: contentColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(Color bg, Color iconColor, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(shape: BoxShape.circle, color: bg),
      child: Icon(icon, color: iconColor, size: 24),
    );
  }
}
