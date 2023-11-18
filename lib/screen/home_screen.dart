import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:thetazero/constant/constants.dart';
import 'package:thetazero/provider/product_provider.dart';
import 'package:thetazero/screen/product_info_screen.dart';

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

  List productCart = [];
  int addData = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 34) / 2;
    final double itemWidth = size.width / 2;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 70,
            title:  Text("dailefresh",style: GoogleFonts.poppins(fontWeight: FontWeight.w600),),
            leading: Icon(
              CupertinoIcons.line_horizontal_3,
              size: 26.sp,
            ),
            actions: [
              Row(
                children: [
                  const Icon(Icons.qr_code_scanner_sharp),
                  spacer3WidthD,
                  const Icon(Icons.store),
                  spacer3WidthD,
                  Badge(
                      label: Text(productCart.length.toString()),
                      child: const Icon(Icons.shopping_cart_rounded)),
                  spacer3WidthD,
                ],
              )
            ],
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
          body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (itemWidth / itemHeight),
              ),
              itemCount: provider.productModal == null
                  ? 0
                  : provider.productModal?.data.length,
              itemBuilder: (context, index) {
                var data = provider.productModal?.data[index];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ProductInfoScreen(
                                    data: data,
                                  )));
                    },
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: EdgeInsets.all(0.9.h),
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Stack(
                                    children: [
                                      Hero(
                                        tag: "Product${data!.productId}",
                                        child: Container(
                                            child: Image.network(data.productSmallImg),
                                            ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 0.6.h),
                                          child: Text(
                                            "${data.discountValue}% Off",
                                            style: GoogleFonts.inter(
                                                color: white, fontSize: 8.sp),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                  // child: Hero(
                                  //   tag: "Product${data!.productId}",
                                  //   child: Container(
                                  //     child: Image.network(data.productSmallImg),
                                  //   ),
                                  // )
                                  ),
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.productName,
                                        style: GoogleFonts.inter(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      spacer20Height,
                                      Container(
                                        // color: Colors.green,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: Container(
                                                    child: Center(
                                                  child: Text(
                                                      "₹ ${data.priceList[0].mrpValue}",
                                        style: GoogleFonts.inter(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700),),
                                                ))),
                                            Expanded(
                                                flex: 5,
                                                child:
                                                    productCart.contains(
                                                            data.productId)
                                                        ? InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                productCart
                                                                    .remove(data
                                                                        .productId);
                                                              });
                                                            },
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .green,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey)),
                                                                child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        vertical:
                                                                            8.0),
                                                                    child: Center(
                                                                        child: Text(
                                                                      "Added",
                                                                      style: GoogleFonts.inter(
                                                                          color:
                                                                              white),
                                                                    )))),
                                                          )
                                                        : InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                productCart.add(
                                                                    data.productId);
                                                              });
                                                            },
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .green)),
                                                                child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        vertical:
                                                                            8.0),
                                                                    child: Center(
                                                                        child: Text(
                                                                            "Add cart")))),
                                                          )

                                                //  Container(
                                                //   decoration: BoxDecoration(
                                                //       borderRadius:
                                                //           BorderRadius.circular(
                                                //               25),
                                                //       border: Border.all(
                                                //           color: Colors.grey)),
                                                //   child: Padding(
                                                //     padding: const EdgeInsets
                                                //         .symmetric(vertical: 8.0),
                                                //     child: Row(
                                                //       mainAxisAlignment:
                                                //           MainAxisAlignment
                                                //               .spaceEvenly,
                                                //       children: [
                                                //         InkWell(
                                                //             onTap: () {
                                                //               setState(() {
                                                //                 addData++;
                                                //               });
                                                //             },
                                                //             child: Icon(
                                                //               CupertinoIcons.plus,
                                                //               size: 2.h,
                                                //             )),
                                                //         Text("$addData",
                                                //             style:
                                                //                 GoogleFonts.inter(
                                                //                     fontSize:
                                                //                         11.sp,
                                                //                     fontWeight:
                                                //                         FontWeight
                                                //                             .w600)),
                                                //         InkWell(
                                                //             onTap: () {
                                                //               setState(() {
                                                //                 addData--;
                                                //               });
                                                //             },
                                                //             child: Icon(
                                                //               CupertinoIcons
                                                //                   .minus,
                                                //               size: 2.h,
                                                //             ))
                                                //       ],
                                                //     ),
                                                //   ),
                                                // ),

                                                )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
