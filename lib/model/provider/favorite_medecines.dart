import 'package:login_signup/model/provider/base_provider.dart';
import 'package:login_signup/model/response/medicine_model.dart';

class FavoriteMadecines extends BaseProvider {
  final List<MedicineModel> _favoriteMadecines = [];
  List<MedicineModel> get medicineModel => _favoriteMadecines;
  void toggleFavorite(MedicineModel medicineModel) {
    final isExist = _favoriteMadecines.contains(medicineModel);
    if (isExist) {
      _favoriteMadecines.remove(medicineModel);
    } else {
      _favoriteMadecines.add(medicineModel);
    }
    notifyListeners();
  }

  bool isExist(MedicineModel medicineModel) {
    final isExist = _favoriteMadecines.contains(medicineModel);
    return isExist;
  }
  
}
