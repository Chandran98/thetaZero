import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:thetazero/constant/constants.dart';
import 'package:thetazero/provider/product_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).getProduct();
  }

  int addData =0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   centerTitle: true,
          //   toolbarHeight: 70,
          //   title: const Text("widget"),
          //   actions: [
          //     Row(
          //       children: [
          //         const Icon(Icons.qr_code_scanner_sharp),
          //         spacer3WidthD,
          //         const Icon(Icons.store),
          //         spacer3WidthD,
          //         const Icon(Icons.shopping_cart_rounded),
          //         spacer3WidthD,
          //       ],
          //     )
          //   ],
          //   flexibleSpace: Container(
          //     decoration: const BoxDecoration(
          //         gradient: LinearGradient(
          //             begin: Alignment.centerLeft,
          //             end: Alignment.centerRight,
          //             colors: <Color>[
          //           Color(0xFF5DB756),
          //           Color(0xFF1399AD),
          //         ])),
          //   ),
          // ),
          body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: provider.productModal == null
                  ? 0
                  : provider.productModal?.data.length,
              itemBuilder: (context, index) {
                var data = provider.productModal?.data[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                child: Image.network(data!.productSmallImg),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                // color: Colors.green,
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: Container(
                                            child: Center(
                                          child:
                                              Text(data!.priceList[0].mrpValue),
                                        ))),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      addData++;
                                                    });
                                                  },
                                                  child: Icon(
                                                    CupertinoIcons.plus,
                                                    size: 3.h,
                                                  )),
                                              Text("$addData"),
                                              InkWell(
                                                  onTap: () {
 setState(() {
                                                      addData--;
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
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
