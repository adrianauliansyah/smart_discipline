import 'package:flutter/material.dart';
import 'package:smart_discipline/screens/dashboard_guru.dart';
import 'package:smart_discipline/screens/laporan_guru_screen.dart';
import 'package:smart_discipline/screens/profil_guru_screen.dart';

import '../theme/app_theme.dart';

class TeacherShell extends StatelessWidget {
  final int selectedIndex;
  final Widget child;
  final String title;
  final List<Widget>? actions;

  const TeacherShell({
    super.key,
    required this.selectedIndex,
    required this.child,
    required this.title,
    this.actions,
  });

  void _go(
    BuildContext context,
    int index,
  ) {
    if (index == selectedIndex) {
      return;
    }

    Widget page;

    if (index == 0) {
      page = const DashboardGuru();
    } else if (index == 1) {
      page = const LaporanGuruScreen();
    } else {
      page = const ProfilGuruScreen();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final desktop =
            constraints.maxWidth >= 900;

        // ================================
        // DESKTOP / WEB
        // ================================
        if (desktop) {
          return Scaffold(
            body: Row(
              children: [
                // SIDEBAR
                Container(
                  width: 240,
                  color:
                      const Color(0xFF1F2532),

                  child: SafeArea(
                    child: Padding(
                      padding:
                          const EdgeInsets.all(18),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [
                          const Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    AppColors.primary,
                                child: Icon(
                                  Icons.school_rounded,
                                  color: Colors.white,
                                ),
                              ),

                              SizedBox(width: 12),

                              Expanded(
                                child: Text(
                                  'Smart Discipline',
                                  style: TextStyle(
                                    color:
                                        Colors.white,
                                    fontSize: 16,
                                    fontWeight:
                                        FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 34),

                          _SideItem(
                            icon:
                                Icons.home_rounded,
                            label: 'Dashboard',
                            selected:
                                selectedIndex == 0,
                            onTap: () =>
                                _go(context, 0),
                          ),

                          _SideItem(
                            icon:
                                Icons.bar_chart_rounded,
                            label: 'Laporan',
                            selected:
                                selectedIndex == 1,
                            onTap: () =>
                                _go(context, 1),
                          ),

                          _SideItem(
                            icon:
                                Icons.person_rounded,
                            label: 'Profil',
                            selected:
                                selectedIndex == 2,
                            onTap: () =>
                                _go(context, 2),
                          ),

                          const Spacer(),

                          Container(
                            padding:
                                const EdgeInsets.all(14),

                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.06),
                              borderRadius:
                                  BorderRadius.circular(
                                16,
                              ),
                            ),

                            child: const Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      AppColors.primary,
                                  child: Text(
                                    'BW',
                                    style: TextStyle(
                                      color:
                                          Colors.white,
                                    ),
                                  ),
                                ),

                                SizedBox(width: 10),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,

                                    children: [
                                      Text(
                                        'Budi Wicaksono',
                                        overflow:
                                            TextOverflow
                                                .ellipsis,
                                        style: TextStyle(
                                          color:
                                              Colors.white,
                                          fontWeight:
                                              FontWeight
                                                  .w700,
                                        ),
                                      ),

                                      Text(
                                        'Guru',
                                        style: TextStyle(
                                          color:
                                              Colors.white60,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // CONTENT
                Expanded(
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text(
                        title,
                        style: const TextStyle(
                          fontWeight:
                              FontWeight.w800,
                        ),
                      ),
                      actions: actions,
                    ),

                    body: child,
                  ),
                ),
              ],
            ),
          );
        }

        // ================================
        // MOBILE
        // ================================
        return Scaffold(
          appBar: AppBar(
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
            actions: actions,
          ),

          body: child,

          bottomNavigationBar:
              NavigationBar(
            selectedIndex: selectedIndex,

            onDestinationSelected:
                (index) =>
                    _go(context, index),

            destinations: const [
              NavigationDestination(
                icon:
                    Icon(Icons.home_rounded),
                label: 'Home',
              ),

              NavigationDestination(
                icon: Icon(
                  Icons.bar_chart_rounded,
                ),
                label: 'Laporan',
              ),

              NavigationDestination(
                icon:
                    Icon(Icons.person_rounded),
                label: 'Profil',
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SideItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _SideItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 8),

      child: Material(
        color: selected
            ? AppColors.primary
            : Colors.transparent,

        borderRadius:
            BorderRadius.circular(14),

        child: InkWell(
          onTap: onTap,

          borderRadius:
              BorderRadius.circular(14),

          child: Padding(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 13,
            ),

            child: Row(
              children: [
                Icon(
                  icon,
                  color: selected
                      ? Colors.white
                      : Colors.white70,
                ),

                const SizedBox(width: 12),

                Text(
                  label,
                  style: TextStyle(
                    color: selected
                        ? Colors.white
                        : Colors.white70,
                    fontWeight: selected
                        ? FontWeight.w700
                        : FontWeight.w500,
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