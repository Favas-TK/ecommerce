import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'manage_product_event.dart';
part 'manage_product_state.dart';

class ManageProductBloc extends Bloc<ManageProductEvent, ManageProductState> {
  ManageProductBloc() : super(ManageProductInitial()) {
    on<ManageProductEvent>((event, emit) async {
      if (event is DeleteProductEvent) {
        try {
          final productRef =
              FirebaseFirestore.instance.collection('product_data');
          await productRef.doc(event.productId).delete();
        } catch (e) {
          emit(ProductDeletedSuccess());
        }
      }
    });
  }
}
