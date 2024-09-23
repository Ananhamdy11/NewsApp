import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feautres/home/presentation/managers/news_cubit/cubit/news_cubit.dart';
import 'package:news_app/feautres/home/presentation/views/widgets/build_article_widget.dart';

class BussinessView extends StatelessWidget {
  const BussinessView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      builder: (context,state){

       if (state is NewsFailureSportsState) {
          // Explicit error handling for fetch failure
          return Center(
            child: Text('Failed to fetch sports news: ${state.error}'),
          );
        }else if (state is NewsSuccessBusinessState){
           var data=state.news;
          return ListView.separated(
            physics:const BouncingScrollPhysics(),
            itemBuilder: (context,index){
              var articls=data[index];
            return BuildArticleWidget(imageUrl:articls.imageUrl.toString(), title: articls.title.toString(), pubDate: articls.pubDate.toString());
            
          },separatorBuilder: (context,idex)=> Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey,
           
       ) ,
          itemCount: state.news.length); 
    }
    else{
      return const Center(child: CircularProgressIndicator());
    }
      },
       listener: (context,state){},
       
       );
  
  }
}

