import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:limatrack_genetic/app/api/auth/model/user.dart';
import 'package:limatrack_genetic/app/api/auth/model/user_response.dart';
import 'package:limatrack_genetic/app/api/auth/service/authentication_service.dart';
import 'package:limatrack_genetic/app/pages/features/chat_page/chat_page_view.dart';
import 'package:limatrack_genetic/app/pages/features/explore_page/explore_page_view.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/home_page_view.dart';
import 'package:limatrack_genetic/app/pages/features/order_page/order_page_view.dart';
import 'package:limatrack_genetic/app/pages/features/profile_page/profile_page_view.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  RxBool isLoadingUser = true.obs;

  late AuthenticationService authenticationService;
  late UserResponse userResponse;
  UserModel? user;

  RxString namaLengkap = "".obs;
  RxString email = "".obs;


  @override
  void initState() {
    authenticationService = AuthenticationService();
    userResponse = UserResponse();
    showCurrentUser();
    super.initState();
  }


  Future showCurrentUser() async {
    try {
      final response = await authenticationService.showCurrentUser();
      namaLengkap.value = response.data['data']['nama_lengkap'];
      email.value = response.data['data']['email'];
    } catch (e) {
      isLoadingUser.value = true;
      print(e);
    } finally {
      isLoadingUser.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {

    final tabs = [
      HomePageView(namaLengkap: namaLengkap, isLoadingUser: isLoadingUser),
      const ExplorePageView(),
      const OrderPageView(),
      const ChatPageView(),
      ProfilePageView(namaLengkap: namaLengkap, email: email, isLoadingUser: isLoadingUser,)
    ];

    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(icHome),
            activeIcon: SvgPicture.asset(icHomeActive),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(icExplore),
            activeIcon: SvgPicture.asset(icExploreActive),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(icOrder),
            activeIcon: SvgPicture.asset(icOrderActive),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(icChat),
            activeIcon: SvgPicture.asset(icChatActive),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(icPerson),
            activeIcon: SvgPicture.asset(icPersonActive),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedLabelStyle: tsLabelLarge.copyWith(
            fontWeight: FontWeight.w500,
            color: const Color(0xFF707070).withOpacity(0.5)
        ),
        selectedLabelStyle: tsLabelLarge.copyWith(
          fontWeight: FontWeight.w500,
          color: primaryColor
        ),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
