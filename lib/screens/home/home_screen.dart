import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../components/notification_box.dart';
import '../../components/recommend_item.dart';
import '../../components/searchBar.dart';
import '../../components/theme/color.dart';
import '../../models/data.dart';
import '../../themes/app_theme.dart';
import '../FeaturedScreen.dart';
import '../PopularScreen.dart';
import '../RecommandedScreen.dart';
import '../details/appartement_details_screen.dart';
import '../details/hotel_details_screen.dart';
import '../details/logement_details_screen.dart';
import '../details/villa_details_screen.dart';
import '../notificationScreen.dart';

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

          SliverAppBar(
            backgroundColor: AppColor.appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: _builAppBar(),
          ),
          SliverToBoxAdapter(
            child: _buildBody(),
          ),
        ],
      ),

    );
  }


  Widget _builAppBar() {
    return  Row(
      children: [
        const Icon(
          Icons.place_outlined,
          color: AppColor.labelColor,
          size: 20,
        ),
        const SizedBox(
          width: 3,
        ),
        const Text(
          "Kipe",
          style: TextStyle(
            color: AppColor.darker,
            fontSize: 13,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: (){
            Get.to(() => const NotificationsPage());
          },
          child: const NotificationBox(
            notifiedNumber: 1,
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
    return DefaultTabController(
      length: 6,
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
              child: SearchField(),
            ),
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

            // TABBAR
            TabBar(
              isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.blue,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppThemes.backgroundColorDark,
              ),
              tabAlignment: TabAlignment.start,
              tabs: [
                // Tab All
                Container(
                  height: 35,  // Hauteur réduite pour rendre la Tab plus petite
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.all_inclusive, size: 18),  // Icône plus petite
                        SizedBox(width: 6),  // Espacement plus petit
                        Text("All", style: TextStyle(fontSize: 12)),  // Texte plus petit
                      ],
                    ),
                  ),
                ),
                // Tab Popular
                Container(
                  height: 35,  // Hauteur réduite
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, size: 18),  // Icône plus petite
                        SizedBox(width: 6),  // Espacement plus petit
                        Text("Popular", style: TextStyle(fontSize: 12)),  // Texte plus petit
                      ],
                    ),
                  ),
                ),

                // Tab Logement
                Container(
                  height: 35,  // Hauteur réduite
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.villa, size: 18),  // Icône plus petite
                        SizedBox(width: 6),  // Espacement plus petit
                        Text("Location", style: TextStyle(fontSize: 12)),  // Texte plus petit
                      ],
                    ),
                  ),
                ),

                // Tab Villas
                Container(
                  height: 35,  // Hauteur réduite
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.villa, size: 18),  // Icône plus petite
                        SizedBox(width: 6),  // Espacement plus petit
                        Text("Villas", style: TextStyle(fontSize: 12)),  // Texte plus petit
                      ],
                    ),
                  ),
                ),

                // Tab Hotel
                Container(
                  height: 35,  // Hauteur réduite
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       SvgPicture.asset(
                           "assets/icons/hotel.svg",
                         height: 20,
                         width: 20,
                       ),  // Icône plus petite
                        const SizedBox(width: 6),  // Espacement plus petit
                        const Text("Hotel", style: TextStyle(fontSize: 12)),  // Texte plus petit
                      ],
                    ),
                  ),
                ),

                // Tab Appartement
                Container(
                  height: 35,  // Hauteur réduite
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.apartment, size: 18),  // Icône plus petite
                        SizedBox(width: 6),  // Espacement plus petit
                        Text("Appartement", style: TextStyle(fontSize: 12)),  // Texte plus petit
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // TABBARVIEW
            Expanded(
              child: TabBarView(
                children: [
                  _buildAll(),
                  _buildPopular(),
                  _buildLogement(),
                  _buildVilla(),
                  _buildHotel(),
                  _buildAppartement(),
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
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(5),
      children: [
        // Recommended
        _getRecommend(),
        const SizedBox(height: 20),
        // Featured Stays
        _buildFeaturedStays(),
        const SizedBox(height: 20),
        // Popular Destinations
        _buildPopularDestinations(),
        const SizedBox(height: 20),
        // Special Offers
        _buildSpecialOffers(),
        const SizedBox(height: 120),
      ],
    );
  }

  // LES TABS VIEWS
  Widget _buildPopular() {
    return MasonryGridView.builder(
      itemCount: 10,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: Duration(milliseconds: 500 + index * 100),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, (1 - value) * 20),
                child: child,
              ),
            );
          },
          child: Center(
            child: SizedBox(
              width: 300,
              child: Container(
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: Image.asset(
                            "assets/images/tierra-mallorca-rgJ1J8SDEAY-unsplash.jpg",
                            height: 160,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Positioned(
                          top: 8,
                          right: 8,
                          child: Icon(Icons.favorite_border, color: Colors.white),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Hôtel populaire & moderne",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 13, color: Colors.grey[600]),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  "Nice, France",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "98€/nuit",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 13,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star, size: 13, color: Colors.amber),
                                  SizedBox(width: 2),
                                  Text(
                                    "4.7",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              )
                            ],
                          ),
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
    );
  }

  Widget _buildVilla() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        Get.to(() => const VillaDetailsScreen());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          // Encapsulation du MasonryGridView avec Expanded
          Expanded(
            child: MasonryGridView.builder(
              itemCount: 16,
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        "assets/images/florian-schmidinger-b_79nOqf95I-unsplash.jpg",
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: const Icon(Icons.favorite_border),
                        color: Colors.white,
                        onPressed: () {
                          // action favori
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Villa moderne avec piscine",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.location_on, size: 13, color: Colors.white70),
                                SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    "Paris, France",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.white70,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "2 ch. • 1 sdb",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.white70,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, size: 13, color: Colors.amber),
                                    SizedBox(width: 2),
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "89€/nuit",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogement() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        Get.to(() => const LogementDetailsScreen());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: MasonryGridView.builder(
              itemCount: 16,
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        "assets/images/florian-schmidinger-b_79nOqf95I-unsplash.jpg",
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: const Icon(Icons.favorite_border),
                        color: Colors.white,
                        onPressed: () {
                          // action favori
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Villa moderne avec piscine",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.location_on, size: 13, color: Colors.white70),
                                SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    "Paris, France",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.white70,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "2 ch. • 1 sdb",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.white70,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, size: 13, color: Colors.amber),
                                    SizedBox(width: 2),
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "89€/nuit",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHotel() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        Get.to(() => const HotelDetailsScreen());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          // Enveloppement de MasonryGridView avec Expanded
          Expanded(
            child: MasonryGridView.builder(
              itemCount: 16,
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        "assets/images/florian-schmidinger-b_79nOqf95I-unsplash.jpg",
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: const Icon(Icons.favorite_border),
                        color: Colors.white,
                        onPressed: () {
                          // action favori
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Villa moderne avec piscine",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.location_on, size: 15, color: Colors.white70),
                                SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    "Paris, France",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white70,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "2 ch. • 1 sdb",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white70,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, size: 15, color: Colors.amber),
                                    SizedBox(width: 2),
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "89€/nuit",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppartement() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        Get.to(() => const ApartmentDetailsScreen());
      },
      child: MasonryGridView.builder(
        itemCount: 16,
        padding: const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 20),
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/images/johnson-johnson-U6Q6zVDgmSs-unsplash.jpg",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: const Icon(Icons.favorite_border),
                  color: Colors.white,
                  onPressed: () {
                    // action favori
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Appartement cosy en centre-ville",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 13, color: Colors.white70),
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              "Lyon, France",
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white70,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "1 ch. • 1 salon",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white70,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, size: 13, color: Colors.amber),
                              SizedBox(width: 2),
                              Text(
                                "4.2",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "65€/nuit",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  // LES ALL

  Widget _buildFeaturedStays() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const Text(
                'Featured Stays',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Get.to(() => FeaturedStaysPage(featured: features));
                },
                child: const Text("See all"),
              ),
            ],
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
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        bottom: 10,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5), // Fond semi-transparent
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Luxury Apartment",
                                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "\$150 per night",
                                style: TextStyle(color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.favorite_border, color: Colors.white),
                              onPressed: () {
                                // Logique pour ajouter aux favoris
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.bookmark, color: Colors.white),
                              onPressed: () {
                                // Logique pour réserver
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const Text(
                'Popular Destinations',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Get.to(() => PopularPage(populars: populars,));
                },
                child: const Text("See all"),
              ),
            ],
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
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        bottom: 10,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Paris",
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border, color: Colors.white),
                          onPressed: () {
                            // Logique pour ajouter aux favoris
                          },
                        ),
                      ),
                    ],
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
          child: Row(
            children: [
              Text(
                'Special Offers',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Spacer(),
            ],
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
          child: Stack(
            children: [
              Positioned(
                left: 10,
                bottom: 10,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Get 20% off on your first booking!",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.white),
                  onPressed: () {
                    // Logique pour ajouter aux favoris
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _getRecommend() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text(
                'Recommended for you',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Get.to(() => AllRecommendsPage(recommends: recommends));
                },
                child: const Text("See all"),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              recommends.length,
                  (index) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: RecommendItem(
                  data: recommends[index], // Utilisation de données fictives
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


}


class TabBarWithChoiceChip extends StatefulWidget {
  const TabBarWithChoiceChip({super.key});

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
