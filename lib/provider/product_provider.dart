import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
import 'package:thetazero/model/product_model.dart';

class ProductProvider with ChangeNotifier {
   ProductModal? _productModal;
  ProductModal? get productModal => _productModal;

  bool _loading = false;
  get loading => _loading;
  setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  getProduct() async {
    const urlData =
        "http://pg.dailefresh.com/WebApi/ListProductByCategoryorSubCategory_Page?Cat=FNV&Sub=FV&StoreId=1&User_id=1&R_Number=1";
    setLoading(true);
    try {
      final response = await http.get(
        Uri.parse(urlData),
      );
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        print(jsonData);
        ProductModal resultData = ProductModal.fromJson(jsonData);

        _productModal = resultData;
        print(_productModal);

        setLoading(false);
        notifyListeners();
      } else {
        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
      print(e);
    }
  }
}
