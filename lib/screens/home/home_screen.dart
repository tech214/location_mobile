import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../components/widgets/cityCard.dart';
import '../../components/city_item.dart';
import '../../components/custom_image.dart';
import '../../components/feature_item.dart';
import '../../components/recommend_item.dart';
import '../../components/theme/color.dart';
import '../../components/utils/data.dart';
import '../../themes/app_theme.dart';
import '../home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: AppColor.appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: Text(
              "Welcome",
              style: TextStyle(color: Colors.black),
            ),
            foregroundColor: Colors.amber,
            iconTheme: IconThemeData(color: Colors.red), // Couleur de l'icône de retour
          ),
          SliverToBoxAdapter(

            child: _buildBody(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(() => const HomePage());
        },
        tooltip: 'onTap',
        child: const Icon(Icons.add),
      ),
    );
  }


  Widget _buildBody() {
    return DefaultTabController(
      length: 5,
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligner tout à gauche
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20),
              child: Text(
                "Categories",
                style: TextStyle(
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TabBar(
              isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.blue,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30), // Coins arrondis pour l'indicateur
                color: AppThemes.backgroundColorDark, // Couleur de fond de l'indicateur
              ),
              tabAlignment: TabAlignment.start,
              tabs: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Bordure des onglets non sélectionnés
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50), // Bordure arrondie
                  ),
                  child: const Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // Pour éviter l'overflow
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.all_inclusive,
                          size: 20, // Ajustez la taille de l'icône si nécessaire
                        ),
                        SizedBox(width: 5), // Espace entre l'icône et le texte
                        Text(
                          "All",
                          style: TextStyle(fontSize: 14), // Ajustez la taille du texte
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50, // Hauteur uniforme
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Popular",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.villa,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Villas",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.hotel,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Hotel",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.apartment,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Appartement",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildAll(),
                  _buildPopular(),
                  _buildLogement(),
                  _buildFeatured(),
                  _getRecommend(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildAll() {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(), // Permet le défilement
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'Recommended for you',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20,),

        _getRecommend(),
        _buildCity(),
        const SizedBox(height: 20,),

        // Logements en vedette
        _buildFeaturedStays(),
        const SizedBox(height: 20,),

        // Destinations populaires
        _buildPopularDestinations(),
        const SizedBox(height: 20,),

        // Offres spéciales
        _buildSpecialOffers(),
        const SizedBox(height: 120,),
      ],
    );
  }

  Widget _buildFeaturedStays() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Featured Stays',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/phil-hearing-IYfp2Ixe9nM-unsplash.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Luxury Apartment",
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget _buildPopularDestinations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Popular Destinations',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/stephan-bechert-yFV39g6AZ5o-unsplash.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Paris",
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget _buildSpecialOffers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Special Offers',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage("assets/images/todd-kent-178j8tJrNlc-unsplash.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Get 20% off on your first booking!",
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }






  Widget _buildCity() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Défilement horizontal
        itemCount: 7,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Hero(
                tag: "city_$index",
                child: Container(
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/jacques-bopp-Hh18POSx5qk-unsplash.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Stack(
                    children: <Widget>[
                      Positioned(
                        left: 10,
                        bottom: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Titre", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            Text("Description", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }







  Widget _buildLogement() {
    return MasonryGridView.builder(
      itemCount: 6,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                  "assets/images/florian-schmidinger-b_79nOqf95I-unsplash.jpg",
              )
          ),
        ),
      ),

    );
  }


  Widget _buildPopular() {
    return const Center(
      child: Text(
        "Popular Content",
        style: TextStyle(fontSize: 18, color: AppColor.textColor),
      ),
    );
  }



  _getRecommend() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          recommends.length,
              (index) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: RecommendItem(
              data: recommends[index],
            ),
          ),
        ),
      ),
    );
  }

  _buildFeatured() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .75,
      ),
      items: List.generate(
        features.length,
            (index) => FeatureItem(
          data: features[index],
          onTapFavorite: () {
            setState(() {
              features[index]["is_favorited"] =
              !features[index]["is_favorited"];
            });
          },
        ),
      ),
    );
  }

  _buildCities() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 5, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          cities.length,
              (index) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CityItem(
              data: cities[index],
            ),
          ),
        ),
      ),
    );
  }

}


class TabBarWithChoiceChip extends StatefulWidget {
  @override
  _TabBarWithChoiceChipState createState() => _TabBarWithChoiceChipState();
}

class _TabBarWithChoiceChipState extends State<TabBarWithChoiceChip> {
  int _selectedIndex = 0;

  List<Map<String, dynamic>> categories = [
    {'label': 'All', 'icon': Icons.all_inclusive},
    {'label': 'Popular', 'icon': Icons.star},
    {'label': 'Villas', 'icon': Icons.villa},
    {'label': 'Hotel', 'icon': Icons.hotel},
    {'label': 'Appartement', 'icon': Icons.apartment},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(categories.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ChoiceChip(
              label: Row(
                children: [
                  Icon(
                    categories[index]['icon'],
                    color: _selectedIndex == index ? Colors.white : Colors.blue,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    categories[index]['label'],
                    style: TextStyle(
                      color: _selectedIndex == index
                          ? Colors.white
                          : Colors.blue,
                    ),
                  ),
                ],
              ),
              selected: _selectedIndex == index,
              selectedColor: Colors.blue,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(
                  color: _selectedIndex == index ? Colors.blue : Colors.grey,
                  width: 2,
                ),
              ),
              onSelected: (bool selected) {
                setState(() {
                  _selectedIndex = selected ? index : _selectedIndex;
                });
              },
            ),
          );
        }),
      ),
    );
  }
}
