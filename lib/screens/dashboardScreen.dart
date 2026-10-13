import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaselearning/screens/login.dart';
import 'package:flutter/material.dart';

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

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  String get _displayName {
    final user = FirebaseAuth.instance.currentUser;
    if (user?.displayName != null && user!.displayName!.isNotEmpty) {
      return user.displayName!;
    }
    if (user?.email != null) {
      return user!.email!.split('@').first;
    }
    return 'Student';
  }

  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (!context.mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

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
              _buildGreetingHero(),
              _buildNextClassCard(),
              _buildRagaOfTheDay(),
              _buildProgressSection(),
              _buildQuickActions(context),
              const SizedBox(height: 32),
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
                'Ninada Sangeet',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.twilight,
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.logout, color: AppColors.maroon),
            tooltip: 'Sign out',
            onPressed: () => _signOut(context),
          ),
        ],
      ),
    );
  }

  // ---------------- GREETING HERO ----------------
  Widget _buildGreetingHero() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(28, 20, 28, 36),
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
          Text(
            'Namaste, $_displayName',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: AppColors.paper,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Ready for today\'s riyaz?',
            style: TextStyle(fontSize: 15, color: const Color(0xFFD8D3E0)),
          ),
        ],
      ),
    );
  }

  // ---------------- NEXT CLASS CARD ----------------
  Widget _buildNextClassCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.paperWarm,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.brass.withOpacity(0.35)),
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: AppColors.maroon,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.event_note, color: AppColors.paper),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Next Class: Raga & Bandish',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.twilight,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Saturday · 5:00 PM · with Guruji',
                    style: TextStyle(fontSize: 13, color: AppColors.inkSoft),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: AppColors.inkSoft),
          ],
        ),
      ),
    );
  }

  // ---------------- RAGA OF THE DAY ----------------
  Widget _buildRagaOfTheDay() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'RAGA FOR THIS HOUR',
            style: TextStyle(
              fontSize: 11,
              letterSpacing: 1.2,
              color: AppColors.maroon,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.twilight,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Yaman',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: AppColors.paper,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Serene, romantic dusk · 4–7 PM',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.brassLight,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.graphic_eq, color: AppColors.brassLight, size: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- PROGRESS SECTION ----------------
  Widget _buildProgressSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'YOUR PROGRESS',
            style: TextStyle(
              fontSize: 11,
              letterSpacing: 1.2,
              color: AppColors.maroon,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _statCard('12', 'Classes\nattended')),
              const SizedBox(width: 12),
              Expanded(child: _statCard('4', 'Ragas\nlearned')),
              const SizedBox(width: 12),
              Expanded(child: _statCard('26', 'Day riyaz\nstreak')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.paperWarm,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.brass.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.maroon,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.inkSoft,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- QUICK ACTIONS ----------------
  Widget _buildQuickActions(BuildContext context) {
    final actions = [
      {'icon': Icons.calendar_month, 'label': 'Schedule'},
      {'icon': Icons.library_music, 'label': 'My Ragas'},
      {'icon': Icons.mic, 'label': 'Practice Log'},
      {'icon': Icons.chat_bubble_outline, 'label': 'Message Guru'},
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'QUICK ACTIONS',
            style: TextStyle(
              fontSize: 11,
              letterSpacing: 1.2,
              color: AppColors.maroon,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.7,
            children: actions.map((a) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.paper,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.brass.withOpacity(0.3)),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(6),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${a['label']} coming soon')),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            a['icon'] as IconData,
                            color: AppColors.maroon,
                            size: 22,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            a['label'] as String,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.twilight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
