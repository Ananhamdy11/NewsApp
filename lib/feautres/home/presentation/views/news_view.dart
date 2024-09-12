import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feautres/home/presentation/managers/news_cubit/cubit/news_cubit.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          // TODO: implement listener
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
                    )
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