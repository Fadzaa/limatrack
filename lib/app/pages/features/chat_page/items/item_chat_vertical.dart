import 'package:flutter/material.dart';
import 'package:limatrack_genetic/common/theme.dart';

class ItemChatVertical extends StatelessWidget {
  const ItemChatVertical({
    super.key,
    required this.image,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unread,
    required this.unreadCount
  });

  final String image, name, lastMessage, time;
  final bool unread;
  final int unreadCount;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
                shape: BoxShape.circle
            ),
          ),

          const SizedBox(width: 15,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: tsBodyMedium.copyWith(
                  fontWeight: FontWeight.w600
              ),),

              const SizedBox(height: 5,),

              Text(lastMessage, style: tsLabelLarge),
            ],
          ),

          const Spacer(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(time, style: tsBodySmall.copyWith(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFBABABA)
              ),),

              const SizedBox(height: 5,),

              if(unread)
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(
                    child: Text(unreadCount.toString(), style: tsLabelLarge.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),),
                  ),
                )
            ],
          )


        ],
      ),
    );
  }
}
