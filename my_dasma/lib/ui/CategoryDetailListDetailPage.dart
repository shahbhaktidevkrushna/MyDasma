import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CategoryDetailListDetailPage extends StatefulWidget {
  const CategoryDetailListDetailPage({Key? key}) : super(key: key);

  @override
  _CategoryDetailListDetailPageState createState() => _CategoryDetailListDetailPageState();
}

class _CategoryDetailListDetailPageState extends State<CategoryDetailListDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Category detail list detail Page",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),)),
    );
  }
}
