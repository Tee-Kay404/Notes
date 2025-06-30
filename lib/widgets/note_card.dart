import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/app/colors.dart';
import 'package:notes/widgets/dark_round_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NoteCard extends StatefulWidget {
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
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  late PageController _controller;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.8);

    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _controller.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 340.h,
          child: PageView.builder(
            controller: _controller,
            itemCount: 3,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  double value = 1.0;
                  if (_controller.position.haveDimensions) {
                    value = _controller.page! - index;
                    value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                  }
                  return Center(
                    child: Transform.scale(scale: value, child: cardItem()),
                  );
                },
              );
            },
          ),
        ),
        Gap(5.h),
        Center(
          child: SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: WormEffect(
              dotHeight: 8.h,
              dotWidth: 8.w,
              activeDotColor: NotesColor.success,
              dotColor: Colors.grey.shade300,
            ),
          ),
        ),
      ],
    );
  }

  Widget cardItem() {
    return Container(
      height: 320.h,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.backgroundColor,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              widget.imageAsset,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              color: Colors.black.withOpacity(0.2),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  widget.backgroundColor.withOpacity(0.2),
                  widget.backgroundColor.withOpacity(0.8),
                  widget.backgroundColor.withOpacity(1),
                ],
                stops: const [0.0, 0.3, 0.6, 1.0],
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: DarkRoundButton(icon: Icons.bookmark_border_outlined),
          ),
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  widget.title,
                  style: GoogleFonts.merriweather(
                    textStyle: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 20, height: 1.2),
                  ),
                ),
                Gap(4),
                Text(
                  widget.subtitle,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Gap(15.h),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: Theme.of(context).textButtonTheme.style,
                      child: Text(
                        widget.wordButtonText,
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
                        widget.imageButtonText,
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
