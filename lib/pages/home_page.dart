import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pexels_image/modules/photos/presentation/bloc/photos_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<PhotosBloc>().add(GetPhotosEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LazyLoadScrollView(
        child: BlocBuilder<PhotosBloc, PhotosState>(
          builder: (context, state) {
            if (state.status.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Scrollbar(
              child: ListView.builder(
                itemCount: state.photos.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  final photo = state.photos[index];

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: AspectRatio(
                            aspectRatio: photo.width / photo.height,
                            child: CachedNetworkImage(
                              imageUrl: photo.url,
                              placeholder: (context, url) => Center(
                                child: const CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.w),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
        onEndOfPage: () {},
      ),
    );
    // return DefaultTabController(
    //   length: 3,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       toolbarHeight: 56.w,
    //       title: const Text("Jala Media"),
    //       bottom: PreferredSize(
    //         preferredSize: Size.fromHeight(52.w),
    //         child: Material(
    //           color: Colors.white,
    //           child: TabBar(
    //             automaticIndicatorColorAdjustment: true,
    //             labelColor: Colors.blue,
    //             unselectedLabelColor: Colors.grey.shade500,
    //             dividerColor: Colors.transparent,
    //             labelStyle: TextStyles.title4,
    //             indicatorSize: TabBarIndicatorSize.tab,
    //             indicatorWeight: 4.0,
    //             tabs: <Widget>[
    //               Padding(
    //                 padding: EdgeInsets.symmetric(
    //                   vertical: 16.w,
    //                 ),
    //                 child: const Text("Harga Udang"),
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.symmetric(
    //                   vertical: 16.w,
    //                 ),
    //                 child: const Text("Kabar Udang"),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //     body: TabBarView(
    //       physics: const NeverScrollableScrollPhysics(),
    //       children: [
    //         BlocProvider(
    //           create: (context) => ShrimpPriceBloc(
    //             getShrimpPricesUseCase: sl(),
    //             getRegionsUseCase: sl(),
    //           ),
    //           child: const ShrimpPricePage(),
    //         ),
    //         BlocProvider(
    //           create: (context) => ShrimpNewsBloc(
    //             getShrimpNewsUseCase: sl(),
    //           ),
    //           child: const ShrimpNewsPage(),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
