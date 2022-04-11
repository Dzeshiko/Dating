import 'package:dating/domain/state/dating/dating_state.dart';
import 'package:dating/presentation/screen/dating/pages/dating_first_page.dart';
import 'package:dating/presentation/screen/dating/pages/dating_grid_page.dart';
import 'package:dating/presentation/screen/dating/pages/dating_last_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DatingScreen extends StatelessWidget {
  const DatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DatingState state = Provider.of<DatingState>(context);

    return PageView(
      scrollDirection: Axis.vertical,
      controller: state.datingPageController,
      physics: const AlwaysScrollableScrollPhysics(),
      children: <Widget>[
        const DatingFirstPage(),
        for (int i = 1; i <= 7; i++)
          DatingGridPage(
            cid: i,
          ),
        const DatingLastPage(),
      ],
    );
  }
}
