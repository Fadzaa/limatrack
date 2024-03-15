import 'package:flutter/material.dart';
import 'package:limatrack_genetic/common/constant.dart';

import 'profile.dart';

List<Profile> list_profile = [
  Profile(
      color: const Color(0xFF6149C3).withOpacity(0.1),
      icon: icBookmarkProfile,
      name: "LanggananKu",
      isDarkMode: false
  ),
  Profile(
      color: const Color(0xFFFFC700).withOpacity(0.1),
      icon: icQuestion,
      name: "FAQ",
      isDarkMode: false
  ),
  Profile(
      color: const Color(0xFFF654AE).withOpacity(0.1),
      icon: icPrivacy,
      name: "Kebijakan Privasi",
      isDarkMode: false
  ),
  Profile(
      color: const Color(0xFF0FA958).withOpacity(0.1),
      icon: icDarkMode,
      name: "Tema Gelap",
      isDarkMode: true
  ),
];