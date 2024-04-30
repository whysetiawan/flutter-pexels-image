import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.white,
            automaticIndicatorColorAdjustment: true,
            tabs: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 16.w,
                ),
                child: Text(
                  "Harga Udang",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const Text("Kabar Udang"),
              const Text("Penyakit"),
            ],
          ),
        ),
      ),
    );
  }
}
