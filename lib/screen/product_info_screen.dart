import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  List weight = ["500 gm", " 1kg ", " 2kg ", " 3kg "];
  int _selectedIndex = -1;

  int addData = 0;
  bool _fav = false;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 3.h),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                  tag: "Product${widget.data.productId}",
                  child: Image.network(
                    widget.data.productSmallImg,
                    scale: 1,
                  )),
                  Text(widget.data.productName,
                    style: GoogleFonts.inter(
                        fontSize: 13.sp, fontWeight: FontWeight.w700),),
                  SizedBox(
                    height: 10.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: weight.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ActionChip(
                            elevation: 1,
                            backgroundColor: _selectedIndex == index
                                ? Colors.green
                                : Colors.grey.shade200,
                            label: Text(weight[index],style: GoogleFonts.inter(color: _selectedIndex == index
                                ? Colors.white
                                :Colors.black),),
                            onPressed: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 30.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                               Text(" $addData "),
                              InkWell(
                                  onTap: () {
                                   if (addData==0) {
                                     
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text("You don't have this productt")));
                                   }else{
                                     setState(() {
                                      addData--;
                                    });
                                   }
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
                              style: const TextStyle(
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough)),
                          spacer5WidthD,
                          Text("₹ ${widget.data.priceList[0].productMrp}",
                    style: GoogleFonts.inter(
                        fontSize: 15.sp, fontWeight: FontWeight.w700),),
                        ],
                      )
                    ],
                  ),
      
                  spacer20Height,
                  Text(
                    "Description",
                    style: GoogleFonts.inter(
                        fontSize: 13.sp, fontWeight: FontWeight.w700),
                  ),
                  spacer10Height,
                  Text(widget.data.productDescription,
                    style: GoogleFonts.inter(
                        fontSize: 11.sp, fontWeight: FontWeight.w500),),


                        
                ],
              ),
              Positioned(
                  right: 1.w,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.red)),
                        child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.movie_edit,
                              color: Colors.red,
                            ))),
                  )),
              Positioned(
                  right: 17.w,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _fav = !_fav;
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _fav
                              ? const Icon(
                                  Icons.favorite_sharp,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Colors.grey,
                                ),
                        )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
