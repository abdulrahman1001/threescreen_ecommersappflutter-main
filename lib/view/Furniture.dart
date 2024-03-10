import 'package:flutter/material.dart';
import 'package:rakaya_challange/servies/test.dart';
import 'package:rakaya_challange/widgets/custembuttonfupage.dart';
import 'package:rakaya_challange/widgets/custom_appbar.dart';
import 'package:rakaya_challange/widgets/imge_furstore.dart';

class Furntiure_page extends StatelessWidget {
  const Furntiure_page({super.key});
// add drawer widget to sort button
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: CustomAppBar(title: 'FURNTIURE'),
      body: Column(
        children: [
          MaterialButtonFirstPage(),
          Spacer(
            flex: 1,
          ),
          build_item_infromtion(),
          Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}

