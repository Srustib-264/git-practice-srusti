import 'package:flutter/material.dart';
import 'login.dart';

// ---- Shared theme colors (same as login.dart) ----
class AppColors {
  static const twilight = Color(0xFF161B33);
  static const twilightDeep = Color(0xFF0E1226);
  static const paper = Color(0xFFF4ECD8);
  static const paperWarm = Color(0xFFEFE3C4);
  static const brass = Color(0xFFC89B3C);
  static const brassLight = Color(0xFFE0BA63);
  static const maroon = Color(0xFF7E2A34);
  static const ink = Color(0xFF2B2118);
  static const inkSoft = Color(0xFF4A4032);
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.paper,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(context),
              _buildHero(context),
              _buildRagaTimingSection(),
              _buildClassesSection(),
              _buildTestimonial(),
              _buildFooterCTA(context),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- TOP BAR ----------------
  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.brass,
                      AppColors.maroon,
                      AppColors.twilight,
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Ninada Sangeet Vidyalaya',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.twilight,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: Text(
              'Sign In',
              style: TextStyle(
                color: AppColors.maroon,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- HERO ----------------
  Widget _buildHero(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(28, 48, 28, 56),
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0.6, -0.6),
          radius: 1.2,
          colors: [
            Color(0xFF232B52),
            AppColors.twilight,
            AppColors.twilightDeep,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 24, height: 1, color: AppColors.brassLight),
              const SizedBox(width: 10),
              Text(
                'HINDUSTANI CLASSICAL MUSIC',
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 1.4,
                  color: AppColors.brassLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Text(
            'Learn the raga\nthe way it was\nmeant to be taught.',
            style: TextStyle(
              fontSize: 34,
              height: 1.15,
              fontWeight: FontWeight.w600,
              color: AppColors.paper,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'One-on-one taleem in the guru-shishya tradition — sur, laya, and bandish, taught patiently from the very first note.',
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: const Color(0xFFD8D3E0),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.brass,
                foregroundColor: AppColors.twilightDeep,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Book a Trial Class',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- RAGA TIMING SECTION ----------------
  Widget _buildRagaTimingSection() {
    final ragas = [
      {'time': '5:30 pm–7:pm', 'Day': 'Monday'},
      {'time': '5:30 pm–7:pm', 'Day': 'Tuesday'},
      {'time': '5:30 pm–7:pm', 'Day': 'Wednesday'},
      {'time': '5:30 pm–7:pm', 'Day': 'Thursday'},
      {'time': '5:30 pm–7:pm', 'Day': 'Friday'},
    ];

    return Container(
      width: double.infinity,
      color: AppColors.twilight,
      padding: const EdgeInsets.fromLTRB(28, 48, 28, 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SAMAY — THE TIME THEORY OF RAGA',
            style: TextStyle(
              fontSize: 11,
              letterSpacing: 1.2,
              color: AppColors.brassLight,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Timings.',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.paper,
            ),
          ),
          const SizedBox(height: 24),
          ...ragas.map((r) => _buildRagaRow(r['time']!, r['Day']!)),
        ],
      ),
    );
  }

  Widget _buildRagaRow(String time, String day) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.brass.withOpacity(0.2)),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              time,
              style: TextStyle(fontSize: 12, color: AppColors.brassLight),
            ),
          ),
          Expanded(
            child: Text(
              day,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.paper,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- CLASSES ----------------
  Widget _buildClassesSection() {
    final classes = [
      {
        'tag': 'BEGINNERS',
        'title': 'Swara Foundations',
        'desc':
            'Sur, saptak, and breath control. For age 7+ and adults with no prior training.',
        'meta': '2x / week · 45 min',
      },
      {
        'tag': 'INTERMEDIATE',
        'title': 'Raga & Bandish',
        'desc':
            'Alankar, taal, and your first ragas — Yaman, Bhupali, Bhairav.',
        'meta': '2x / week · 60 min',
      },
      {
        'tag': 'ADVANCED',
        'title': 'Vistaar & Performance',
        'desc':
            'Improvisation, taan, and stage-readiness for concerts and exams.',
        'meta': '1x / week · 90 min',
      },
    ];

    return Container(
      width: double.infinity,
      color: AppColors.paperWarm,
      padding: const EdgeInsets.fromLTRB(28, 48, 28, 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'LEARN WITH US',
            style: TextStyle(
              fontSize: 11,
              letterSpacing: 1.2,
              color: AppColors.maroon,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Classes for every stage\nof taleem.',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.twilight,
            ),
          ),
          const SizedBox(height: 24),
          ...classes.map(
            (c) =>
                _buildClassCard(c['tag']!, c['title']!, c['desc']!, c['meta']!),
          ),
        ],
      ),
    );
  }

  Widget _buildClassCard(String tag, String title, String desc, String meta) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.paper,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.brass.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.maroon),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              tag,
              style: TextStyle(
                fontSize: 11,
                letterSpacing: 0.5,
                color: AppColors.maroon,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.twilight,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            style: TextStyle(
              fontSize: 14,
              height: 1.4,
              color: AppColors.inkSoft,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.brass.withOpacity(0.25)),
              ),
            ),
            child: Text(
              meta,
              style: TextStyle(fontSize: 12, color: AppColors.inkSoft),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- TESTIMONIAL ----------------
  Widget _buildTestimonial() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(28, 48, 28, 48),
      child: Column(
        children: [
          Text(
            '"I came in not knowing what a saptak was. Two years later I performed Raag Yaman at my first baithak."',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              height: 1.5,
              color: AppColors.twilight,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '— Ananya R., student since 2023',
            style: TextStyle(fontSize: 13, color: AppColors.maroon),
          ),
        ],
      ),
    );
  }

  // ---------------- FOOTER CTA ----------------
  Widget _buildFooterCTA(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.twilightDeep,
      padding: const EdgeInsets.fromLTRB(28, 56, 28, 56),
      child: Column(
        children: [
          Text(
            'Your first note is\na message away.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: AppColors.paper,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Trial classes are held every Saturday morning.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: const Color(0xFFC9C4D6)),
          ),
          const SizedBox(height: 26),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.brass,
                foregroundColor: AppColors.twilightDeep,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
