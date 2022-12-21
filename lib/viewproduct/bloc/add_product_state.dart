part of 'add_product_bloc.dart';

@immutable
abstract class AddProductState {}

class AddProductInitial extends AddProductState {}

class ProductAddedSuccess extends AddProductState {}

class ProductAddedFailed extends AddProductState{
// ProductAddedFailed({required this.errormessage});
//   String errormessage;
}


