import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feautres/home/presentation/managers/news_cubit/cubit/news_cubit.dart';
import 'package:news_app/feautres/home/presentation/views/widgets/build_article_widget.dart';

class EntertainView extends StatelessWidget {
  const EntertainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      builder: (context,state){

        if (state is NewsFailureEntertainState){
        return Text(state.error);
        }else if (state is NewsSuccessEntertainState){
           var data=state.news;
          return ListView.separated(
            physics:const  BouncingScrollPhysics(),
            itemBuilder: (context,index){
              var articls=data[index];
            return BuildArticleWidget(imageUrl:articls.imageUrl.toString(), title: articls.title.toString(), pubDate: articls.pubDate.toString());
            
          },separatorBuilder: (context,idex)=> Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey,
           
       ) ,
          itemCount: state.news.length); 
    }else{
      return const Center(child: CircularProgressIndicator());
    }
    
      },
       listener: (context,state){},
       
       );
  
  }
}
