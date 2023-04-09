import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planetapp/layout/cubit/cubit.dart';
import 'package:planetapp/layout/cubit/states.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:planetapp/modules/favorites.dart';
import 'package:planetapp/modules/home.dart';
import 'package:planetapp/modules/sell.dart';
import 'package:planetapp/modules/settings.dart';

class Layout extends StatelessWidget {
  PageController pageController = PageController();

  Layout({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlanetCubit, PlanetStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PlanetCubit.get(context);
        return Scaffold(
            body: PageView(
                onPageChanged: (int index) {
                  cubit.current(index);
                },
                controller: pageController,
                physics: const BouncingScrollPhysics(),
                children: [
                  Home(),
                  const Favorites(),
                  const Sell(),
                  const Settings()
                ]),
            bottomNavigationBar: GNav(
              activeColor: Colors.green,
              onTabChange: (int index) {
                cubit.current(index);
                pageController.jumpToPage(index);
              },
              selectedIndex: cubit.currentIndex,
              duration: const Duration(milliseconds: 100),
              tabs: const [
                GButton(
                  icon: Icons.home,
                ),
                GButton(
                  icon: Icons.favorite,
                ),
                GButton(
                  icon: Icons.sell_outlined,
                ),
                GButton(
                  icon: Icons.settings,
                ),
              ],
              gap: 5,
            ));
      },
    );
  }
}
