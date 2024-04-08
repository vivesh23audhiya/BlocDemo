import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit(): super(0);

  void incrementCount(){
    emit(state + 1);
  }
  void decrementCount(){
    if(state == 0){
      return;
    }
    emit(state - 1);
  }
}
