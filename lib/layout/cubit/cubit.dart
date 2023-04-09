import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planetapp/layout/cubit/states.dart';
import 'package:planetapp/models/categories.dart';
import 'package:planetapp/models/plants.dart';

class PlanetCubit extends Cubit<PlanetStates> {
  PlanetCubit() : super(PlanetInitialStates());
  static PlanetCubit get(context) => BlocProvider.of(context);
  List<Plants> plants = [
    Plants(
      id: 0,
      name: 'Succuient',
      imagePath: 'assets/images/image1.jpg',
      category: 'Office',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
      price: 75.00,
      isFavorit: false,
    ),
    Plants(
      id: 1,
      name: 'Succuient',
      imagePath: 'assets/images/image2.jpg',
      category: 'Office',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
      price: 75.00,
      isFavorit: false,
    ),
    Plants(
      id: 2,
      name: 'Ficus retusa',
      imagePath: 'assets/images/image3.jpg',
      category: 'Office',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
      price: 60.00,
      isFavorit: false,
    ),
    Plants(
      id: 3,
      name: 'Ficus retusa',
      imagePath: 'assets/images/image5.jpg',
      category: 'Office',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
      price: 90.00,
      isFavorit: false,
    ),
  ];

  List<Plants> populerPlants = [
    Plants(
      id: 0,
      name: 'Succuient',
      imagePath: 'assets/images/01.png',
      category: 'Office',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
      price: 75.00,
      isFavorit: false,
    ),
    Plants(
      id: 1,
      name: 'Succuient',
      imagePath: 'assets/images/02.png',
      category: 'Office',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
      price: 75.00,
      isFavorit: false,
    ),
    Plants(
      id: 2,
      name: 'Ficus retusa',
      imagePath: 'assets/images/03.png',
      category: 'Office',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
      price: 60.00,
      isFavorit: false,
    ),
  ];
  int currentIndex = 0;
  void current(int index) {
    currentIndex = index;
    emit(PlanetIndexStates());
  }

  int index = 0;
  Map<String, bool> change = {};
  void fillMap() {
    for (int i = 0; i < categories.length; i++) {
      if (i == 0) {
        change.addAll({"0": true});
      } else {
        change.addAll({"$i": false});
      }
    }
    emit(PlanetFillMapStates());
  }

  void currentOfType(int i) {
    // if (e == "$index") {
    change.update("$i", (value) => true);
    change.keys.forEach((e) {
      if (e != "$i") {
        change.update(e, (value) => false);
      }
    });
    emit(PlanetIndexTypeStates());
    // }
  }

  List<Category> categories = [
    Category(0, 'All'),
    Category(1, 'Outdoor'),
    Category(2, 'Indoor'),
    Category(3, 'Office'),
    Category(4, 'Garden'),
  ];
}
