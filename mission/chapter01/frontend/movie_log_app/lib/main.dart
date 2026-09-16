import 'package:flutter/material.dart';

void main() {
  runApp(const MovieLogApp());
}

class AppColors {
  static const primary = Color(0xFF6750A4);
  static const surface = Color(0xFFFAF9F5);
  static const chip = Color(0xFFE9DDFF);
  static const text = Color(0xFF242126);
}

class MovieLogApp extends StatelessWidget {
  const MovieLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Manrope',
        scaffoldBackgroundColor: AppColors.surface,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          surface: AppColors.surface,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.surface,
          foregroundColor: AppColors.primary,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: AppColors.primary,
            fontSize: 36,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        title: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text('내 프로필'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(32, 44, 32, 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ProfileHeader(),
              const SizedBox(height: 54),
              Row(
                children: const [
                  Expanded(child: StatItem(label: '본 영화', value: '342')),
                  SizedBox(width: 16),
                  Expanded(child: StatItem(label: '평점', value: '4.2')),
                  SizedBox(width: 16),
                  Expanded(child: StatItem(label: '즐겨찾기', value: '58')),
                ],
              ),
              const SizedBox(height: 70),
              const Text(
                '선호하는 장르',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 28),
              Wrap(
                spacing: 16,
                runSpacing: 12,
                children: const [
                  GenreChip(label: '드라마'),
                  GenreChip(label: 'SF'),
                  GenreChip(label: '애니메이션'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 256,
          height: 256,
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Color(0xFFD2B8FF),
            shape: BoxShape.circle,
          ),
          child: const CircleAvatar(
            backgroundColor: Color(0xFF35313D),
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1494790108377-be9c29b29330'
              '?auto=format&fit=crop&w=600&q=85',
            ),
          ),
        ),
        const SizedBox(height: 34),
        const Text(
          '무비러버',
          style: TextStyle(
            color: AppColors.text,
            fontSize: 42,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          '매주 주말엔 영화관으로 출근하는 프로 관람객. 좋은\n영화를 보고 기록하는 것을 좋아합니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF56515D),
            fontSize: 25,
            height: 1.45,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 48),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            side: const BorderSide(color: AppColors.primary, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 18,
            ),
          ),
          child: const Text(
            '프로필 수정',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

class StatItem extends StatelessWidget {
  const StatItem({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE5D6FF), width: 2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF56515D),
              fontSize: 21,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF51358E),
              fontSize: 42,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class GenreChip extends StatelessWidget {
  const GenreChip({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.chip,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF5B4298),
          fontSize: 21,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
