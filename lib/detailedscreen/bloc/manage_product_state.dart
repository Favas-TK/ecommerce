part of 'manage_product_bloc.dart';

@immutable
abstract class ManageProductState {}

class ManageProductInitial extends ManageProductState {}

class ProductDeletedSuccess extends ManageProductState{}
