import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/widgets/dark_round_button.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String wordButtonText;
  final String imageButtonText;
  final String imageAsset;
  final Color backgroundColor;

  const NoteCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageAsset,
    required this.backgroundColor,
    required this.wordButtonText,
    required this.imageButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.h,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      // padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: Stack(
        children: [
          // Background Image
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imageAsset,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              color: Colors.black.withValues(alpha: 0.2), // subtle dark overlay
              colorBlendMode: BlendMode.darken,
            ),
          ),

          // Gradient Fade
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  backgroundColor.withValues(alpha: 0.2),
                  backgroundColor.withValues(alpha: 0.8),
                  backgroundColor.withValues(alpha: 1),
                ],
                stops: const [0.0, 0.3, 0.6, 1.0],
              ),
            ),
          ),

          // BookMark Icon posiitoning
          Positioned(
            top: 16,
            right: 16,
            child: DarkRoundButton(icon: Icons.bookmark_border_outlined),
          ),

          // Content
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  title,
                  style: GoogleFonts.merriweather(
                    textStyle: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 20, height: 1.2),
                  ),
                ),
                Gap(4),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
                Gap(15.h),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: Theme.of(context).textButtonTheme.style,
                      child: Text(
                        wordButtonText,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                        ),
                      ),
                    ),
                    Gap(10.h),
                    TextButton(
                      onPressed: () {},
                      style: Theme.of(context).textButtonTheme.style,
                      child: Text(
                        imageButtonText,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
