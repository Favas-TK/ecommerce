part of 'add_product_bloc.dart';

@immutable
abstract class AddProductEvent {}

class ProductAddEvent extends AddProductEvent {
  ProductAddEvent({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
  final String name;
  final String description;
  final double price;
  final XFile image;
}

