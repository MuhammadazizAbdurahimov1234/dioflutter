import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:dioflutter/model/post.dart';
import 'package:meta/meta.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  NetworkCubit() : super(NetworkInitial());
  Dio dio= Dio();

  void yuklash()async{
    emit(NetworkLoading());
    try{
      var response = await dio.get("https://jsonplaceholder.typicode.com/posts");
      if(response.statusCode==200){
        emit(NetworkSuccess(listFromJson(response.data)));
      }
    } on DioException catch(e){
      emit(NetworkErorr(e.toString()));
    }
  }

}
