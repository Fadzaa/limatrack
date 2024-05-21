import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/common/theme.dart';
import 'faq_page_controller.dart';

class FaqPageView extends GetView<FaqPageController> {
  FaqPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             Obx(() => ExpansionPanelList(
               children: [
                 ExpansionPanel(
                     headerBuilder: (context, isOpen) {
                       return Text("Test");
                     },
                     body: Text("Test Body"),
                     isExpanded: controller.singleOpen.value
                 )
               ],
               expansionCallback: (index, isOpen) {
                 // controller.toggle(index, isOpen);
                 controller.singleOpen.value = !controller.singleOpen.value;
               },
             ))
            ],
          ),
        ),
      ),
      backgroundColor: baseColor,
    );
  }
}