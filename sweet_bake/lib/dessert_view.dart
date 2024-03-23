import 'package:flutter/material.dart';

class DessertView extends StatelessWidget {
  final dessert;
  const DessertView(this.dessert, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Material(
        elevation: 5,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image.network(dessert.thumbnail),
              Container(
                height: 60,
                width: double.infinity,
                color: Colors.white.withOpacity(0.8),
                alignment: Alignment.center,
                child: Text(
                  dessert.title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
