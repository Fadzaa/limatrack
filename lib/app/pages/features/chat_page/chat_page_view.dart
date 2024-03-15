import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/chat_page/items/item_chat_vertical.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';
import 'chat_page_controller.dart';

class ChatPageView extends GetView<ChatPageController> {
  const ChatPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Text("Chat", style: tsTitleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: blackColor
                ),),

                const SizedBox(height: 15,),

                SizedBox(
                  height: 40,
                  child: TextField(
                    style: tsBodySmall.copyWith(
                        fontWeight: FontWeight.w500,
                        color: blackColor
                    ),
                    decoration: InputDecoration(
                        contentPadding:  EdgeInsets.only(left: 20),
                        hintText: "Cari Nama Pedagang...",
                        hintStyle: tsBodySmall.copyWith(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF808383)
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                        ),
                        filled: true,
                        fillColor: const Color(0xFF707070).withOpacity(0.1)
                    ),
                  ),
                ),

                const SizedBox(height: 20,),

                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) =>
                        ItemChatVertical(
                            image: exampleJajanRectangle,
                            name: "Waroenk Obenk",
                            lastMessage: "P Balap",
                            time: "02.10",
                            unread: true,
                            unreadCount: 2
                        )
                )


              ],
            ),
          ),
        ),
      )
    );
  }
}
