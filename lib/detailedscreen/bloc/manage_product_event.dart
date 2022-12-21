part of 'manage_product_bloc.dart';

@immutable
abstract class ManageProductEvent {}

class DeleteProductEvent extends ManageProductEvent {
  DeleteProductEvent({required this.productId});
  final String productId;
}
