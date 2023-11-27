import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelo/application/state_holder_binder.dart';
import 'package:travelo/presentation/ui/screens/splash_screen.dart';

class Travelo extends StatelessWidget {
  const Travelo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travelo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: StateHolderBinder(),
      home: const SplashScreen(),
    );
  }
}
