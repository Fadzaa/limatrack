import 'package:flutter/material.dart';
import 'package:limatrack_genetic/app/router/app_pages.dart';
import 'package:limatrack_genetic/common/constant.dart';

import 'profile.dart';

List<Profile> list_profile = [
  Profile(
      color: const Color(0xFF6149C3).withOpacity(0.1),
      icon: icBookmarkProfile,
      name: "LanggananKu",
      routes: Routes.LANGGANAN_PAGE,
      isDarkMode: false
  ),
  Profile(
      color: const Color(0xFFFFC700).withOpacity(0.1),
      icon: icQuestion,
      name: "FAQ",
      routes: Routes.FAQ_PAGE,
      isDarkMode: false
  ),
  Profile(
      color: const Color(0xFFF654AE).withOpacity(0.1),
      icon: icPrivacy,
      name: "Kebijakan Privasi",
      routes: Routes.HOME_PAGE,
      isDarkMode: false
  ),
  Profile(
      color: const Color(0xFF0FA958).withOpacity(0.1),
      icon: icDarkMode,
      name: "Tema Gelap",
      routes: "ffadskfkjl",
      isDarkMode: true
  ),
];