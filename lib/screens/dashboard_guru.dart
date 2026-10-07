import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  final Color primaryBlue = const Color(0xFF3563B8);
  final Color backgroundColor = const Color(0xFFF8F9FD);
  final Color borderColor = const Color(0xFFE8ECF5);
  final Color greyText = const Color(0xFF8793B3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      body: SafeArea(
        child: Column(
          children: [
            // =====================================================
            // HEADER
            // =====================================================
            _buildHeader(),

            // =====================================================
            // CONTENT
            // =====================================================
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 2),

                    // STATISTIK
                    _buildStatistics(),

                    const SizedBox(height: 24),

                    // QUICK ACTION
                    _sectionTitle('Quick Actions'),

                    const SizedBox(height: 12),

                    _buildQuickActions(),

                    const SizedBox(height: 25),

                    // RECENT VIOLATIONS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _sectionTitle('Recent Violations'),
                        TextButton(
                          onPressed: () {
                            // TODO: Buka semua pelanggaran
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(
                              color: primaryBlue,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    _buildViolationCard(
                      initials: 'AR',
                      name: 'Ahmad Rizky Pratama',
                      description: 'Late to class',
                      time: '08:15 AM',
                      point: '-5',
                      color: const Color(0xFF4775CB),
                    ),

                    const SizedBox(height: 10),

                    _buildViolationCard(
                      initials: 'FN',
                      name: 'Fajar Nugraha',
                      description: 'Incomplete uniform',
                      time: '09:20 AM',
                      point: '-3',
                      color: const Color(0xFF6CAB61),
                    ),

                    const SizedBox(height: 10),

                    _buildViolationCard(
                      initials: 'DS',
                      name: 'Dinda Safitri',
                      description: 'Absent without notice',
                      time: '10:05 AM',
                      point: '-10',
                      color: const Color(0xFFDF9C47),
                    ),

                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // =====================================================
      // BOTTOM NAVIGATION
      // =====================================================
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  // ===========================================================
  // HEADER
  // ===========================================================
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 17, 20, 18),
      decoration: BoxDecoration(
        color: primaryBlue,
      ),
      child: Column(
        children: [
          // PROFILE
          Row(
            children: [
              // AVATAR
              Container(
                width: 43,
                height: 43,
                decoration: const BoxDecoration(
                  color: Color(0xFF4E7BD0),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'BW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // NAME
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning,',
                      style: TextStyle(
                        color: Color(0xFFD6E0F5),
                        fontSize: 11,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Mr. Budi Wicaksono',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // NOTIFICATION
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_rounded,
                        color: Colors.white,
                        size: 21,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 7,
                    right: 8,
                    child: Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF6B6B),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 15),

          // DATE
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 13,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.calendar_month_rounded,
                    size: 13,
                    color: Colors.white,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Monday, January 15, 2024',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================
  // STATISTICS
  // ===========================================================
  Widget _buildStatistics() {
    return Transform.translate(
      offset: const Offset(0, 0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildStatisticCard(
                  icon: Icons.school_rounded,
                  iconColor: const Color(0xFF3D73CD),
                  iconBackground: const Color(0xFFE8F0FF),
                  value: '350',
                  title: 'Total Students',
                  badge: '+12',
                  badgeColor: const Color(0xFF6CAA5C),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _buildStatisticCard(
                  icon: Icons.warning_rounded,
                  iconColor: const Color(0xFFDF5B55),
                  iconBackground: const Color(0xFFFFE9E7),
                  value: '125',
                  title: 'Total Violations',
                  badge: '+8',
                  badgeColor: const Color(0xFF6CAA5C),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _buildStatisticCard(
                  icon: Icons.star_rounded,
                  iconColor: const Color(0xFF68AD59),
                  iconBackground: const Color(0xFFE9F5E6),
                  value: '85%',
                  title: 'Discipline Score',
                  badge: '+3%',
                  badgeColor: const Color(0xFF6CAA5C),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _buildStatisticCard(
                  icon: Icons.description_rounded,
                  iconColor: const Color(0xFFF19B35),
                  iconBackground: const Color(0xFFFFF0DD),
                  value: '20',
                  title: 'Active Reports',
                  badge: '-2',
                  badgeColor: const Color(0xFF6CAA5C),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBackground,
    required String value,
    required String title,
    required String badge,
    required Color badgeColor,
  }) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: borderColor,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.035),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: iconColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 19,
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F6EA),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  badge,
                  style: TextStyle(
                    color: badgeColor,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const Spacer(),

          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF12192B),
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            title,
            style: TextStyle(
              color: greyText,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================
  // QUICK ACTION
  // ===========================================================
  Widget _buildQuickActions() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildActionCard(
                icon: Icons.people_alt_rounded,
                title: 'Student Data',
                iconColor: const Color(0xFF6550A0),
                iconBackground: const Color(0xFFF0ECFA),
                onTap: () {
                  // TODO: Halaman data siswa
                },
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: _buildActionCard(
                icon: Icons.warning_amber_rounded,
                title: 'Add Violation',
                iconColor: const Color(0xFFE7A13E),
                iconBackground: const Color(0xFFFFF0D9),
                onTap: () {
                  // TODO: Halaman tambah pelanggaran
                },
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(
              child: _buildActionCard(
                icon: Icons.assignment_rounded,
                title: 'Violation\nHistory',
                iconColor: const Color(0xFFCF7794),
                iconBackground: const Color(0xFFF9E9F0),
                onTap: () {
                  // TODO: Halaman riwayat
                },
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: _buildActionCard(
                icon: Icons.bar_chart_rounded,
                title: 'Reports',
                iconColor: const Color(0xFF67A66B),
                iconBackground: const Color(0xFFE9F4E7),
                onTap: () {
                  // TODO: Halaman laporan
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required Color iconColor,
    required Color iconBackground,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: borderColor,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.025),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: iconBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  size: 18,
                  color: iconColor,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF20283A),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===========================================================
  // RECENT VIOLATION
  // ===========================================================
  Widget _buildViolationCard({
    required String initials,
    required String name,
    required String description,
    required String time,
    required String point,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              initials,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 11),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF20283A),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 3),

                Row(
                  children: [
                    Flexible(
                      child: Text(
                        description,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: greyText,
                          fontSize: 9,
                        ),
                      ),
                    ),

                    const SizedBox(width: 5),

                    Text(
                      '• $time',
                      style: TextStyle(
                        color: greyText,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Text(
            point,
            style: const TextStyle(
              color: Color(0xFFE65353),
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================
  // SECTION TITLE
  // ===========================================================
  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFF161D2F),
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // ===========================================================
  // BOTTOM NAVIGATION
  // ===========================================================
  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: borderColor,
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: primaryBlue,
        unselectedItemColor: const Color(0xFFAAB3C8),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 10,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              size: 23,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart_rounded,
              size: 23,
            ),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_rounded,
              size: 23,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}