import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:thetazero/constant/constants.dart';
import 'package:thetazero/model/product_model.dart';
import 'package:thetazero/provider/product_provider.dart';

class ProductInfoScreen extends StatefulWidget {
  Datum data;
  ProductInfoScreen({super.key, required this.data});

  @override
  State<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  List weight = ["500 gm", "1kg", "2kg", "3kg"];
  int _selectedIndex=-1;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    return Scaffold(appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 70,
            title: const Text("Product Info"),
            // actions: [
            //   Row(
            //     children: [
            //       const Icon(Icons.qr_code_scanner_sharp),
            //       spacer3WidthD,
            //       const Icon(Icons.store),
            //       spacer3WidthD,
            //       const Icon(Icons.shopping_cart_rounded),
            //       spacer3WidthD,
            //     ],
            //   )
            // ],
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                    Color(0xFF5DB756),
                    Color(0xFF1399AD),
                  ])),
            ),
          ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Positioned(child: Icon(Icons.help_sharp)),
                Hero(
                    tag: "Product${widget.data.productId}",
                    child: Image.network(
                      widget.data.productSmallImg,
                      scale: 1,
                    )),
                Text(widget.data.productName),
                SizedBox(
                  height: 10.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: weight.length,
                    itemBuilder: (context, index) {
                      return ActionChip(backgroundColor: _selectedIndex==index ?Colors.green:Colors.grey.shade300,
                        label: Text(weight[index]),
                        onPressed: () {
                          setState(() {
                            _selectedIndex=index;
                          });
                        },
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    // addData++;
                                  });
                                },
                                child: Icon(
                                  CupertinoIcons.plus,
                                  size: 3.h,
                                )),
                            Text(" 1 "),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    // addData--;
                                  });
                                },
                                child: Icon(
                                  CupertinoIcons.minus,
                                  size: 3.h,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text("₹ ${widget.data.priceList[0].mrpValue}",
                            style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough)),
                        spacer10WidthD,
                        Text("₹ ${widget.data.priceList[0].productMrp}"),
                      ],
                    )
                  ],
                ),
                Text("Description"),
                spacer10Height,
                Text(widget.data.productDescription),
              ],
            ),
        
            Positioned(right: 1,child: Icon(Icons.help_center)),Positioned(right: 10.w,child: Icon(Icons.help_center))  ],
        ),
      ),
    );
  }
}
