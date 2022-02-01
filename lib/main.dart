import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_search_0130/data/data_source/pixabay_api.dart';
import 'package:image_search_0130/domain/use_case/get_photos_use_case.dart';
import 'package:image_search_0130/presentation/home/home_screen.dart';
import 'package:image_search_0130/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

import 'data/repository/photo_api_repository_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => HomeViewModel(GetPhotosUseCase(
            PhotoApiRepositoryImpl(PixabayApi(http.Client())))),
        child: const HomeScreen(),
      ),
    );
  }
}
