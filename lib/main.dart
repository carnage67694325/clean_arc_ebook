import 'package:clean_arc_bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:clean_arc_bookly/Features/home/data/data_sources/home_remote_data_resource.dart';
import 'package:clean_arc_bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:clean_arc_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arc_bookly/Features/home/domain/repos/home_repo.dart';
import 'package:clean_arc_bookly/Features/home/domain/use_cases/fetch_books_use_case.dart';
import 'package:clean_arc_bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arc_bookly/constants.dart';
import 'package:clean_arc_bookly/core/utils/api_service.dart';
import 'package:clean_arc_bookly/core/utils/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Features/Splash/presentation/views/splash_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            FetchBooksUseCase(
              homeRepo: HomeRepoImpl(
                  homeRemoteDataSource: HomeRemoteDataSourceImpl(
                    apiService: ApiService(
                      Dio(),
                    ),
                  ),
                  homeLocalDataSource: HomeDatalocalSourceImp()),
            ),
          ),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
