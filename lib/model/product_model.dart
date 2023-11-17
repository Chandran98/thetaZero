// To parse this JSON data, do
//
//     final productModal = productModalFromJson(jsonString);

import 'dart:convert';

ProductModal productModalFromJson(String str) => ProductModal.fromJson(json.decode(str));

String productModalToJson(ProductModal data) => json.encode(data.toJson());

class ProductModal {
    List<Datum> data;
    String responseCode;
    String responseMessage;

    ProductModal({
        required this.data,
        required this.responseCode,
        required this.responseMessage,
    });

    factory ProductModal.fromJson(Map<String, dynamic> json) => ProductModal(
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
        responseCode: json["ResponseCode"],
        responseMessage: json["ResponseMessage"],
    );

    Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
        "ResponseCode": responseCode,
        "ResponseMessage": responseMessage,
    };
}

class Datum {
    String discountValue;
    String discountFlag;
    String offerType;
    dynamic decrementFlag;
    int productId;
    String productName;
    String productSmallImg;
    bool wishlistFlag;
    bool subscriptionFlag;
    String productDescription;
    List<PriceList> priceList;
    List<dynamic> cartList;
    bool availabilityFlag;
    dynamic productMrp;
    dynamic pWeight;
    dynamic pWeightType;
    dynamic pSalePrice;
    int prodPriceId;
    int qty;
    int minValue;
    int maxValue;
    dynamic aboutProduct;
    dynamic productBenefits;
    dynamic storageUses;
    dynamic otherProductInfo;
    dynamic variableWeight;
    dynamic weightDetails;
    dynamic wPrice;
    dynamic wmrp;

    Datum({
        required this.discountValue,
        required this.discountFlag,
        required this.offerType,
        required this.decrementFlag,
        required this.productId,
        required this.productName,
        required this.productSmallImg,
        required this.wishlistFlag,
        required this.subscriptionFlag,
        required this.productDescription,
        required this.priceList,
        required this.cartList,
        required this.availabilityFlag,
        required this.productMrp,
        required this.pWeight,
        required this.pWeightType,
        required this.pSalePrice,
        required this.prodPriceId,
        required this.qty,
        required this.minValue,
        required this.maxValue,
        required this.aboutProduct,
        required this.productBenefits,
        required this.storageUses,
        required this.otherProductInfo,
        required this.variableWeight,
        required this.weightDetails,
        required this.wPrice,
        required this.wmrp,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        discountValue: json["DiscountValue"],
        discountFlag: json["DiscountFlag"],
        offerType: json["OfferType"],
        decrementFlag: json["DecrementFlag"],
        productId: json["product_id"],
        productName: json["product_name"],
        productSmallImg: json["product_small_img"],
        wishlistFlag: json["Wishlist_Flag"],
        subscriptionFlag: json["Subscription_Flag"],
        productDescription: json["ProductDescription"],
        priceList: List<PriceList>.from(json["PriceList"].map((x) => PriceList.fromJson(x))),
        cartList: List<dynamic>.from(json["CartList"].map((x) => x)),
        availabilityFlag: json["AvailabilityFlag"],
        productMrp: json["product_MRP"],
        pWeight: json["P_Weight"],
        pWeightType: json["P_Weight_type"],
        pSalePrice: json["P_SalePrice"],
        prodPriceId: json["prod_price_id"],
        qty: json["qty"],
        minValue: json["MinValue"],
        maxValue: json["MaxValue"],
        aboutProduct: json["AboutProduct"],
        productBenefits: json["ProductBenefits"],
        storageUses: json["StorageUses"],
        otherProductInfo: json["OtherProductInfo"],
        variableWeight: json["VariableWeight"],
        weightDetails: json["WeightDetails"],
        wPrice: json["WPrice"],
        wmrp: json["WMRP"],
    );

    Map<String, dynamic> toJson() => {
        "DiscountValue": discountValue,
        "DiscountFlag": discountFlag,
        "OfferType": offerType,
        "DecrementFlag": decrementFlag,
        "product_id": productId,
        "product_name": productName,
        "product_small_img": productSmallImg,
        "Wishlist_Flag": wishlistFlag,
        "Subscription_Flag": subscriptionFlag,
        "ProductDescription": productDescription,
        "PriceList": List<dynamic>.from(priceList.map((x) => x.toJson())),
        "CartList": List<dynamic>.from(cartList.map((x) => x)),
        "AvailabilityFlag": availabilityFlag,
        "product_MRP": productMrp,
        "P_Weight": pWeight,
        "P_Weight_type": pWeightType,
        "P_SalePrice": pSalePrice,
        "prod_price_id": prodPriceId,
        "qty": qty,
        "MinValue": minValue,
        "MaxValue": maxValue,
        "AboutProduct": aboutProduct,
        "ProductBenefits": productBenefits,
        "StorageUses": storageUses,
        "OtherProductInfo": otherProductInfo,
        "VariableWeight": variableWeight,
        "WeightDetails": weightDetails,
        "WPrice": wPrice,
        "WMRP": wmrp,
    };
}

class PriceList {
    int prodPriceId;
    int proId;
    String productMrp;
    String mrpValue;
    String productWeight;
    ProductWeightType productWeightType;
    bool availabilityFlag;
    int qty;

    PriceList({
        required this.prodPriceId,
        required this.proId,
        required this.productMrp,
        required this.mrpValue,
        required this.productWeight,
        required this.productWeightType,
        required this.availabilityFlag,
        required this.qty,
    });

    factory PriceList.fromJson(Map<String, dynamic> json) => PriceList(
        prodPriceId: json["prod_price_id"],
        proId: json["Pro_id"],
        productMrp: json["product_MRP"],
        mrpValue: json["MRPValue"],
        productWeight: json["product_weight"],
        productWeightType: productWeightTypeValues.map[json["product_weight_type"]]!,
        availabilityFlag: json["AvailabilityFlag"],
        qty: json["qty"],
    );

    Map<String, dynamic> toJson() => {
        "prod_price_id": prodPriceId,
        "Pro_id": proId,
        "product_MRP": productMrp,
        "MRPValue": mrpValue,
        "product_weight": productWeight,
        "product_weight_type": productWeightTypeValues.reverse[productWeightType],
        "AvailabilityFlag": availabilityFlag,
        "qty": qty,
    };
}

enum ProductWeightType {
    KG
}

final productWeightTypeValues = EnumValues({
    "kg": ProductWeightType.KG
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
