import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planetapp/components/components.dart';
import 'package:planetapp/layout/cubit/cubit.dart';
import 'package:planetapp/layout/cubit/states.dart';
import 'package:planetapp/modules/details.dart';

class Home extends StatelessWidget {
  PageController page = PageController(viewportFraction: 0.7);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlanetCubit, PlanetStates>(
        builder: (context, state) {
          var cubit = PlanetCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: TextButton(
                  onPressed: () {},
                  child: Image.asset(
                    "assets/icons/menu.png",
                    height: 30,
                    width: 28,
                  )),
              actions: [
                Container(
                  width: 40,
                  height: 80,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8)),
                  child: Image.asset("assets/images/pro.png"),
                )
              ],
            ),
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 2, right: 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(color: Colors.green, blurRadius: 3)
                                ],
                                border: Border.all(
                                    color: Colors.green.withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Search"),
                                  ),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Image.asset(
                                  "assets/icons/search.png",
                                  height: 25,
                                  width: 25,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          width: 45,
                          height: 50,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(color: Colors.green, blurRadius: 5)
                              ],
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8)),
                          child: Image.asset(
                            "assets/icons/adjust.png",
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      // color: Colors.red,
                      width: double.infinity,
                      height: 30,
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 0;
                                    i < cubit.categories.length;
                                    i++)
                                  GestureDetector(
                                    onTap: () {
                                      cubit.currentOfType(i);
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          cubit.categories[i].name,
                                          style: TextStyle(
                                              color: cubit.change["$i"] == true
                                                  ? Colors.green
                                                  : Colors.black
                                                      .withOpacity(0.5),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        if (cubit.change["$i"] == true)
                                          const CircleAvatar(
                                            radius: 3,
                                            backgroundColor: Colors.green,
                                          ),
                                      ],
                                    ),
                                  ),
                              ])
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 320,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: 10, bottom: 10, start: 8),
                      child: PageView.builder(
                        itemBuilder: (context, index) => animatedContainer(
                            image: cubit.plants[index].imagePath,
                            icon: "assets/icons/add.png",
                            // index:cubit.plants[index],
                            context: context,
                            widget: Details(
                              plants: cubit.plants[index],
                            ),
                            plants:
                                index == cubit.plants.length - 1 ? true : false,
                            text:
                                "${cubit.plants[index].name}-${cubit.plants[index].price.toInt().toString()}\$"),
                        itemCount: cubit.plants.length,
                        onPageChanged: (v) {},
                        padEnds: false,
                        pageSnapping: true,
                        physics: const BouncingScrollPhysics(),
                        controller: page,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Image.asset(
                          'assets/icons/more.png',
                          color: Colors.green,
                          height: 22,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8, top: 8),
                    child: Container(
                      height: 180,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => containerPopular(
                            image: cubit.populerPlants[index].imagePath,
                            icon: "assets/icons/add.png",
                            text2:
                                "${cubit.plants[index].price.toInt().toString()}\$",
                            text: cubit.plants[index].name),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                        itemCount: cubit.populerPlants.length,
                      ),
                    ),
                  )
                ],
              ),
            )),
          );
        },
        listener: (context, state) {});
  }
}
