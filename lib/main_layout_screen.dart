import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/constants/app_constants.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/features/home/presentation/view/screens/home_page.dart';
import 'package:movies/features/home/presentation/view_model/now_playing/now_playing_cubit.dart';
import 'package:movies/features/home/presentation/view_model/popular/popular_cubit.dart';
import 'package:movies/features/home/presentation/view_model/top_rated/top_rated_cubit.dart';
import 'package:movies/features/home/presentation/view_model/up_coming/up_coming_cubit.dart';
import 'package:movies/features/search/presentation/model_view/search/search_cubit.dart';
import 'package:movies/features/search/presentation/view/screens/search_page.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int selectIndex = 0;
  final List<Widget> categories = [
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NowPlayingCubit()),
        BlocProvider(create: (context) => PopularCubit()),
        BlocProvider(create: (context) => UpComingCubit()),
        BlocProvider(create: (context) => TopRatedCubit()),
      ],
      child: HomePage(),
    ),
    BlocProvider(create: (context) => SearchCubit(), child: SearchPage()),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: categories[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectIndex = value;
          });
        },
        currentIndex: selectIndex,
        backgroundColor: AppColors.primary,
        selectedItemColor: AppColors.myBlue,
        unselectedItemColor: AppColors.textSecondary,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 30),
            label: AppConstants.homeBottomNavigationBar,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30),
            label: AppConstants.search,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border, size: 30),
            label: AppConstants.watchListBottomNavigationBar,
          ),
        ],
      ),
    );
  }
}
