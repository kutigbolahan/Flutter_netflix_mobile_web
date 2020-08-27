import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class AppBarCubit extends Cubit<double> {
  AppBarCubit() : super(0);
  void setOffset(double offset) => emit(offset);
}
