import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpapertask/wallpapers/core/utiles/context_extension.dart';

class NoDataPage extends StatelessWidget {
  const NoDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height / 7),
      child: Column(children: [
        SvgPicture.asset(
          "assets/images/404 NotFound.svg",
          height: context.height / 3,
        ),
        Text("Oops ! No favorites to display",
            style: Theme.of(context).textTheme.titleLarge),
      ]),
    );
  }
}
