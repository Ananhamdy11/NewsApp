import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feautres/home/presentation/managers/news_cubit/cubit/news_cubit.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => NewsCubit()..fetchBusinessNews()..fetchSportsNews()..fetchEntertainmentNews(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          var cubit=NewsCubit.get(context);
          return Scaffold(
          
                appBar: AppBar(
                  title:const Text('News App'),
                  actions: [
                    IconButton(
                      onPressed: (){}, 
                    icon:const Icon(Icons.search)
                    ),
                    IconButton(
                      onPressed: (){
                        NewsCubit.get(context).changeAppMode();
                      }, 
                    icon:const Icon(Icons.brightness_4_outlined)
                    ),
                  ],
                ),
                body: cubit.screens[cubit.currentIndex],
                bottomNavigationBar: BottomNavigationBar(
                  items: cubit.bottomItems,
                  currentIndex: cubit.currentIndex,
                  onTap: (index){
                    cubit.changeIndexBottomBar(index);

                  },
         )
          
          );
        },
      ),
    );
  }
}