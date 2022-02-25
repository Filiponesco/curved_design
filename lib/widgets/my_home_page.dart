import 'package:curve_design/paddings.dart';
import 'package:curve_design/widgets/items.dart';
import 'package:curve_design/widgets/list_header.dart';
import 'package:curve_design/widgets/productivity_card.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: Paddings.mainPadding,
          child: CustomScrollView(
            slivers: [
              SliverPadding(padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top)),
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 60.0),
                      child: ProductivityCard(),
                    ),
                    Positioned(
                      left: 0.0,
                      right: 0.0,
                      top: 50,
                      child: Align(
                        alignment: const Alignment(-.6, 0),
                        child: Transform.rotate(
                            angle: -.7,
                            child: Image.asset(
                              'assets/chat.png',
                              height: 44.0,
                            )),
                      ),
                    ),
                    Positioned(
                      top: 10.0,
                      left: 0.0,
                      right: 0.0,
                      child: Align(
                        alignment: const Alignment(-.1, 0),
                        child: Image.asset(
                          'assets/thunderbolt.png',
                          height: 34.0,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40.0,
                      right: 0.0,
                      left: 0.0,
                      child: Align(
                        alignment: const Alignment(.6, 0),
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: Image.asset(
                              'assets/basketball-ball.png',
                            ).image),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: ListHeader()),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return items[index];
                  },
                  childCount: items.length,
                ),
              ),
              SliverPadding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom + 60)),
            ],
          )),
    );
  }
}
