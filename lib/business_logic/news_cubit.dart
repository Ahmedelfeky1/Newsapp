import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:newset/data/model/news_model.dart';
import '../data/servies/api_services.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  int selectedCategoryIndex = 0;
  ApiServies apiServies = ApiServies();
  List<NewsModel> newsList = [];
  List<NewsModel> searchList = [];

  getNewsData(String categories,{int? index}) {
    if(index!=null){
      selectedCategoryIndex = index;
    }
    emit(NewsLoading());
    apiServies
        .getTopHeadlines()
        .then((value) {
      newsList = value;
      emit(NewsSuccess());
    })
        .catchError((error) {
      emit(NewsError(error.toString()));
    });
  }

  getSearchData(String query) {
    emit(NewsLoading());
    apiServies.searchNews(q: query).then((value) {
      searchList = value;
      emit(NewsSuccess());
    }).catchError((onError) {
      emit(NewsError(onError.toString()));
    });
  }
static NewsCubit get(context)=>BlocProvider.of(context);

}
