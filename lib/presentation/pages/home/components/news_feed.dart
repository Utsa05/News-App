// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';

import 'package:news_zone/commons/size_constants.dart';
import 'package:news_zone/domain/enteties/news_entity.dart';
import 'package:news_zone/presentation/cubits/news_cubit/news_cubit.dart';
import 'package:news_zone/presentation/themes/app_color.dart';
import 'package:news_zone/presentation/widgets/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  NewsCubit get newsCubit => BlocProvider.of<NewsCubit>(context);
  @override
  void initState() {
    newsCubit.loadNews();

    //newsCubit.loadbycategoryNews('business');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
          final List<NewsEntity> news = state.news;
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: AppSize.dimen_10),
              itemCount: news.length,
              itemBuilder: (context, index) {
                final NewsEntity newsItem = news[index];
                return NewsItem(newsEntity: newsItem);
              });
        } else if (state is NewsError) {
          Center(
            child: TextWidget(
              title: state.errorType.name,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class NewsItem extends StatelessWidget {
  const NewsItem({
    Key? key,
    required this.newsEntity,
  }) : super(key: key);
  final NewsEntity newsEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppSize.dimen_10),
      height: AppSize.dimen_350.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.dimen_16.r),
          color: AppColor.blackColor.withOpacity(0.2),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  AppColor.blackColor.withOpacity(0.1), BlendMode.darken),
              image: NetworkImage(newsEntity.urlToImage.toString()),
              fit: BoxFit.cover)),
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
              bottom: AppSize.dimen_0.h,
              child: Container(
                  padding: const EdgeInsets.all(AppSize.dimen_10),
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                      color: AppColor.whiteColor.withOpacity(0.4),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                          AppSize.dimen_20.r,
                        ),
                      )),
                  child: Column(
                    children: [
                      TextWidget(
                        line: 2,
                        title: newsEntity.title,
                        size: AppSize.dimen_18.sp,
                      ),
                      const SizedBox(
                        height: AppSize.dimen_8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.dimen_6,
                                vertical: AppSize.dimen_2),
                            decoration: BoxDecoration(
                                color: AppColor.pupleColor.withOpacity(0.7),
                                borderRadius:
                                    BorderRadius.circular(AppSize.dimen_4.r)),
                            child: TextWidget(
                              title: newsEntity.publishedAt
                                  .toString()
                                  .split(" ")
                                  .first,
                              size: AppSize.dimen_12.sp,
                              color: AppColor.whiteColor,
                            ),
                          )
                        ],
                      )

                      // Container(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: AppSize.dimen_8,
                      //       vertical: AppSize.dimen_4),
                      //   decoration: BoxDecoration(
                      //       color: AppColor.whiteColor.withOpacity(0.6),
                      //       borderRadius: BorderRadius.circular(
                      //           AppSize.dimen_16.r)),
                      //   child: TextWidget(
                      //     title: "Publiesd add 20201/2203",
                      //   ),
                      // )
                    ],
                  )))
        ],
      ),
    );
  }
}
