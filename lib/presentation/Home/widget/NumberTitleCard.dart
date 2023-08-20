import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../widgets/Title.dart';
import 'Number_Card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainTitle(title: 'Top 10 TV Shows In India Today'),
          kHeight,
          LimitedBox(
            maxHeight: 150,
            child: ScrollConfiguration(
              behavior: const ScrollBehavior(),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Number_Card(
                      index: index,
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return SizedBox(
                      width: 7,
                    );
                  },
                  itemCount: 10),
            ),
          ),
        ],
      ),
    );
  }
}
