import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/app/colors.dart';
import 'package:notes/component/note_data.dart';
import 'package:notes/widgets/dark_round_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NoteCard extends StatefulWidget {
  const NoteCard({super.key});

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
    _controller = PageController(viewportFraction: 0.7);

    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < NoteData.notes.length - 1) {
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
          width: double.infinity,
          child: PageView.builder(
            controller: _controller,
            itemCount: NoteData.notes.length,
            itemBuilder: (context, index) {
              final note = NoteData.notes[index];
              return AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  double value = 1.0;
                  if (_controller.position.haveDimensions) {
                    value = _controller.page! - index;
                    value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                  }
                  return Center(
                    child: Transform.scale(scale: value, child: cardItem(note)),
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
            count: NoteData.notes.length, // ✅ indicator count
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

  Widget cardItem(Map<String, dynamic> note) {
    return Container(
      height: 320.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: note['backgroundColor'],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              note['imageAsset'], // ✅ image
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              color: Colors.black.withValues(alpha: 0.2),
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
                  note['backgroundColor'].withOpacity(0.2),
                  note['backgroundColor'].withOpacity(0.8),
                  note['backgroundColor'].withOpacity(1.0),
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
                  note['title'],
                  style: GoogleFonts.merriweather(
                    textStyle: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 20, height: 1.2),
                  ),
                ),
                Gap(4),
                Text(
                  note['subtitle'],
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Gap(15.h),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: Theme.of(context).textButtonTheme.style,
                      child: Text(
                        note['wordButtonText'],
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
                        note['imageButtonText'],
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
